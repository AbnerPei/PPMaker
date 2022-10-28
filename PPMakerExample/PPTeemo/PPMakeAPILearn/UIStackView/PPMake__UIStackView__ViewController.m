//
//  PPMake__UIStackView__ViewController.m
//  PPMakerExample
//
//  Created by jianbo.pei on 2022/10/28.
//  Copyright © 2022 PPAbner. All rights reserved.
//

#import "PPMake__UIStackView__ViewController.h"
#import "RankNo1Cell.h"
#import "EvaluationCell.h"
#import "UIDevice+PPMakeSupport.h"
#import "LMCellModel.h"

@interface PPMake__UIStackView__ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<LMCellModel*> *models;
@end

@implementation PPMake__UIStackView__ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.grayColor;
    self.models = [NSMutableArray array];
    [self createDatas];
    [self.view addSubview:self.tableView];
}

- (void)createDatas
{
    NSArray *desArray = @[
        @"善良劫匪拉进来的结束两色风景",
        @"sjdlfsj江山留胜迹",
        @"dlsfjd书法老师交流方式菲丝加芬邻家少妇了是房间善良劫匪老师福建粮食局芙丽丝芳斐林试剂放假了善良劫匪老师",
        @"你好",
        @"dsjlfjaljdl老师就到了房间送饭的苏佛时间裂缝聚类算法 符离集烧鸡放假时间雷锋精神斐林试剂领访客就是浪费就善良劫匪老师斐林试剂放假了数据份是房间手机雷锋精神 善良劫匪就睡觉觉"
    ];
    
    NSArray *countArray = @[
        @0,
        @2,
        @0,
        @4
    ];
    
    for (int i = 0; i < 10; i++) {
        LMCellModel *cellModel = [[LMCellModel alloc] init];
        cellModel.desc = desArray[arc4random() % desArray.count];
        cellModel.imageCount = countArray[arc4random() % countArray.count];
        [self.models addObject:cellModel];
    }
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarH, kScreenW, kScreenH - kNavBarH) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = UIColor.grayColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[RankNo1Cell class] forCellReuseIdentifier:@"rankno1"];
        [_tableView registerClass:[EvaluationCell class] forCellReuseIdentifier:@"evaluation"];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.models.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        RankNo1Cell *rankCell = [tableView dequeueReusableCellWithIdentifier:@"rankno1" forIndexPath:indexPath];
        if (self.models.count > indexPath.section) {
            LMCellModel *model = self.models[indexPath.section];
            [rankCell setupWithCellModel:model];
        }
        return rankCell;
    } else {
        EvaluationCell *evaluationCell = [tableView dequeueReusableCellWithIdentifier:@"evaluation" forIndexPath:indexPath];
        if (self.models.count > indexPath.section) {
            LMCellModel *model = self.models[indexPath.section];
            [evaluationCell setupWithCellModel:model];
        }
        return evaluationCell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = UIColor.grayColor;
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

@end
