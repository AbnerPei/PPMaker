//
//  NSMutableArray+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/29.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (PPMakeSupport)

@end

@interface NSMutableArray (PPMakeExtendedMutableArray)
/**
 * 可变数组添加一个不重复的元素 ，如果可以重复，请用系统的addObject:方法
 *
 * 示例：
 *   NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@1,@2,@3,@4]];
 *   [arr ppmake_addObject:@4];
 *   [arr ppmake_addObject:@1];
 *   [arr ppmake_addObject:@8];
 *   NSLog(@"%@",arr);
 *   //打印结果 [1,2,3,4,8]
 */
- (void)ppmake_addObject:(id)anObject;
@end
