//
//  NSArray+PPMakerSupport_Safe.m
//  Masonry
//
//  Created by AbnerPei on 2021/8/14.
//

#import "NSArray+PPMakerSupport_Safe.h"

@implementation NSArray (PPMakerSupport_Safe)

- (id)ppmake_objectAtIndex:(NSInteger)index
{
    /// 首先要判断是否小于0，系统`objectAtIndex:`的参数NSUInteger类型
    if (index < 0) {
        return nil;
    }
    
    if (self.count > index) {
        return [self objectAtIndex:index];
    }
    
    return nil;
}

- (id)ppmake_objectAtIndex:(NSInteger)index specifiedClass:(Class)specifiedClass
{
    id object = [self ppmake_objectAtIndex:index];
    
    if (specifiedClass && object) {
        if ([object isKindOfClass:specifiedClass]) {
            return object;
        }
    }
    return nil;
}
@end
