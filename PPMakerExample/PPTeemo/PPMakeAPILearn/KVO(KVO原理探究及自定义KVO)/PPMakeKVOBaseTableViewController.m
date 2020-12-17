//
//  PPMakeKVOBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/17.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeKVOBaseTableViewController.h"

@interface PPMakeKVOBaseTableViewController ()

@end

@implementation PPMakeKVOBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s",__func__);
}
-(void)configureDatas
{
    self.titles = @[
                    @"KVO原理探究",
                    @"自定义KVO"
                    ];
    self.vcs = @[
                 @"PPMakeHowKVOWorksViewController",
                 @"PPMakeCustomKVOViewController"
                 ];
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
