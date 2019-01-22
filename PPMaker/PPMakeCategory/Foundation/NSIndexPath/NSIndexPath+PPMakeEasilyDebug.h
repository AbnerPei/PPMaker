//
//  NSIndexPath+PPMakeEasilyDebug.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/4.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (PPMakeEasilyDebug)
- (void)ppmake_debugLog;
- (NSString *)ppmake_debugDescription;
- (NSString *)ppmake_debugDescriptionAndLog;
@end
