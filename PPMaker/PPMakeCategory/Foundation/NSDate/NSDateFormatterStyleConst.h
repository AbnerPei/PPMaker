//
//  NSDateFormatterStyleConst.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/10/11.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString *NSDateFormatterStyleKey;
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyLine_yyyyMMdd_HHmmss;     /// 2017-11-25 16:22:55
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyLine_yyyyMMdd_HHmm;       /// 2017-11-25 16:22
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyLine_yyyyMMdd;            /// 2017-11-25
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyLine_yyMMdd_HHmmss;       /// 17-11-25 16:22:55
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyLine_yyMMdd_HHmm;         /// 17-11-25 16:22
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyLine_yyMMdd;              /// 17-11-25
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyLine_MMdd_HHmmss;         /// 11-25 16:22:55
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyLine_MMdd_HHmm;           /// 11-25 16:22
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyLine_MMdd;                /// 11-25
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyLine_HHmmss;              /// 16:22:55
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyLine_HHmm;                /// 16:22
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeySlash_yyyyMMdd_HHmmss;    /// 2017/11/25 16:22:55
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeySlash_yyyyMMdd_HHmm;      /// 2017/11/25 16:22
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeySlash_yyyyMMdd;           /// 2017/11/25
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeySlash_yyMMdd_HHmmss;      /// 17/11/25 16:22:55
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeySlash_yyMMdd_HHmm;        /// 17/11/25 16:22
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeySlash_yyMMdd;             /// 17/11/25
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeySlash_MMdd_HHmmss;        /// 11/25 16:22:55
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeySlash_MMdd_HHmm;          /// 11/25 16:22
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeySlash_MMdd;               /// 11/25
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeySlash_HHmmss;             /// 16:22:55
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeySlash_HHmm;               /// 16:22
//CN是中文的
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyCN_yyyyMMdd_HHmmss;       ///2017年11月25日 16时22分55秒
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyCN_yyyyMMdd_HHmm;         ///2017年11月25日 16时22分
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyCN_yyyyMMdd;              ///2017年11月25日
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyCN_yyMMdd_HHmmss;         ///17年11月25日 16时22分55秒
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyCN_yyMMdd_HHmm;           ///17年11月25日 16时22分
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyCN_yyMMdd;                ///17年11月25日
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyCN_MMdd_HHmmss;           ///11月25日 16时22分55秒
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyCN_MMdd_HHmm;             ///11月25日 16时22分
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyCN_MMdd;                  ///11月25日
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyCN_HHmmss;                ///16时22分55秒
extern NSDateFormatterStyleKey const NSDateFormatterStyleKeyCN_HHmm;                  ///16时22分

@interface NSDateFormatterStyleConst : NSObject

@end

