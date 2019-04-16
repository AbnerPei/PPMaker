//
//  PPMakerConsts.m
//  PPMakerExample
//
//  Created by PPAbner on 2019/4/16.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import "PPMakerConsts.h"

NSString *const kFontNamePingFangSCSemibold = @"PingFangSC-Semibold";
NSString *const kFontNamePingFangSCMedium   = @"PingFangSC-Medium";
NSString *const kFontNamePingFangSCRegular  = @"PingFangSC-Regular";

PPMakerRegularExpressionLimitTypeKey const PPMakerRegularExpressionLimitTypeKeyNumber = @"^[0-9]*$"; //数字
PPMakerRegularExpressionLimitTypeKey const PPMakerRegularExpressionLimitTypeKeyLetter = @"^[A-Za-z]+$"; //字母
PPMakerRegularExpressionLimitTypeKey const PPMakerRegularExpressionLimitTypeKeyChnese = @"^[\u4e00-\u9fa5]{0,}$"; //汉字
PPMakerRegularExpressionLimitTypeKey const PPMakerRegularExpressionLimitTypeKeyEmail = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";  //邮箱


@implementation PPMakerConsts

@end
