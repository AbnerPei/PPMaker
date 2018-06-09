//
//  PPMakeCategory.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#ifndef PPMakeCategory_h
#define PPMakeCategory_h

#import "UIButton+PPMakeSupport.h"
#import "UIView+PPMakeSupport.h"
#import "NSObject+PPMakeSupport.h"


#define PPMake_SpecialAssert(_makeType_) \
NSString *recommendStr = \
[NSString stringWithFormat:@"☠请注意☠:%@不是%@所拥有的属性！",NSStringFromSelector(_cmd),NSStringFromClass([self.createdView class])]; \
NSAssert(self.makeType == (_makeType_), recommendStr);


#endif /* PPMakeCategory_h */
