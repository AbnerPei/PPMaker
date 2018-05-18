//
//  PPTableViewMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/8.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPTableViewMaker.h"

@interface PPTableViewMaker ()
/** 要创建的UITableView对象 */
@property(nonatomic,strong) UITableView *creatingTableV;
@end

@implementation PPTableViewMaker
#pragma mark --- 父视图
-(PPTableViewMaker *(^)(UIView *))intoView
{
    return ^PPTableViewMaker *(UIView *superV){
        if (superV) {
            [superV addSubview:self.creatingTableV];
        }
        return self;
    };
}
#pragma mark --- 背景色
-(PPTableViewMaker *(^)(UIColor *))bgColor
{
    return ^PPTableViewMaker *(UIColor *color){
        self.creatingTableV.backgroundColor = color;
        return self;
    };
}
#pragma mark --- 代理
-(PPTableViewMaker *(^)(id))delegate
{
    return ^PPTableViewMaker *(id delegate){
        self.creatingTableV.delegate = delegate;
        self.creatingTableV.dataSource = delegate;
        return self;
    };
}
#pragma mark --- 分割线(all)
-(PPTableViewMaker *(^)(BOOL))hideAllSeparator
{
    return ^PPTableViewMaker *(BOOL isHidden){
        if (isHidden) {
            self.creatingTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        }
        return self;
    };
}
#pragma mark --- 分割线(extra)
-(PPTableViewMaker *(^)(BOOL))hideExtraSeparator
{
    return ^PPTableViewMaker *(BOOL isHidden){
        if (isHidden) {
            [self.creatingTableV setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        }
        return self;
    };
}

@end

@implementation UITableView (PPMaker)
+(UITableView *)pp_tableVMake:(void (^)(PPTableViewMaker *))make frame:(CGRect)frame isPlain:(BOOL)isPlain
{
    PPTableViewMaker *tableViewMaker = [[PPTableViewMaker alloc]init];
    tableViewMaker.creatingTableV = [[UITableView alloc]initWithFrame:frame style:isPlain?UITableViewStylePlain:UITableViewStyleGrouped];
    if (make) {
        make(tableViewMaker);
    }
    return tableViewMaker.creatingTableV;
}
@end
