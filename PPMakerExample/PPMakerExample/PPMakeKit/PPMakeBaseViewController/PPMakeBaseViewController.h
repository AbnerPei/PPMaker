//
//  PPMakeBaseViewController.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/1.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPMakeBaseViewController : UIViewController
/** 用UIView对象创建的导航栏,如果觉得不合适，可以隐藏掉，设置自己需要的 */
@property(nonatomic,strong,readonly) UIView *navigationView;
/** 导航栏下面的线（宽：屏宽，高：1） */
@property(nonatomic,strong,readonly) UIView *navigationLine;
/** 返回按钮 */
@property(nonatomic,strong,readonly) UIButton *backBT;
/** 标题LB */
@property(nonatomic,strong,readonly) UILabel *titleLB;
/** 标题LB的文字 (注意区别系统体统的title，所以用titleStr)*/
@property(nonatomic,copy) NSString *titleStr;

/**
 * 对外开放返回点击事件
 */
-(void)backAction;
@end
