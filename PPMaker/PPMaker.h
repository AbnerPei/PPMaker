//
//  PPMaker.h
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#ifndef PPMaker_h
#define PPMaker_h

#define PPMakerWeakSelf(type)  __weak typeof(type) weak##type = type;
#define PPMakerStrongSelf(type)  __strong typeof(type) type = weak##type;

#import "PPLabelMaker.h"
#import "PPImageViewMaker.h"
#import "PPButtonMaker.h"
#import "PPViewMaker.h"

#endif /* PPMaker_h */
