//
//  PPMakeBaseTableViewController.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/13.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeBaseViewController.h"

@interface PPMakeBaseTableViewController : PPMakeBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray<NSString *> *titles;
@property(nonatomic,strong) NSArray<NSString *> *vcs;
/**
 * 配置tableView的数据源,子类必须在此方法里设置titles和vcs
 */
-(void)configureDatas;

-(void)ppmakeTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
