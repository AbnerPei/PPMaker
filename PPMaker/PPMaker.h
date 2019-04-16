//
//  PPMaker.h
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#ifndef PPMaker_h
#define PPMaker_h

//【warning】 注意引入头文件是 #import "PPMaker.h",而不是#import "PPMake.h"
//【warning】 注意引入头文件是 #import "PPMaker.h",而不是#import "PPMake.h"
//【warning】 注意引入头文件是 #import "PPMaker.h",而不是#import "PPMake.h"

//UIKit
#import "PPMake.h"
#import "PPMake+UILabel.h"
#import "PPMake+UITableView.h"
#import "PPMake+UIButton.h"
#import "PPMake+UIImageView.h"

//Foundation
#if __has_include(<PPMaker/PPMutAttributedStringMaker.h>)
#import <PPMaker/PPMutAttributedStringMaker.h>
#endif

NS_ASSUME_NONNULL_BEGIN

CG_INLINE NSUserDefaults *userDefaults(){
    return [NSUserDefaults standardUserDefaults];
}

CG_INLINE void ud_Sync(){
    [userDefaults() synchronize];
}

CG_INLINE void ud_setObject(__nullable id value,NSString *key){
    [userDefaults() setObject:value forKey:key];
    ud_Sync();
}

NS_ASSUME_NONNULL_END

#endif /* PPMaker_h */
