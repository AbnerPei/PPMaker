//
//  PPMakeDog.h
//  PPMakerExample
//
//  Created by AbnerPei on 2021/8/14.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPMakeDog : NSObject

/// 狗的昵称
@property (nonatomic, copy, nullable) NSString *nickName;

/// 狗的品类名
/// 金毛：Golden Retriever
/// 哈士奇：Husky
/// 柯基：Corgi
@property (nonatomic, copy) NSString *breedName;

@end

NS_ASSUME_NONNULL_END
