//
//  PPMakePerson.h
//  PPMakerExample
//
//  Created by AbnerPei on 2021/8/14.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PPMakeDog;

NS_ASSUME_NONNULL_BEGIN

@interface PPMakePerson : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy, nullable) NSString *nickName;

/// 曾用名
@property (nonatomic, copy, nullable) NSString *formerName;

@property (nonatomic, strong, nullable) PPMakeDog *dog;

@end

NS_ASSUME_NONNULL_END
