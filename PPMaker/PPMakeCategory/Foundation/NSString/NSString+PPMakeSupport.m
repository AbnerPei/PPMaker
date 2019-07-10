//
//  NSString+PPMakeSupport.m
//  PPMakerExample
//
//  Created by PPAbner on 2019/7/10.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import "NSString+PPMakeSupport.h"

@implementation NSString (PPMakeSupport)

+ (NSString *)pp_displayName
{
    NSString *name = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleDisplayName"];
    if (!name) {
        name = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleName"];
    }
    return name;
}
@end
