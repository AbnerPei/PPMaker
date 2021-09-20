//
//  PPMakeUICollectionViewBaseTableViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/9/19.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMakeUICollectionViewBaseTableViewController.h"

@interface PPMakeUICollectionViewBaseTableViewController ()

@end

@implementation PPMakeUICollectionViewBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)configureDatas
{
    self.titles = @[
                    @"UICollectionView基本使用",
                    @"UICollectionView实现UITableView"
                    ];
    self.vcs = @[
                 @"PPMakeAPILearn_UICollectionView_Demo1_ViewController",
                 @"PPMakeAPILearn_UICollectionView_Demo2_ViewController"
                 ];
}

@end
