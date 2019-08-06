//
//  PPMakeDoItTableViewController.m
//  PPMakerExample
//
//  Created by PPAbner on 2019/8/5.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import "PPMakeDoItTableViewController.h"

@interface PPMakeDoItTableViewController ()

@end

@implementation PPMakeDoItTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)configureDatas
{
    self.titles = @[
                    @"Vinodh-G/ParallaxTableViewHeader",
                    @"UITableView",
                    @"震动"
                    ];
    self.vcs = @[
                 @"PPMakeNSURLSessionViewController",
                 @"PPMakeAPILearn_UITableView_BaseTableViewController",
                 @"PPMakeAPILearn_Shake_ViewController"
                 ];
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
