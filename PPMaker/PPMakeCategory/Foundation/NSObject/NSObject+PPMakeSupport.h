//
//  NSObject+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PPMakeSupport)

/**
 * 交换同一个类两个方法
 *
 * @param originS 该类原有的方法
 * @param swizzledS 要替换的方法
 */
+(void)ppmake_swizzleWithOriginSelector:(SEL)originS
                       swizzledSelector:(SEL)swizzledS;
@end
