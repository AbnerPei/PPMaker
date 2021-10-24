//
//  PPMake__UIButton-iOS15__ViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/10/24.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMake__UIButton-iOS15__ViewController.h"
#import "UIButton+PPMakeSupport.h"

@interface PPMake__UIButton_iOS15__ViewController ()

@end

@implementation PPMake__UIButton_iOS15__ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [self example];
    
}

- (void)example
{
    
    UIButton *bt1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [bt1 setImage:[UIImage imageNamed:@"liked"] forState:(UIControlStateNormal)];
    [bt1 setTitle:@"点赞" forState:(UIControlStateNormal)];
    bt1.backgroundColor = UIColor.lightGrayColor;
    [bt1 ppmake_setLayoutStyle:(UIButtonLayoutStyleLeftImageRightTitle) imageTitleSpace:10];
    
    
    UIButton *bt2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [bt2 setImage:[UIImage imageNamed:@"liked"] forState:(UIControlStateNormal)];
    [bt2 setTitle:@"点赞" forState:(UIControlStateNormal)];
    bt2.backgroundColor = UIColor.lightGrayColor;
    [bt2 ppmake_setLayoutStyle:(UIButtonLayoutStyleLeftTitleRightImage) imageTitleSpace:10];
    
    UIButton *bt3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [bt3 setImage:[UIImage imageNamed:@"liked"] forState:(UIControlStateNormal)];
    [bt3 setTitle:@"点赞" forState:(UIControlStateNormal)];
    bt3.backgroundColor = UIColor.lightGrayColor;
    [bt3 ppmake_setLayoutStyle:(UIButtonLayoutStyleTopTitleBottomImage) imageTitleSpace:10];
    
    UIButton *bt4 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [bt4 setImage:[UIImage imageNamed:@"liked"] forState:(UIControlStateNormal)];
    [bt4 setTitle:@"点赞" forState:(UIControlStateNormal)];
    bt4.backgroundColor = UIColor.lightGrayColor;
    [bt4 ppmake_setLayoutStyle:(UIButtonLayoutStyleTopImageBottomTitle) imageTitleSpace:20];
    
    bt1.frame = CGRectMake(50, 150, 100, 80);
    bt2.frame = CGRectMake(200, 150, 100, 80);
    bt3.frame = CGRectMake(50, 280, 100, 80);
    bt4.frame = CGRectMake(200, 280, 100, 80);
    
    [self.view addSubview:bt1];
    [self.view addSubview:bt2];
    [self.view addSubview:bt3];
    [self.view addSubview:bt4];
}

@end
