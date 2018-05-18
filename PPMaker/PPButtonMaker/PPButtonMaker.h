//
//  PPButtonMaker.h
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^makerBtActionBlock)(void);

@interface PPButtonMaker : NSObject

@property(nonatomic,copy,readonly) PPButtonMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy,readonly) PPButtonMaker *(^frame)(CGRect frame);
@property(nonatomic,copy,readonly) PPButtonMaker *(^bgColor)(UIColor *bgColor);

/**【通用】 设置state对应的title */
@property(nonatomic,copy,readonly) PPButtonMaker *(^title)(NSString *title,UIControlState state);
/** 设置normal对应的title */
@property(nonatomic,copy,readonly) PPButtonMaker *(^normalTitle)(NSString *normalTitle);
/** 设置Highlighted对应的title */
@property(nonatomic,copy,readonly) PPButtonMaker *(^highlightedTitle)(NSString *highlightedTitle);

/**【通用】 设置state对应的titleColor */
@property(nonatomic,copy,readonly) PPButtonMaker *(^titleColor)(UIColor *titleColor,UIControlState state);
/** 设置normal对应的titleColor */
@property(nonatomic,copy,readonly) PPButtonMaker *(^normalTitleColor)(UIColor *normalTitleColor);
/** 设置Highlighted对应的titleColor */
@property(nonatomic,copy,readonly) PPButtonMaker *(^highlightedTitleColor)(UIColor *highlightedTitleColor);

@property(nonatomic,copy) PPButtonMaker *(^addTarget)(id target,SEL action,UIControlEvents controlEvents);
@property(nonatomic,copy) PPButtonMaker *(^addTargetTouchUpInside)(id target,SEL action);

@property(nonatomic,copy,readonly) PPButtonMaker *(^actionBlock)(makerBtActionBlock block);

@end

@interface UIButton (PPMaker)

+(UIButton *)pp_btMake:(void(^)(PPButtonMaker *maker))make;

-(void)maker_actionWithControlEvent:(UIControlEvents )event
                          withBlock:(makerBtActionBlock)block;
-(void)maker_actionWithBlock:(makerBtActionBlock)block;

@end


