//
//  NSMutableArray+PPMakerSupport_Safe.h
//  PPMakerExample
//
//  Created by AbnerPei on 2021/7/10.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// `NSMutableArray`安全处理，当出现异常时，`debug`环境会崩溃，而正式环境忽略！！！
@interface NSMutableArray<ObjectType> (PPMakerSupport_Safe)

- (void)ppmake_addObject:(ObjectType)anObject;

- (void)ppmake_insertObject:(ObjectType)anObject atIndex:(NSUInteger)index;

- (void)ppmake_removeLastObject;

- (void)ppmake_removeObjectAtIndex:(NSUInteger)index;

- (void)ppmake_replaceObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject;

- (void)ppmake_addObjectsFromArray:(NSArray<ObjectType> *)otherArray;

- (void)ppmake_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;

- (void)ppmake_removeAllObjects;

- (void)ppmake_removeObject:(ObjectType)anObject;

@end

NS_ASSUME_NONNULL_END
