//
//  PPMakerConsts.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/4/16.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark --- 字体(Font)
/* 苹方-简 中粗体 */
extern NSString *const kFontNamePingFangSCSemibold;
/* 苹方-简 中黑体 */
extern NSString *const kFontNamePingFangSCMedium;
/* 苹方-简 常规体 */
extern NSString *const kFontNamePingFangSCRegular;

#pragma mark --- 正则表达式(Regular Expression)
/* 正则表达式用到的限制条件 */
typedef NSString *PPMakerRegularExpressionLimitTypeKey;
extern PPMakerRegularExpressionLimitTypeKey const PPMakerRegularExpressionLimitTypeKeyNumber; //数字
extern PPMakerRegularExpressionLimitTypeKey const PPMakerRegularExpressionLimitTypeKeyLetter; //字母
extern PPMakerRegularExpressionLimitTypeKey const PPMakerRegularExpressionLimitTypeKeyChnese; //汉字
extern PPMakerRegularExpressionLimitTypeKey const PPMakerRegularExpressionLimitTypeKeyEmail;  //邮箱

