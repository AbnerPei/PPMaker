//
//  PPMakeTreeItem.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/6.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PPMakeTreeItem : NSObject

/** item是否展开 */
@property(nonatomic,assign) BOOL expand;
/** 当前item所处等级 */
@property(nonatomic,assign) NSUInteger itemLevel;
/**
 *  下一级item数组
 *  如果extend参数为NO,则submodels是一个空数组
 */
@property(nonatomic,strong) NSMutableArray<PPMakeTreeItem *> *subItems;
/** 是否有下一级 */
@property(nonatomic,assign,readonly) BOOL hasSubItem;

/**
 *【核心】 获取当前item下的所有等级对应的item模型，尤其是展开后要注意.
 */
@property (nonatomic,strong,readonly) NSMutableArray<PPMakeTreeItem *> *allSubItems;

@end


/**
 * 处理点击折叠动画
 */
@interface PPMakeTreeItem (didSelectRowAtIndexPath)
-(void)actionWithTableView:(UITableView *)tableView
              vcDataSoures:(NSMutableArray<PPMakeTreeItem *> *)vcDataSources
                 indexPath:(NSIndexPath *)indexPath;
@end

