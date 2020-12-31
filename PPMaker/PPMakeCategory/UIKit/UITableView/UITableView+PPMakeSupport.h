//
//  UITableView+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/30.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (PPMakeSupport)

/// 免去`registerClass: forCellReuseIdentifier`一个一个写
/// @param cellClasses cellClass数组
/// @param identifiers identifier数组
- (void)registerClasses:(nullable NSArray<Class> *)cellClasses forCellReuseIdentifiers:(nullable NSArray<NSString *> *)identifiers;


/// 免去`registerClass: forCellReuseIdentifier`一个一个写
/// @param cellClasses cellClass数组 「利用cellClas创建indentifier」
- (void)registerClasses:(nullable NSArray<Class> *)cellClasses;


@end

