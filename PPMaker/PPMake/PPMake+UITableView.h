//
//  PPMake+UITableView.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake.h"

@interface PPMake (UITableView)

/** delegate && datasource */
@property(nonatomic,copy,readonly) PPMake *(^delegate)(id delegate);
/** 去掉所有的分割线 (默认已经去掉，在初始化话view的时候)*/
@property(nonatomic,copy,readonly) PPMake *(^hideAllSeparator)(BOOL ishidden);
/** 去掉多余的分割线 */
@property(nonatomic,copy,readonly) PPMake *(^hideExtraSeparator)(BOOL isHidden);
/**
 * 是否需要预估高度，默认是需要的YES。
 *
 */
@property(nonatomic,copy,readonly) PPMake *(^hasEstimatedHeight)(BOOL hasEstimatedHeight);

@end
