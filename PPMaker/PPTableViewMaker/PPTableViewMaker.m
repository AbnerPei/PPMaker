//
//  PPTableViewMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/8.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPTableViewMaker.h"
#import "PPMaker.h"

@interface PPTableViewMaker ()
/** 要创建的UITableView对象 */
@property(nonatomic,strong) UITableView *creatingTableV;
@end

@implementation PPTableViewMaker

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        PPMakerWeakSelf(self)
        //父视图
        _intoView = ^PPTableViewMaker *(UIView *superV){
            PPMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingTableV];
            }
            return self;
        };
        
        //背景色
        _bgColor = ^PPTableViewMaker *(UIColor *color){
            PPMakerStrongSelf(self)
            self.creatingTableV.backgroundColor = color;
            return self;
        };
        
        //代理
        _delegate = ^PPTableViewMaker *(id delegate){
            PPMakerStrongSelf(self)
            self.creatingTableV.delegate = delegate;
            self.creatingTableV.dataSource = delegate;
            return self;
        };
        
        //分割线
        _hideAllSeparator = ^PPTableViewMaker *(BOOL isHidden){
            PPMakerStrongSelf(self)
            if (isHidden) {
                self.creatingTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
            }
            return self;
        };
        _hideExtraSeparator = ^PPTableViewMaker *(BOOL isHidden){
            PPMakerStrongSelf(self)
            if (isHidden) {
                [self.creatingTableV setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
            }
            return self;
        };

    }
    return self;
}

+(UITableView *)pp_tableViewMake:(void (^)(PPTableViewMaker *))make frame:(CGRect)frame isPlain:(BOOL)isPlain
{
    PPTableViewMaker *tableViewMaker = [[PPTableViewMaker alloc]init];
    tableViewMaker.creatingTableV = [[UITableView alloc]initWithFrame:frame style:isPlain?UITableViewStylePlain:UITableViewStyleGrouped];
    if (make) {
        make(tableViewMaker);
    }
    return tableViewMaker.creatingTableV;
}

@end
