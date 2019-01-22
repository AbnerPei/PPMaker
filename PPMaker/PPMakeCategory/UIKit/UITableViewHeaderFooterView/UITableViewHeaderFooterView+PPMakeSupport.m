//
//  UITableViewHeaderFooterView+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/5.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UITableViewHeaderFooterView+PPMakeSupport.h"

@implementation UITableViewHeaderFooterView (PPMakeSupport)
+ (instancetype)ppmake_headerFooterViewWithTableView:(UITableView *)tableView reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    if (!tableView) {
        NSLog(@"%@%s",@"你未传入有效tableView,虽然不影响获取headerFooterView,但无法复用！！！",__func__);
    }
    NSString *identifier = [NSString stringWithFormat:@"%@_Identifier",reuseIdentifier];
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!view) {
        view = [[self alloc]initWithReuseIdentifier:identifier];
    }
    return view;
}
+ (instancetype)ppmake_headerFooterViewWithTableView:(UITableView *)tableView
{
    return [self ppmake_headerFooterViewWithTableView:tableView reuseIdentifier:NSStringFromClass(self)];
}
@end
