//
//  PPMakeTreeItem.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/6.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeTreeItem.h"

@implementation PPMakeTreeItem
-(NSMutableArray<PPMakeTreeItem *> *)subItems
{
    return _expand ? _subItems : [NSMutableArray array];
}
-(BOOL)hasSubItem
{
    return _subItems.count > 0;
}


-(NSMutableArray<PPMakeTreeItem *> *)allSubItems
{
    NSMutableArray<PPMakeTreeItem *> *subItems = [NSMutableArray array];
    [self getAllItemsWithCurrentItem:self allSubItems:subItems];
    return subItems;
}

#pragma mark ---  【递归调用(核心)】获取当前item下的所有等级里的items
-(void)getAllItemsWithCurrentItem:(PPMakeTreeItem *)item
                      allSubItems:(NSMutableArray<PPMakeTreeItem *> *)allSubItems
{
    [item.subItems enumerateObjectsUsingBlock:^(PPMakeTreeItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [allSubItems addObject:obj];
        [item getAllItemsWithCurrentItem:obj allSubItems:allSubItems];
    }];
}

@end

@implementation PPMakeTreeItem (didSelectRowAtIndexPath)
-(void)actionWithTableView:(UITableView *)tableView
              vcDataSoures:(NSMutableArray<PPMakeTreeItem *> *)vcDataSources
                 indexPath:(NSIndexPath *)indexPath
{
    if (!tableView || !vcDataSources) {
        return;
    }
    
    ///如果item已经是展开的，点击就要关闭（包括所有subItems也关闭）
    if (self.expand) {
        //移除数据源中所有的subItems
        [vcDataSources removeObjectsInArray:self.allSubItems];
        
        //更新UI动画
        [self animationWithTableView:tableView indexPath:indexPath isShow:NO];
        
        //item只有展开后可以获取subItems,所以放后面
        //关闭后，别忘了设置expand为NO
        self.expand = NO;
        
    }else{
        ///如果item是关闭的，点击就要展开（只展开当前item）
        
        //item只有展开后可以获取subItems,所以放前面
        self.expand = YES;
        
        //vc的数据源插入item的子item数据
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row+1, self.allSubItems.count)];
        [vcDataSources insertObjects:self.allSubItems atIndexes:indexSet];
        
        //更新UI动画
        [self animationWithTableView:tableView indexPath:indexPath isShow:YES];
    }
}
-(void)animationWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath isShow:(BOOL)isShow
{
    NSMutableArray<NSIndexPath *> *indexPaths = [NSMutableArray array];
    [self.allSubItems enumerateObjectsUsingBlock:^(PPMakeTreeItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSIndexPath *indexP = [NSIndexPath indexPathForRow:indexPath.row+1+idx inSection:indexPath.section];
        [indexPaths addObject:indexP];
    }];
    if (isShow) {
        [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:(UITableViewRowAnimationFade)];
    }else{
        [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:(UITableViewRowAnimationFade)];
    }
}
@end

