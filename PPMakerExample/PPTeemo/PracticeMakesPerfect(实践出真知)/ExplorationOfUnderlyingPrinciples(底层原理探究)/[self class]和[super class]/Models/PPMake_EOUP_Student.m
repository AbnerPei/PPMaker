//
//  PPMake_EOUP_Student.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/9/20.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMake_EOUP_Student.h"

@implementation PPMake_EOUP_Student

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self test];
    }
    return self;
}

- (void)test
{
    NSLog(@"[self class] = %@\n", NSStringFromClass([self class]));
    NSLog(@"[super class] = %@", NSStringFromClass([super class]));
}
@end
