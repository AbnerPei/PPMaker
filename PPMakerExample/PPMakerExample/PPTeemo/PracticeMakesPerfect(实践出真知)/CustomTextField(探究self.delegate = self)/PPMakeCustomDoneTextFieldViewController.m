//
//  PPMakeCustomDoneTextFieldViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/25.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeCustomDoneTextFieldViewController.h"
#import "PPMakeCustomDoneTextField.h"
#import "PPMutAttributedStringMaker.h"
#import "PPMakerDefines.h"

@interface PPMakeCustomDoneTextFieldViewController ()

@end

@implementation PPMakeCustomDoneTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PPMakeCustomDoneTextField *tf = [[PPMakeCustomDoneTextField alloc]initWithFrame:CGRectMake(20, 100, 200, 50)];
    tf.font = fontPingFangSCSemibold(16);
    
    tf.attributedPlaceholder = [NSMutableAttributedString pp_attributedStringMake:^(PPMutAttributedStringMaker *maker) {
        maker.font(fontPingFangSCMedium(16));
        maker.textColor(color666666());
    } str:@"测试一个Done的TextField"];
    [self.view addSubview:tf];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
