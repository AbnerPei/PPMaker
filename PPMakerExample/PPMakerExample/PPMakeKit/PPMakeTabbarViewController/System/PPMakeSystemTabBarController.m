//
//  PPMakeSystemTabBarController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/1.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeSystemTabBarController.h"
#import "PPMakeHomepageViewController.h"
#import "PPMakeOrderViewController.h"
#import "PPMakeMineViewController.h"
#import "PPMakerFontDefine.h"

@interface PPMakeSystemTabBarController ()

@end

@implementation PPMakeSystemTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tabBar的背景图片
    UIImage* tabBarBackground = [UIImage ppmake_imageWithColor:[UIColor whiteColor] size:self.tabBar.frame.size];
    [[UITabBar appearance] setBackgroundImage:[tabBarBackground resizableImageWithCapInsets:UIEdgeInsetsZero]];
    
    NSMutableArray *vcs = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        [vcs addObject:[self creatTabbarItemWithIndex:i]];
    }
    self.viewControllers = vcs;
}

-(UIViewController *)creatTabbarItemWithIndex:(NSInteger)index
{
    NSArray *vcs = @[
                     @"PPMakeHomepageViewController",
                     @"PPMakeOrderViewController",
                     @"PPMakeMineViewController"
                     ];
    
    NSArray *normalImgs = @[
                            @"ppmaker_tabbar_homepage_n",
                            @"ppmaker_tabbar_order_n",
                            @"ppmaker_tabbar_mine_n"
                            ];
    
    NSArray *selectedImgs = @[
                              @"ppmaker_tabbar_homepage_s",
                              @"ppmaker_tabbar_order_s",
                              @"ppmaker_tabbar_mine_s"
                              ];
    NSArray *titles = @[
                        @"首页",
                        @"订单",
                        @"我的"
                        ];
    UIViewController *vc = [NSClassFromString([vcs objectAtIndex:index]) new];
    
    vc.tabBarItem.image = [[UIImage imageNamed:normalImgs[index]] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImgs[index]] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    vc.tabBarItem.title = titles[index];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kColorBlack,NSFontAttributeName:fontPingFangSCMedium(10)} forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kColorBlack,NSFontAttributeName:fontPingFangSCSemibold(10)} forState:UIControlStateSelected];
    
    return vc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
