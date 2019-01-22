//
//  PPMakeDeepCopyAndShallowCopyViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/22.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeDeepCopyAndShallowCopyViewController.h"

@interface PPMakeDeepCopyAndShallowCopyViewController ()

@end

@implementation PPMakeDeepCopyAndShallowCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *str1 = @"我是字符串";
    NSString *str2 = [str1 copy];
    NSMutableString *str3 = [str1 mutableCopy];
    NSString *str4 = [str1 mutableCopy];
    NSString *str5 = [str4 copy];
    
    NSLog(@"str1 is %@\n",str1);
    NSLog(@"str2 is %@\n",str2);
    NSLog(@"str3 is %@\n",str3);
    NSLog(@"str4 is %@\n",str4);
    NSLog(@"str5 is %@\n",str5);
    
    /*
     
     (lldb) p str1
     (__NSCFConstantString *) $0 = 0x00000001071e6308 @"我是字符串"
     (lldb) p str2
     (__NSCFConstantString *) $1 = 0x00000001071e6308 @"我是字符串"
     (lldb) p str3
     (__NSCFString *) $2 = 0x000060400044b6a0 @"我是字符串"
     (lldb) p str4
     (__NSCFString *) $3 = 0x000060400044b700 @"我是字符串"
     (lldb) p str5
     (__NSCFString *) $4 = 0x000060400044b730 @"我是字符串"
     (lldb)
     
     */


}
@end
