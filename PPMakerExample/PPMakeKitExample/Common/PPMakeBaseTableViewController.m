//
//  PPMakeBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/13.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeBaseTableViewController.h"
#import "PPMakeKitExampleListCell.h"
#import "PPMakerDefines.h"
#import "PPMaker.h"

@interface PPMakeBaseTableViewController ()

@end

@implementation PPMakeBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureDatas];
    [self createTableViewUI];

}
-(void)configureDatas{ }

-(void)createTableViewUI
{
    self.tableView = [PPMAKETableVG pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.frame(CGRectMake(0, kNavBarH, kScreenW, kScreenH-kNavBarH-kReallBottomH(49)));
        make.delegate(self);
        make.bgColor(colorffffff());
    }];
}

#pragma mark --- iOS 11的bug，必须同时设置headerView和fotterView
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kHeight(12);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kHeight(0.00001);
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titles.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kHeight(50);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPMakeKitExampleListCell *cell = [PPMakeKitExampleListCell ppmake_cellWithTableView:tableView];
    if (self.titles.count > indexPath.section) {
        [cell setupCellWithTitle:self.titles[indexPath.section]];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self respondsToSelector:@selector(ppmakeTableView:didSelectRowAtIndexPath:)]) {
        [self ppmakeTableView:tableView didSelectRowAtIndexPath:indexPath];
    }else{
        Class vcClass = NSClassFromString(self.vcs[indexPath.section]);
        PPMakeBaseViewController *vc = [vcClass new];
        vc.titleStr = self.titles[indexPath.section];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
