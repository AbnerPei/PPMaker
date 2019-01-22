//
//  UITableView+PPMakeDidSelectedBlock.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/30.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PPMakeTableViewDidSelectedBlcok)(UITableView *tableView,NSIndexPath *indexPath);


@interface UITableView (PPMakeDidSelectedBlock)
/**
 * 给tableView绑定didSelected点击block回调
 * 需要注意的】： tableView必须设置delegate并且vc中实现didSelected方法
 */
@property(nonatomic,copy)PPMakeTableViewDidSelectedBlcok ppmake_didSelectedBlock;
@end
