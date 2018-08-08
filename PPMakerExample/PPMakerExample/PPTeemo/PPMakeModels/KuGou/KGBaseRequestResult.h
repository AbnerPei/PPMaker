//
//  KGBaseRequestResult.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/27.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KGBaseRequestResult : NSObject
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger errcode;
@property (nonatomic, copy)   NSString *error;
@end
