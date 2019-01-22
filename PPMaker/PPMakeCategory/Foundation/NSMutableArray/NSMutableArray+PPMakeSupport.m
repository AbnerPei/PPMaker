//
//  NSMutableArray+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/29.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "NSMutableArray+PPMakeSupport.h"

@implementation NSMutableArray (PPMakeSupport)

@end

@implementation NSMutableArray (PPMakeExtendedMutableArray)
/* 可变数组添加一个不重复的元素 ，如果可以重复，请用系统的addObject:方法 */
- (void)ppmake_addObject:(id)anObject
{
    if (![self containsObject:anObject]) {
        [self addObject:anObject];
    }
}
@end
