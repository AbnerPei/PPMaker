//
//  NSMutableArray+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/29.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray<ObjectType> (PPMakeSupport)

@end

@interface NSMutableArray<ObjectType> (PPMakeExtendedMutableArray)

/**
 * 可变数组添加一个不重复的元素 ，如果可以重复，请用系统的addObject:方法
 *
 * 示例：
 *   NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@1,@2,@3,@4]];
 *   [arr ppmake_addObjectIfNotExist:@4];
 *   [arr ppmake_addObjectIfNotExist:@1];
 *   [arr ppmake_addObjectIfNotExist:@8];
 *   NSLog(@"%@",arr);
 *   //打印结果 [1,2,3,4,8]
 */
- (void)ppmake_addObjectIfNotExist:(ObjectType)anObject;

@end
