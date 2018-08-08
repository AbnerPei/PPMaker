//
//  UITableViewCell+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/6.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (PPMakeSupport)
+(instancetype)ppmake_cellWithTableView:(UITableView *)tableView;

+(instancetype)ppmake_cellWithTableView:(UITableView *)tableView
                             identifier:(NSString *)identifier;
@end
