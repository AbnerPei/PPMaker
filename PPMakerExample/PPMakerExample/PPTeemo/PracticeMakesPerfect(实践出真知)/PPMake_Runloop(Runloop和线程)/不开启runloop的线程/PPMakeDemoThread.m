//
//  PPMakeDemoThread.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/3.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeDemoThread.h"

@implementation PPMakeDemoThread
-(void)dealloc
{
     NSLog(@"%s %@线程被释放了",__func__,self.name);
}
@end
