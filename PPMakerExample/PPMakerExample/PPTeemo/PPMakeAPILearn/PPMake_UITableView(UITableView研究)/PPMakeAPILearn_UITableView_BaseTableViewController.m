//
//  PPMakeAPILearn_UITableView_BaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/4.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeAPILearn_UITableView_BaseTableViewController.h"

@interface PPMakeAPILearn_UITableView_BaseTableViewController ()

@end

@implementation PPMakeAPILearn_UITableView_BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)configureDatas
{
    self.titles = @[
                    @"UITableView的Updates"
                    ];
    
    self.vcs = @[
                 @"PPMake_UITableView_UpdatesViewController"
                 ];
}
@end
