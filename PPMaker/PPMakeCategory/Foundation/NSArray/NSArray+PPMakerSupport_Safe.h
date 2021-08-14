//
//  NSArray+PPMakerSupport_Safe.h
//  Masonry
//
//  Created by AbnerPei on 2021/8/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (PPMakerSupport_Safe)

- (nullable ObjectType)ppmake_objectAtIndex:(NSInteger)index;


/// 获取指定的下标下的元素，并验证元素是否是指定的类型
/// @param index 指定的下标
/// @param specifiedClass 指定的类型
- (nullable ObjectType)ppmake_objectAtIndex:(NSInteger)index specifiedClass:(nullable Class)specifiedClass;

@end

NS_ASSUME_NONNULL_END
