//
//  PPMakeInfrastructureExploreBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/28.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeInfrastructureExploreBaseTableViewController.h"
#import "UITableView+PPMakeDidSelectedBlock.h"

@interface PPMakeInfrastructureExploreBaseTableViewController ()

@end

@implementation PPMakeInfrastructureExploreBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.ppmake_didSelectedBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        NSLog(@"block -- %@ --%ld",tableView,(long)indexPath.row);
    };
}

-(void)configureDatas
{
    self.titles = @[
                    @"Block底层探究",
                    @"dispatch_once原理"
                    ];
    self.vcs = @[
                 @"PPMakeIE_BlockViewController",
                 @"PPMakeIE_DispathchOnceViewController"
                 ];
    
}

@end
