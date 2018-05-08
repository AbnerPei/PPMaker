//
//  PPTableViewMaker.h
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/8.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PPTableViewMaker : NSObject
@property(nonatomic,copy) PPTableViewMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy) PPTableViewMaker *(^bgColor)(UIColor *bgColor);
@property(nonatomic,copy) PPTableViewMaker *(^delegate)(id delegate);
/** 去掉所有的分割线 */
@property(nonatomic,copy) PPTableViewMaker *(^hideAllSeparator)(BOOL ishidden);
/** 去掉多余的分割线 */
@property(nonatomic,copy) PPTableViewMaker *(^hideExtraSeparator)(BOOL isHidden);

+(UITableView *)pp_tableViewMake:(void(^)(PPTableViewMaker *maker))make
                           frame:(CGRect)frame
                         isPlain:(BOOL)isPlain;
@end
