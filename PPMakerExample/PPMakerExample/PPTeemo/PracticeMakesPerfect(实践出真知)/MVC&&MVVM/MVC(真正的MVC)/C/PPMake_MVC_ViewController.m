//
//  PPMake_MVC_ViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake_MVC_ViewController.h"
#import "PPMake_MVC_View.h"
#import "PPMake_MVC_Model.h"

@interface PPMake_MVC_ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray<PPMake_MVC_Model *> *models;
@end

@implementation PPMake_MVC_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [PPMAKE(PPMakeTypeTableVPlain) pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.frame(CGRectMake(0, self.navigationView.bottom, kScreenW, kScreenH-self.navigationView.bottom));
        make.delegate(self);
        make.hideAllSeparator(YES);
        make.hasEstimatedHeight(NO);
    }];
    
    [self configureDatas];
}
-(void)configureDatas
{
    PPMake_MVC_Model *model1 = [[PPMake_MVC_Model alloc]init];
    model1.orderNo = @"2018090602110";
    model1.orderPrice = @"300";
    model1.orderTime = @"2018-09-06 10:53:20";
    model1.orderStatus = PTMake_MVC_M_OrderStatusDaiZhiFu;
    
    
    PPMake_MVC_Model *model2 = [[PPMake_MVC_Model alloc]init];
    model2.orderNo = @"2018090602120";
    model2.orderPrice = @"600";
    model2.orderTime = @"2018-09-06 10:40:16";
    model2.orderStatus = PTMake_MVC_M_OrderStatusChuPiaoChengGong;
    model2.payTime = @"2018-09-06 10:40:50";
    model2.ticketTime = @"2018-09-06 10:55:32";
    
    [self.models addObjectsFromArray:@[model1,model2]];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.models.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.models.count > section) {
        PPMake_MVC_Model *model = self.models[section];
        if (model) {
            PPMake_MVC_View *view = [PPMake_MVC_View viewWithOrderStatus:model.orderStatusStr leftTitles:model.leftTitles rightTitles:model.rightTitles];
            return view;
        }
    }
    return [UIView new];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.models.count > section) {
        PPMake_MVC_Model *model = self.models[section];
        return model.viewHeight;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [PPMAKE(PPMakeTypeView) pp_make:^(PPMake *make) {
        make.bgColor(kColorHex(0xf2f2f2));
    }];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kHeight(10);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
-(NSMutableArray<PPMake_MVC_Model *> *)models
{
    if (!_models) {
        _models = [NSMutableArray array];
    }
    return _models;
}

@end
