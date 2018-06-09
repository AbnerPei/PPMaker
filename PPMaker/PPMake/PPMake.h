//
//  PPMake.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/17.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PPMakeCategory.h"

#define PPMAKE(makeType) [PPMake makeWithType:(makeType)]

typedef NS_ENUM(NSInteger,PPMakeType) {
    PPMakeTypeView = 0,
    PPMakeTypeLB,
    PPMakeTypeBT,
    PPMakeTypeImgV,
    PPMakeTypeTableVPlain,
    PPMakeTypeTableVGrouped
};

@interface PPMake : NSObject
/**
 * 所有的创建UI控件的入口方法
 * * * * * *
 * 声明：虽然PPMAKE(makeType)后可以一直点下去，但是代码冗长，到不到想要的效果，所以，公开此方法，方便使用。
 * @return ☠☠☠返回值是id类型，主要是为了处理返回值类型为UIView *时，比如返回一个button,
 * 系统警告"Incompatible pointer types initializing 'UIButton *' with an expression of type 'UIView *'"的问题。
 */
-(id)pp_make:(void(^)(PPMake *make))make;

/**
 * 🔒 🔒 🔒 🔒
 * 创建make模型，但是不建议直接调用该方法。调用PPMAKE(makeType)这个宏即可；
 * * * * * *
 * 此时，终于体会到臧老师说的用法（各有各的好吧）。
 * @param makeType 创建UI控件的类型，如:UIView/UILabel/UIButton/UIImageView/UITableView等
 */
+(instancetype)makeWithType:(PPMakeType)makeType;

/**
 * 🔒 🔒 🔒 🔒
 * 通过make创建的view,建议不要用！
 * 主要是为了方便分类拿到要创建的view.
 */
@property(nonatomic,strong,readonly) UIView *createdView;

/**
 * 🔒 🔒 🔒 🔒
 * 通过make创建的view的类型,建议不要用！
 * 主要是为了方便分类拿到，从而在调用不当时，能在控制台给予友好准确的错误提示.
 */
@property(nonatomic,assign,readonly) PPMakeType makeType;

/** superView */
@property(nonatomic,copy,readonly) PPMake *(^intoView)(UIView *intoView);

/** frame */
@property(nonatomic,copy,readonly) PPMake *(^frame)(CGRect frame);

/** backgroundColor */
@property(nonatomic,copy,readonly) PPMake *(^bgColor)(UIColor *bgColor);

/** hidden */
@property(nonatomic,copy,readonly) PPMake *(^hidden)(BOOL hidden);

/** tag */
@property(nonatomic,copy,readonly) PPMake *(^tag)(NSInteger tag);

/** userInteractionEnabled */
@property(nonatomic,copy,readonly) PPMake *(^userInteractionEnabled)(BOOL userInteractionEnabled);

/**
 * 设置视图（图片要特殊注意）的contentMode。
 * 此处注意：系统默认是UIViewContentModeScaleToFill（根据视图的比例去拉伸图片内容）
 * imageView 默认设置为：UIViewContentModeScaleAspectFit（保持图片内容的纵横比例，来适应视图的大小）
 * 其它值得关注的：
 * UIViewContentModeScaleAspectFill（用图片内容来填充视图的大小，多余得部分可以被修剪掉来填充整个视图边界）
 * UIViewContentModeCenter（保持图片原比例在视图中间显示图片内容，如果视图大小小于图片的尺寸，则图片会超出视图边界，只能看到中间的部分）
 */
@property(nonatomic,copy,readonly) PPMake *(^contentMode)(UIViewContentMode contentMode);

/** 圆角 */
@property(nonatomic,assign,readonly) PPMake *(^cornerRadius)(CGFloat cornerRadius);
/** 边框-宽 */
@property(nonatomic,assign,readonly) PPMake *(^borderWidth)(CGFloat borderWidth);
/** 边框-颜色 */
@property(nonatomic,strong,readonly) PPMake *(^borderColor)(UIColor *borderColor);

/**
 * 同时设置圆角和阴影。
 */
@property(nonatomic,copy,readonly) PPMake *(^cornerShadow)(CGFloat cornerRadius,CGFloat shadowRadius,CGFloat shadowOpacity);

/* view添加点击事件 */
@property(nonatomic,copy,readonly) PPMake *(^tapBlock)(makeViewGestureBlock tapGestureBlcok);
/* view添加长摁事件 */
@property(nonatomic,copy,readonly) PPMake *(^longPressBlock)(makeViewGestureBlock longPressGestureBlock);

@end


/**
 * 🌹 🌹 🌹 🌹 🌹 🌹
 * 创建此UIView的category的目的：
 * 使得所有UIView的子类，就算不是用PPMake方法创建，依然可以用PPMake链式语法。
 */
@interface UIView (PPMake)
-(void)pp_make:(void(^)(PPMake *make))make;
@end



