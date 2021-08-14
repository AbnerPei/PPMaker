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

- (void)ppmake_addObjectIfNotExist:(id)anObject
{
    if (!anObject) {
#if DEBUG
        NSAssert(NO, @"往数组里添加（add）的元素不能为nil。");
#endif
        return;
    }
    
    if (![self containsObject:anObject]) {
        [self addObject:anObject];
    }
}
@end
