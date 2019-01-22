//
//  NSObject+PPMakeSupport_KVO.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/22.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^PGObservingBlock)(id observedObject,NSString *observedKey,id oldValue,id newValue);
/**
 * 自定义KVO
 */
@interface NSObject (PPMakeSupport_KVO)
- (void)PG_addObserver:(NSObject *)observer
                forKey:(NSString *)key
             withBlock:(PGObservingBlock)block;
- (void)PG_removeObserver:(NSObject *)observer forKey:(NSString *)key;
- (void)ppmake_addObserver:(NSObject *)observer
               forKeyPath:(NSString *)keyPath
                  options:(NSKeyValueObservingOptions)options
                  context:(void *)context;
@end
