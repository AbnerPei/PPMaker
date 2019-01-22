//
//  NSIndexPath+PPMakeEasilyDebug.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/4.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "NSIndexPath+PPMakeEasilyDebug.h"

@implementation NSIndexPath (PPMakeEasilyDebug)
- (void)ppmake_debugLog
{
    NSString *str = [self ppmake_debugDescription];
    NSLog(@"%@",str);
}
- (NSString *)ppmake_debugDescription
{
    NSString *str = [NSString stringWithFormat:@"当前section为：%ld，row为：%ld",(long)self.section,(long)self.row];
    return str;
}
- (NSString *)ppmake_debugDescriptionAndLog
{
    NSString *str = [self ppmake_debugDescription];
    NSLog(@"%@",str);
    return str;
}
@end
