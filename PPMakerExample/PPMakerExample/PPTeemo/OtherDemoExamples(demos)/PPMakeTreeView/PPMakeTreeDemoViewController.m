//
//  PPMakeTreeDemoViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/6.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeTreeDemoViewController.h"
#import "HBRoom.h"

@interface PPMakeTreeDemoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSMutableArray<PPMakeTreeItem *> *datas;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) PPMakeTreeItem *item;
@end

@implementation PPMakeTreeDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureDefaultDatas];
    BOOL hasSubItme = _item.hasSubItem;
    
    self.tableView = [PPMAKETableVP pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.frame(CGRectMake(0, kNavBarH, kScreenW, kScreenH-kNavBarH));
        make.delegate(self);
        make.hideAllSeparator(YES);
    }];
}

-(void)configureDefaultDatas
{
    HBRoom *room = [[HBRoom alloc]init];
    room.roomTypeName = @"A房型";
    room.roomTypePrice = @"888";
    room.itemLevel = 1;
    
    HBRoom *room1 = [[HBRoom alloc]init];
    room1.roomTypeName = @"B房型";
    room1.roomTypePrice = @"777";
    room1.itemLevel = 1;

    HBRoom *room2 = [[HBRoom alloc]init];
    room2.roomTypeName = @"C房型";
    room2.roomTypePrice = @"666";
    room2.itemLevel = 1;

    HBHotel *hotel = [[HBHotel alloc]init];
    hotel.hotelName = @"酒店001";
    hotel.itemLevel = 0;
    hotel.subItems = [@[room,room1,room2] mutableCopy];
    
    
    HBRoom *room20 = [[HBRoom alloc]init];
    room20.roomTypeName = @"A1房型";
    room20.roomTypePrice = @"888";
    room20.itemLevel = 1;
    
    HBRoom *room21 = [[HBRoom alloc]init];
    room21.roomTypeName = @"B1房型";
    room21.roomTypePrice = @"777";
    room21.itemLevel = 1;

    
    HBHotel *hotel1 = [[HBHotel alloc]init];
    hotel1.hotelName = @"酒店002";
    hotel1.itemLevel = 0;
    hotel1.subItems = [@[room20,room21] mutableCopy];
    
    [self.datas addObjectsFromArray:@[hotel,hotel1]];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_datas.count > indexPath.row) {
        PPMakeTreeItem *item = _datas[indexPath.row];
        if (item.itemLevel == 0) {
            HBHotelCell *hotelCell = [HBHotelCell ppmake_cellWithTableView:tableView];
            [hotelCell setupWithHotel:(HBHotel *)item];
            return hotelCell;
        }else{
            HBRoomCell *roomCell = [HBRoomCell ppmake_cellWithTableView:tableView];
            [roomCell setupWithRoom:(HBRoom *)item];
            return roomCell;
        }
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPMakeTreeItem *item = _datas[indexPath.row];
    [item actionWithTableView:tableView vcDataSoures:_datas indexPath:indexPath];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_datas.count > indexPath.row) {
        PPMakeTreeItem *item = _datas[indexPath.row];
        if (item.itemLevel == 0) {
            return kHeight(80);
        }else{
            return kHeight(50);
        }
    }
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray<PPMakeTreeItem *> *)datas
{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}


@end
