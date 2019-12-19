//
//  PPMakerNSStringDefine.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/4/17.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#ifndef PPMakerNSStringDefine_h
#define PPMakerNSStringDefine_h

#import "PPMakerConsts.h"

#pragma mark --- 字符串判断
NS_INLINE BOOL isSafeStr(NSString * _Nullable str){
    if ([str isKindOfClass:[NSNull class]]
        || str == (id)kCFNull  // (id)kCFNull 等价于 [NSNull null]
        || str == nil
        || str.length == 0
        || [str isEqualToString:@"(null)"]
        || [str isEqualToString:@"null"]
        || [str isEqualToString:@"NULL"]
        || [str isEqualToString:@"（null）"]
        || [str isEqualToString:@"<null>"]
        || [str isEqualToString:@"<NULL>"]
        || [str isEqualToString:@"nil"]){
        return NO;
    }else{
        return YES;
    }
}

#pragma mark --- 正则表达式相关的NSString ----- start
NS_INLINE BOOL isMatchedUsingRegex(NSString *str,NSString *limitTypeKey){
    if (!isSafeStr(str)) {
        return NO;
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", limitTypeKey];
    BOOL isMatch = [predicate evaluateWithObject:str];
    return isMatch;
}

NS_INLINE BOOL isMatchedUsingPPMakerRegex(NSString *str,PPMakerRegularExpressionLimitTypeKey limitTypeKey){
    return isMatchedUsingRegex(str, limitTypeKey);
}
#pragma mark --- 正则表达式相关的NSString ----- end

NS_INLINE BOOL isNumber(NSString *str){
    return isMatchedUsingPPMakerRegex(str, PPMakerRegularExpressionLimitTypeKeyNumber);
}

#pragma mark --- 字符串操作
NS_INLINE NSString *safeStr(NSString * _Nullable str){
    if (isSafeStr(str)) {
        return str;
    }
    return @"";
}

/**
 用字符串b替换字符串str中的a
 
 @param str 原始字符串
 @param a 字符串a
 @param b 字符串b
 @return b替换a后新的字符串
 */
NS_INLINE NSString *replaceAWithB(NSString *str,NSString *a,NSString *b){
    if (![str containsString:a]) {
        return str;
    }
    NSRange totalRange = NSMakeRange(0, str.length);
    NSString *newStr = [str stringByReplacingOccurrencesOfString:a withString:b options:NSLiteralSearch range:totalRange];
    return newStr;
}

/** 移除字符串str中的所有空格 */
NS_INLINE NSString *removeSpace(NSString *str){
    return replaceAWithB(str, @" ", @"");
}

#pragma mark --- 字符串计算
/** 获取字符串str的length（区分中英文，即一个中文字符长度为2，一个英文字符长度为1）*/
NS_INLINE NSUInteger lengthCN2EN1(NSString * _Nullable str){
    NSUInteger length = 0;
    char* p = (char*)[str cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i = 0 ; i < [str lengthOfBytesUsingEncoding:NSUnicodeStringEncoding]; i++) {
        if (*p) {
            p++;
            length++;
        }else {
            p++;
        }
    }
    return length;
}

#pragma mark --- info.plst
NS_INLINE NSString *appName(){
    NSString *name = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleDisplayName"];
    if (isSafeStr(name)) {
        return name;
    }else{
       name = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleName"];
    }
    return name;
}

#pragma mark --- 是否相同
NS_INLINE BOOL isEqualString( NSString * _Nullable str1,  NSString * _Nullable str2){
    if (isSafeStr(str1) && isSafeStr(str2)) {
        return [str1 isEqualToString:str2];
    }else{
        return NO;
    }
}
  
#endif /* PPMakerNSStringDefine_h */
