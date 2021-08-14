//
//  NSMutableArray+PPMakerSupport_Safe.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/7/10.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "NSMutableArray+PPMakerSupport_Safe.h"

@implementation NSMutableArray (PPMakerSupport_Safe)

- (void)ppmake_addObject:(id)anObject
{
    if (!anObject) {
#if DEBUG
        NSAssert(NO, @"往数组里添加（add）的元素不能为nil。");
#endif
        return;
    }
    [self addObject:anObject];
}

- (void)ppmake_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (!anObject) {
#if DEBUG
        NSAssert(NO, @"往数组里添加（insert）的元素不能为nil。");
#endif
        return;
    }
    
    if (index > self.count) {
#if DEBUG
        NSAssert(NO, @"index不能大于数组元素总数。");
#endif
    }
    
    [self insertObject:anObject atIndex:index];
}

- (void)ppmake_removeLastObject
{
    if (self.count < 1) {
        return;
    }
    
    [self removeLastObject];
}

- (void)ppmake_removeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
#if DEBUG
        NSAssert(NO, @"当前index无效（大于等于数组count了）。");
#endif
        return;
    }
    
    [self removeObjectAtIndex:index];
}

- (void)ppmake_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (index >= self.count) {
#if DEBUG
        NSAssert(NO, @"当前index无效（大于等于数组count了）。");
#endif
        return;
    }
    
    if (!anObject) {
#if DEBUG
        NSAssert(NO, @"替换的元素不能为nil。");
#endif
        return;
    }
    
    [self ppmake_replaceObjectAtIndex:index withObject:anObject];
}

- (void)ppmake_addObjectsFromArray:(NSArray *)otherArray
{
    if ([otherArray isKindOfClass:[NSArray class]]) {
#if DEBUG
        NSAssert(NO, @"添加的数组要是NSArray类型的。");
#endif
        return;
    }
    
    if (otherArray.count < 1) {
        return;
    }
    
    [self addObjectsFromArray:otherArray];
}

- (void)ppmake_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
    if (idx1 >= self.count) {
#if DEBUG
        NSAssert(NO, @"idx1无效（大于等于数组count了）。");
#endif
        return;
    }
    
    if (idx2 >= self.count) {
#if DEBUG
        NSAssert(NO, @"idx2无效（大于等于数组count了）。");
#endif
        return;
    }
    
    [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}

- (void)ppmake_removeAllObjects
{
    if (self.count < 1) {
        return;
    }
    
    [self removeAllObjects];
}

- (void)ppmake_removeObject:(id)anObject
{
    if (!anObject) {
        return;
    }
    
    [self removeObject:anObject];
}

@end
