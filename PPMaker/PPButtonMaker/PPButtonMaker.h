//
//  PPButtonMaker.h
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^actionB)(void);

@interface PPButtonMaker : NSObject

@property(nonatomic,copy) PPButtonMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy) PPButtonMaker *(^frame)(CGRect frame);
@property(nonatomic,copy) PPButtonMaker *(^bgColor)(UIColor *bgColor);

/**【通用】 设置state对应的titleColor */
@property(nonatomic,copy) PPButtonMaker *(^titleColor)(UIColor *titleColor,UIControlState state);
/** 设置normal对应的titleColor */
@property(nonatomic,copy) PPButtonMaker *(^normalTitleColor)(UIColor *normalTitleColor);
/** 设置Highlighted对应的titleColor */
@property(nonatomic,copy) PPButtonMaker *(^highlightedTitleColor)(UIColor *highlightedTitleColor);

/**【通用】 设置state对应的title */
@property(nonatomic,copy) PPButtonMaker *(^title)(NSString *title,UIControlState state);
/** 设置normal对应的title */
@property(nonatomic,copy) PPButtonMaker *(^normalTitle)(NSString *normalTitle);
/** 设置Highlighted对应的title */
@property(nonatomic,copy) PPButtonMaker *(^highlightedTitle)(NSString *highlightedTitle);

@property(nonatomic,copy) PPButtonMaker *(^actionBlock)(actionB block);

+(UIButton *)pp_btMake:(void(^)(PPButtonMaker *maker))make;
@end



