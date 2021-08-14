//
//  UIFontCacheNextViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/4.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIFontCacheNextViewController.h"
#import "PPMakerDefines.h"
#import "PPMaker.h"

@interface UIFontCacheNextViewController ()
/** 用来持有font的LB */
@property(nonatomic,strong) UILabel *fontTestLB;
@end

@implementation UIFontCacheNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIFont *creatingFont = PPMakeUIFontPingFangSCSemibold(14);
    
    self.fontTestLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.font(PPMakeUIFontPingFangSCSemibold(14));
        make.text(@"next lb UIFont是有缓存的");
        make.textColor(colorDeepRed());
        make.textAlignment(NSTextAlignmentCenter);
        make.frame(CGRectMake(0, kHeight(400), kScreenW, kHeight(50)));
        make.bgColor(colorHex(0x27f2f2));
        make.tapBlock(^{
            UIFontCacheNextViewController *nextVC = [[UIFontCacheNextViewController alloc]init];
            [self.navigationController pushViewController:nextVC animated:YES];
        });
    }];
    
    NSLog(@"\n next UIFont新建的font     \n%@ \n next lbFont %@",creatingFont,self.fontTestLB.font);
    
    UIImage *img = [UIImage imageNamed:@"1024"];
    NSLog(@"vc-img %@",img);

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
