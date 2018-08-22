//
//  NSObject+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "NSObject+PPMakeSupport.h"
#import <objc/runtime.h>

@implementation NSObject (PPMakeSupport)

+(void)ppmake_swizzleWithOriginSelector:(SEL)originS
                       swizzledSelector:(SEL)swizzledS
{
    Method originalMethod = class_getInstanceMethod([self class], originS);
    Method swizzledMethod = class_getInstanceMethod([self class], swizzledS);
    
    BOOL hasAddMethod = class_addMethod([self class], originS, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (hasAddMethod){
        class_replaceMethod([self class], swizzledS, method_getImplementation(originalMethod),method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
