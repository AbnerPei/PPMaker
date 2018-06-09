//
//  PPMake+UITableView.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake+UITableView.h"

#define PPMake_TableViewSpecialAssert \
NSString *tableVRStr = \
[NSString stringWithFormat:@"☠请注意☠: %@不是%@所拥有的属性!",NSStringFromSelector(_cmd),@"UITableView *"]; \
NSAssert((self.makeType == PPMakeTypeTableVPlain || self.makeType == PPMakeTypeTableVGrouped), tableVRStr);

@implementation PPMake (UITableView)
-(PPMake *(^)(id))delegate
{
    PPMake_TableViewSpecialAssert
    return ^PPMake *(id d){
        UITableView *tableV = (UITableView *)self.createdView;
        tableV.delegate = d;
        tableV.dataSource = d;
        return self;
    };
}
#pragma mark --- 隐藏分割线(all)
-(PPMake *(^)(BOOL))hideAllSeparator
{
    PPMake_TableViewSpecialAssert
    return ^PPMake *(BOOL isHidden){
        if (isHidden) {
            UITableView *tableV = (UITableView *)self.createdView;
            tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        }
        return self;
    };
}
#pragma mark --- 隐藏分割线(extra)
-(PPMake *(^)(BOOL))hideExtraSeparator
{
    PPMake_TableViewSpecialAssert
    return ^PPMake *(BOOL isHidden){
        if (isHidden) {
            UITableView *tableV = (UITableView *)self.createdView;
            [tableV setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        }
        return self;
    };
}
-(PPMake *(^)(BOOL))hasEstimatedHeight
{
    return ^PPMake *(BOOL hasEH){
        UITableView *tableV = (UITableView *)self.createdView;
        if (!hasEH) {
            tableV.estimatedRowHeight = 0;
            tableV.estimatedSectionHeaderHeight = 0;
            tableV.estimatedSectionFooterHeight = 0;
        }
        return self;
    };
}
@end
