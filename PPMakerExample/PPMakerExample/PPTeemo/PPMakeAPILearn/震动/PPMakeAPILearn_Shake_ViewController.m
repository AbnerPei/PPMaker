//
//  PPMakeAPILearn_Shake_ViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/10.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeAPILearn_Shake_ViewController.h"
#import<AudioToolbox/AudioToolbox.h>
#import "XMNetworking.h"

@interface PPMakeAPILearn_Shake_ViewController ()

@end

@implementation PPMakeAPILearn_Shake_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSMutableArray<NSString *> *strs = [NSMutableArray arrayWithObject:@"123"];
//    NSString *str = strs[0];
//    printf("11 retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(str)));
//    [strs removeAllObjects];
//    printf("22 retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(str)));
    
    

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //震动
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
//    [self demo2];
    
//    [self tiger];
    
}
-(void)tiger
{
    //自选
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.httpMethod = kXMHTTPMethodGET;
        request.url = @"https://hq1.itiger.com/watchlist/get?market=ALL&group=0&manualRefresh=1&lite=0&device=iPhone%206%20Plus&deviceId=389e3721c9b2abf231dd8079525d29e0c09f37b5&appVer=6.4.2.0&vendor=AppStore&platform=iOS&channel=AppStore&lang=zh_CN&screenW=414&keyfrom=TigerBrokers.6.4.2.0.iPhone&screenH=736&osVer=12.0";
        request.headers = @{
//                            @"X-NewRelic-ID":@"XAUGVl9TGwYCXVFaBAk=",
//                            @"X-API-Version":@"v2",
                            @"Authorization":@"Bearer QsXpzA7ZsMCW2GpAEdNG9NXzgQfGSu"  //必传
                            };
    } onSuccess:^(id  _Nullable responseObject) {
        NSLog(@"success %@\n",responseObject);
    } onFailure:^(NSError * _Nullable error) {
        NSLog(@"failure %@\n",error);
    } onFinished:^(id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"finish %@ %@\n",responseObject,error);
    }];
    
    //美股
    //https://hq1.itiger.com/market?filterLeverage=1&device=iPhone%206%20Plus&deviceId=389e3721c9b2abf231dd8079525d29e0c09f37b5&appVer=6.4.2.0&vendor=AppStore&platform=iOS&channel=AppStore&lang=zh_CN&screenW=414&keyfrom=TigerBrokers.6.4.2.0.iPhone&screenH=736&osVer=12.0
    
    //港股
    //https://hq1.itiger.com/hkstock/market?device=iPhone%206%20Plus&deviceId=389e3721c9b2abf231dd8079525d29e0c09f37b5&appVer=6.4.2.0&vendor=AppStore&platform=iOS&channel=AppStore&lang=zh_CN&screenW=414&keyfrom=TigerBrokers.6.4.2.0.iPhone&screenH=736&osVer=12.0
    
    //社区--动态
    //https://frontend-community.tigerbbs.com/v7/user/feeds?pageCount=1&pageSize=20&type=1&device=iPhone%206%20Plus&deviceId=389e3721c9b2abf231dd8079525d29e0c09f37b5&appVer=6.4.2.0&vendor=AppStore&platform=iOS&channel=AppStore&lang=zh_CN&screenW=414&keyfrom=TigerBrokers.6.4.2.0.iPhone&screenH=736&osVer=12.0
    
    
}

-(void)demo2

{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 300)];
    
    label.numberOfLines = 0;
    
    [self.view addSubview:label];
    
    
    
    NSString *content = @"<p><a href=\"https://laohu8.com/S/JD\">$京东(JD)$</a> <a href=\"https://laohu8.com/S/BABA\">$阿里巴巴(BABA)$</a> 谁能告诉我，到底是先有走势才有消息，还是先有消息才有走势，搞不懂了。反弹的位置刚好出消息，真的太奇怪了，整个中概股一根直线上拉。</p> \n<img src=\"https://static.tigerbbs.com/56cb9cc6155bb468fc1f0aef37a3286b\" tg-width=\"750\" tg-height=\"1334\"> \n<img src=\"https://static.tigerbbs.com/251a9f6dbe5e532fc9b612577702e76c\" tg-width=\"750\" tg-height=\"1334\"> \n<img src=\"https://static.tigerbbs.com/02185513c03d430b777ea8ed7154014a\" tg-width=\"1080\" tg-height=\"1920\">";
    
    //@"<p style=\"font-family:verdana;color:red\">    This text <a style=\"font-family:times;color:green;font-size:30px\">This text is in Times and green</a>is in Verdana and red</p><p style=\"font-size:50px\">This text is 50 pixels high</p>";
    
    
    
    NSData *data = [content dataUsingEncoding:NSUnicodeStringEncoding];
    
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    
    NSAttributedString *html = [[NSAttributedString alloc]initWithData:data
                                
                                                               options:options
                                
                                                    documentAttributes:nil
                                
                                                                 error:nil];
    
    
    
    label.attributedText = html;
    
}


@end
