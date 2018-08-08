//
//  PPMakeExplainSourceCodePracticeMJRefreshBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/27.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeExplainSourceCodePracticeMJRefreshBaseTableViewController.h"
#import "PPMakeExplainSourceCodemMJRefreshDemoViewController.h"

@interface PPMakeExplainSourceCodePracticeMJRefreshBaseTableViewController ()

@end

@implementation PPMakeExplainSourceCodePracticeMJRefreshBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)configureDatas
{
    self.titles = @[
                    @"MJRefresh默认"
                    ];
    
    self.vcs = @[
                 @"PPMakeExplainSourceCodemMJRefreshDemoViewController"
                 ];
}
-(void)ppmake_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPMakeExplainSourceCodemMJRefreshDemoViewController *demoVC = [[PPMakeExplainSourceCodemMJRefreshDemoViewController alloc]init];
    demoVC.titleStr = self.titles[indexPath.row];
    [self.navigationController pushViewController:demoVC animated:YES];
}
@end
