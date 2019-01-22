//
//  PPMake_QiNiu_ViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/14.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake_QiNiu_ViewController.h"
#import <Qiniu/QiniuSDK.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <HappyDNS/HappyDNS.h>
#import <Qiniu/QN_GTM_Base64.h>

@interface PPMake_QiNiu_ViewController ()

@end

@implementation PPMake_QiNiu_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self demo];
}


//如何避免用户上传同名文件
//https://developer.qiniu.com/kodo/kb/1365/how-to-avoid-the-users-to-upload-files-with-the-same-key
-(void)demo
{
    QNConfiguration *config = [QNConfiguration build:^(QNConfigurationBuilder *builder) {
        //是否选择  https  上传
        builder.useHttps = YES;
        builder.zone = [QNFixedZone zone0];
    }];
    
    QNUploadOption *uploadOption = [[QNUploadOption alloc] initWithMime:nil progressHandler:^(NSString *key, float percent) {
        NSLog(@"上传进度 %.2f --- %@", percent,key);
    }
                                                                 params:nil
                                                               checkCrc:NO
                                                     cancellationSignal:nil];
    
    QNUploadManager *uploadManager = [[QNUploadManager alloc]initWithConfiguration:config];
    
    dispatch_semaphore_t semaphore =  dispatch_semaphore_create(3);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (int i = 0; i < 10 ; i++) {
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        dispatch_async(queue, ^{
            //异步下载图片的操作
            UIImage *img1 = [UIImage imageNamed:[NSString stringWithFormat:@"lol%003d",i]];
            NSData *imgData = UIImagePNGRepresentation(img1);
            [uploadManager putData:imgData key:nil token:[self getQiuNiuTokenWithAK:@"3dRcX8jaYyw3UEux_8fRPLBihj2J4mnVBBSbDc3Z" SK:@"9p1JHrHo6q0l9qwPkle94q11XBMXVBt8xg2nc6i7" bucket:@"ppabner-ios-demo" key:nil] complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                NSLog(@"上传成功 -- 第%d张",i);
            } option:uploadOption];
            
            dispatch_semaphore_signal(semaphore);
        });
    }
}
- (void)testGCD3
{
    dispatch_semaphore_t semaphore =  dispatch_semaphore_create(5);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (int i=0;i<100 ; i++) {
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        dispatch_async(queue, ^{
            NSLog(@"i = %d",i);
            //此处模拟一个 异步下载图片的操作
            sleep(2);
            dispatch_semaphore_signal(semaphore);
        });
    }
}
//3dRcX8jaYyw3UEux_8fRPLBihj2J4mnVBBSbDc3Z
//9p1JHrHo6q0l9qwPkle94q11XBMXVBt8xg2nc6i7
///<bucket>:<key>，
-(NSString *)getQiuNiuTokenWithAK:(NSString *)AK
                               SK:(NSString *)SK
                           bucket:(NSString *)bucket
                              key:(NSString *)key
{
//    /*
//     http://www.cnblogs.com/HMJ-29/p/7148799.html
//    生成token的方法是：
//    第一步：确定上策略
//    第二步：将上传策略序列化为json格式
//    {"scope":"你的bucket","deadline":有效时间，默认是一个小时}
//    第三步：对json序列化后的上传策略进行URL安全的Base64编码,得到encoded
//    第四步：用SecretKey对编码后的上传策略进行HMAC-SHA1加密，并且做URL安全的Base64编码，得到encoded_signed
//    第五步：将 AccessKey、encode_signed 和 encoded 用 “:” 连接起来,得到UploadToken:
//     */

    
    if (!AK.length || !SK.length || !bucket.length) {
        return nil;
    }
    
    // 将上传策略中的scrop和deadline序列化成json格式
    NSMutableDictionary *authInfo = [NSMutableDictionary dictionary];
    [authInfo setObject:bucket forKey:@"scope"];
    [authInfo
     setObject:[NSNumber numberWithLong:[[NSDate date] timeIntervalSince1970] + 1 * 24 * 3600]
     forKey:@"deadline"];
    
    NSData *jsonData =
    [NSJSONSerialization dataWithJSONObject:authInfo options:NSJSONWritingPrettyPrinted error:nil];
    
    // 对json序列化后的上传策略进行URL安全的base64编码
    NSString *encodedString = [self urlSafeBase64Encode:jsonData];
    
    // 用secretKey对编码后的上传策略进行HMAC-SHA1加密，并且做安全的base64编码，得到encoded_signed
    NSString *encodedSignedString = [self HMACSHA1:SK text:encodedString];
    
    // 将accessKey、encodedSignedString和encodedString拼接，中间用:拼接，就是上传的token
    NSString *token =
    [NSString stringWithFormat:@"%@:%@:%@", AK, encodedSignedString, encodedString];
    
    return token;
}
- (NSString *)urlSafeBase64Encode:(NSData *)text {
    NSString *base64 =
    [[NSString alloc] initWithData:[QN_GTM_Base64 encodeData:text] encoding:NSUTF8StringEncoding];
    base64 = [base64 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    base64 = [base64 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    return base64;
}
- (NSString *)HMACSHA1:(NSString *)key text:(NSString *)text {
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [text cStringUsingEncoding:NSUTF8StringEncoding];
    
    char cHMAC[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
    NSString *hash = [self urlSafeBase64Encode:HMAC];
    return hash;
}


@end
