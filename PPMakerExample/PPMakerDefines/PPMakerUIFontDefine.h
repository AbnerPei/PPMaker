//
//  PPMakerUIFontDefine.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/4/16.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#ifndef PPMakerUIFontDefine_h
#define PPMakerUIFontDefine_h
#import "PPMakerConsts.h"

#pragma mark --- system font
UIKIT_STATIC_INLINE UIFont *PPMakeUIFontSystemFontOfSize(CGFloat fontSize){
    return [UIFont systemFontOfSize:fontSize];
}

UIKIT_STATIC_INLINE UIFont *PPMakeUIFontBoldSystemFontOfSize(CGFloat fontSize){
    return [UIFont boldSystemFontOfSize:fontSize];
}

#pragma mark --- custom font
UIKIT_STATIC_INLINE UIFont *PPMakeUIFontWithNameSize(NSString *fontName,CGFloat fontSize){
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    if (font) {
        return font;
    }
    return [UIFont systemFontOfSize:fontSize];
}

UIKIT_STATIC_INLINE UIFont *PPMakeUIFontPingFangSCRegular(CGFloat fontSize){
    return PPMakeUIFontWithNameSize(kFontNamePingFangSCRegular, fontSize);
}

UIKIT_STATIC_INLINE UIFont *PPMakeUIFontPingFangSCMedium(CGFloat fontSize){
    return PPMakeUIFontWithNameSize(kFontNamePingFangSCMedium, fontSize);
}

UIKIT_STATIC_INLINE UIFont *PPMakeUIFontPingFangSCSemibold(CGFloat fontSize){
    return PPMakeUIFontWithNameSize(kFontNamePingFangSCSemibold, fontSize);
}

#endif /* PPMakerUIFontDefine_h */
