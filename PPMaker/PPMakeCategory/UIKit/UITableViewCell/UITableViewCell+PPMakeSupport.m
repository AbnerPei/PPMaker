//
//  UITableViewCell+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/6.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UITableViewCell+PPMakeSupport.h"

@implementation UITableViewCell (PPMakeSupport)
+(instancetype)ppmake_cellWithTableView:(UITableView *)tableView
{
    NSString *identifier = [NSString stringWithFormat:@"%@Identifier",NSStringFromClass([self class])];
    return [self ppmake_cellWithTableView:tableView identifier:identifier];
}

+(instancetype)ppmake_cellWithTableView:(UITableView *)tableView
                             identifier:(NSString *)identifier
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
