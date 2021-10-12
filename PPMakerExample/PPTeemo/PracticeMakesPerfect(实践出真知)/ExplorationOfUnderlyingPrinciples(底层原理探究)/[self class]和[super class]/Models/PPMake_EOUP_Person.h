//
//  PPMake_EOUP_Person.h
//  PPMakerExample
//
//  Created by AbnerPei on 2021/9/20.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPMake_EOUP_Person : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSUInteger age;

@property (nonatomic, copy, nullable) NSString *address;

@end

NS_ASSUME_NONNULL_END
