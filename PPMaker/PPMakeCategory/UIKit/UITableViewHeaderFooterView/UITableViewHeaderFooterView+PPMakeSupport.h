//
//  UITableViewHeaderFooterView+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/5.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewHeaderFooterView (PPMakeSupport)

+ (instancetype)ppmake_headerFooterViewWithTableView:(UITableView *)tableView reuseIdentifier:(nullable NSString *)reuseIdentifier;
+ (instancetype)ppmake_headerFooterViewWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
