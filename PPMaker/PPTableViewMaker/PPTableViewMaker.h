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
@property(nonatomic,copy,readonly) PPTableViewMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy,readonly) PPTableViewMaker *(^bgColor)(UIColor *bgColor);
@property(nonatomic,copy,readonly) PPTableViewMaker *(^delegate)(id delegate);
/** 去掉所有的分割线 */
@property(nonatomic,copy,readonly) PPTableViewMaker *(^hideAllSeparator)(BOOL ishidden);
/** 去掉多余的分割线 */
@property(nonatomic,copy,readonly) PPTableViewMaker *(^hideExtraSeparator)(BOOL isHidden);

@end

@interface UITableView (PPMaker)

/**
 * 创建UITableView对象，此处注意，需要frame和isPlain两个参数。
 * 参考`UITableView`的`- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style NS_DESIGNATED_INITIALIZER;`方法，必须指定style。
 * @param isPlain  YES/UITableViewStylePlain , NO/UITableViewStyleGrouped
 */
+(UITableView *)pp_tableVMake:(void(^)(PPTableViewMaker *maker))make
                        frame:(CGRect)frame
                      isPlain:(BOOL)isPlain;

@end
