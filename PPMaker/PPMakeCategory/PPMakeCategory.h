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

#define PPMakeAssert(_makeType_,_class_) \
NSAssert(self.makeType == _makeType_, @"💊崩溃原因💊: %@是%@的一个属性，不能用于%@。详见 %s,第%d行。",NSStringFromSelector(_cmd),NSStringFromClass(_class_),NSStringFromClass([self.createdView class]),__FUNCTION__,__LINE__);

#define PPMakeLBAssert   PPMakeAssert(PPMakeTypeLB,[UILabel class])
#define PPMakeBTAssert   PPMakeAssert(PPMakeTypeBT,[UIButton class])
#define PPMakeImgVAssert PPMakeAssert(PPMakeTypeImgV,[UIImageView class])


#define PPMakeTableVAssert \
NSAssert(self.makeType == PPMakeTypeTableVPlain || self.makeType == PPMakeTypeTableVGrouped, @"💊崩溃原因💊: %@是UITableView的一个属性，不能用于%@。详见 %s,第%d行。",NSStringFromSelector(_cmd),NSStringFromClass([self.createdView class]),__FUNCTION__,__LINE__);

#endif /* PPMakeCategory_h */
