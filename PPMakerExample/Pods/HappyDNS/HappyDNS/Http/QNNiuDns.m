//
//  QNNiuDns.m
//  HappyDNS
//
//  Created by 何昊宇 on 2018/3/8.
//  Copyright © 2018年 Qiniu Cloud Storage. All rights reserved.
//

#import "QNNiuDns.h"
#import "QNDes.h"
#import "QNDomain.h"
#import "QNHex.h"
#import "QNNetworkInfo.h"
#import "QNRecord.h"
#import "QNMD5.h"

#define ENDPOINT_SSL @"https://httpdns.qnydns.net:18443/"
#define ENDPOINT     @"http://httpdns.qnydns.net:18302/"

@interface QNNiuDns ()

@property (nonatomic, strong) QNDes *des;

@end

@implementation QNNiuDns

- (instancetype)initWithAccountId:(NSString *)accountId
                       encryptKey:(NSString *)encryptKey
                       expireTime:(long)expireTime
                          isHttps:(BOOL)isHttps
                  isNeedEncrypted:(BOOL)isNeedEncrypted  {
    if (self = [super init]) {
        _accountId = accountId;
        _expireTime = expireTime;
        _isHttps = isHttps;
        _isNeedEncrypted = isNeedEncrypted;
        if (encryptKey) {
            _encryptKey = encryptKey;
            _des = [[QNDes alloc] init:[encryptKey dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    return self;
}

- (NSString *)encrypt:(NSString *)domain {
    NSData *data = [_des encrypt:[domain dataUsingEncoding:NSUTF8StringEncoding]];
    if (data == nil) {
        return nil;
    }
    NSString *str = [QNHex encodeHexData:data];
    return str;
}

- (NSArray *)decrypt:(NSString *)raw {
    NSData *enc = [QNHex decodeHexString:raw];
    if (enc == nil) {
        return nil;
    }
    NSData *data = [_des decrpyt:enc];
    if (data == nil) {
        return nil;
    }
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
}

- (NSArray *)query:(QNDomain *)domain networkInfo:(QNNetworkInfo *)netInfo error:(NSError *__autoreleasing *)error {

    NSString *realDomain = domain.domain;
    if (self.isNeedEncrypted) {
        realDomain = [self encrypt:[NSString stringWithFormat:@"%@", domain.domain]];
        if (realDomain == nil) {
            if (error != nil) {
                *error = [[NSError alloc] initWithDomain:domain.domain code:kQN_ENCRYPT_FAILED userInfo:nil];
            }
            return nil;
        }
    }
    NSString * md = [NSString stringWithFormat:@"%@-%@-%ld",domain.domain,self.encryptKey,self.expireTime];
    NSString *s = [QNMD5 MD5:md];
    NSString *url = [NSString stringWithFormat:@"%@%@/d?dn=%@&e=%@&s=%@&ttl=1&echo=1", self.isHttps? ENDPOINT_SSL : ENDPOINT, self.accountId, realDomain,[NSString stringWithFormat:@"%ld",self.expireTime],s];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:QN_DNS_DEFAULT_TIMEOUT];
    NSHTTPURLResponse *response = nil;
    NSError *httpError = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
                                         returningResponse:&response
                                                     error:&httpError];

    if (httpError != nil) {
        if (error != nil) {
            *error = httpError;
        }
        return nil;
    }
    if (response.statusCode != 200) {
        return nil;
    }

    NSDictionary *raw = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (raw == nil) {
        if (error != nil) {
            *error = [[NSError alloc] initWithDomain:domain.domain code:kQN_DECRYPT_FAILED userInfo:nil];
        }
        return nil;
    }
    NSArray *rawArray;
    if (self.isNeedEncrypted) {
        rawArray = [self decrypt:raw[@"data"]][0];
    } else {
        rawArray = raw[@"data"][0];
    }
    if (rawArray.count <= 0) {
        return nil;
    }
    NSMutableArray *ret = [[NSMutableArray alloc] initWithCapacity:rawArray.count];
    for (int i = 0; i < rawArray.count; i++) {
        NSDictionary *dataDic = [rawArray objectAtIndex:i];
        if ([[dataDic objectForKey:@"TTL"] longValue] <= 0) {
            continue;
        }
        QNRecord *record = [[QNRecord alloc] init:[dataDic objectForKey:@"data"] ttl:[[dataDic objectForKey:@"TTL"] intValue] type:kQNTypeA];
        [ret addObject:record];
    }
    return ret;
}

@end
