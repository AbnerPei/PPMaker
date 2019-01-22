//
//  BlockModel.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/28.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "BlockModel.h"

@implementation BlockModel
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self compileBlockDemo];
    }
    return self;
    
}
-(void)compileBlockDemo
{
    int abc = 10086;
    void(^block)(int number) = ^(int number) {
        NSLog(@"compileBlockDemo -- %d",number);
    };
    
    block(abc);
    

}
// clang  -rewrite-objc BlockModel.m
@end
