//
//  UITableView+PPMakeSupport.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/30.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UITableView+PPMakeSupport.h"

@implementation UITableView (PPMakeSupport)

- (void)registerClasses:(NSArray<Class> *)cellClasses forCellReuseIdentifiers:(NSArray<NSString *> *)identifiers
{
    if (cellClasses.count == 0) {
        return;
    }
    
    if (cellClasses.count != identifiers.count && identifiers.count > 0) {
        return;
    }
    
    for (int i = 0; i < cellClasses.count; i++) {
        Class cls = cellClasses[i];
        NSString *identifier = @"cell";
        if (identifiers.count > i) {
            identifier = identifiers[i];
        }else{
            identifier = NSStringFromClass([cls class]);
        }
        [self registerClass:cls forCellReuseIdentifier:identifier];
    }
}

- (void)registerClasses:(NSArray<Class> *)cellClasses
{
    [self registerClasses:cellClasses forCellReuseIdentifiers:nil];
}

@end
