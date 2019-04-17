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

NS_ASSUME_NONNULL_BEGIN

#pragma mark --- system font
CG_INLINE UIFont *systemFontOfSize(CGFloat fontSize){
    return [UIFont systemFontOfSize:fontSize];
}

CG_INLINE UIFont *boldSystemFontOfSize(CGFloat fontSize){
    return [UIFont boldSystemFontOfSize:fontSize];
}

#pragma mark --- custom font
CG_INLINE UIFont *fontWithNameSize(NSString *fontName,CGFloat fontSize){
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    if (font) {
        return font;
    }
    return [UIFont systemFontOfSize:fontSize];
}

CG_INLINE UIFont *fontPingFangSCRegular(CGFloat fontSize){
    return fontWithNameSize(kFontNamePingFangSCRegular, fontSize);
}

CG_INLINE UIFont *fontPingFangSCMedium(CGFloat fontSize){
    return fontWithNameSize(kFontNamePingFangSCMedium, fontSize);
}

CG_INLINE UIFont *fontPingFangSCSemibold(CGFloat fontSize){
    return fontWithNameSize(kFontNamePingFangSCSemibold, fontSize);
}

NS_ASSUME_NONNULL_END

#endif /* PPMakerUIFontDefine_h */
