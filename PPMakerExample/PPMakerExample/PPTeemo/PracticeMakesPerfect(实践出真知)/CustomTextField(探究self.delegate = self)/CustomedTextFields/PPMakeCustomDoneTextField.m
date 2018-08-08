//
//  PPMakeCustomDoneTextField.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/25.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeCustomDoneTextField.h"

@implementation PPMakeCustomDoneTextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
