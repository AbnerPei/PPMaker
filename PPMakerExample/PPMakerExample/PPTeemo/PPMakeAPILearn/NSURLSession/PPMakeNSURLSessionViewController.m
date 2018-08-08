//
//  PPMakeNSURLSessionViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/26.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeNSURLSessionViewController.h"

@interface PPMakeNSURLSessionViewController ()

@end

@implementation PPMakeNSURLSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _getAction];
}

-(void)_getAction
{
    //
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://app.bilibili.com/x/channel/list?actionKey=appkey&appkey=27eb53fc9058f8c3&build=6830&device=phone&mobi_app=iphone&platform=ios&sign=d29112aada1247359073720ac9e3c513&ts=1532596909&ver="];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
        NSLog(@"%@ %@ %@ %@", dict, response, error, [NSThread currentThread]);

        NSLog(@"current url %@ %@",response.URL.absoluteString,response.URL.relativeString);
    }];
    [dataTask resume];
    
}

@end
