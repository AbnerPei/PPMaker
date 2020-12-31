//
//  PPMakerUIButtonDefine.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/4/17.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#ifndef PPMakerUIButtonDefine_h
#define PPMakerUIButtonDefine_h


UIKIT_STATIC_INLINE void setTitleNormal(UIButton *bt,NSString * _Nullable title){
    [bt setTitle:title forState:(UIControlStateNormal)];
}

UIKIT_STATIC_INLINE void setTitleHighlighted(UIButton *bt,NSString * _Nullable title){
    [bt setTitle:title forState:(UIControlStateHighlighted)];
}

UIKIT_STATIC_INLINE void setTitle(UIButton *bt,NSString * _Nullable title){
    setTitleNormal(bt, title);
    setTitleHighlighted(bt, title);
}

UIKIT_STATIC_INLINE void setTitleColorNormal(UIButton *bt,UIColor * _Nullable color){
    [bt setTitleColor:color forState:(UIControlStateNormal)];
}

UIKIT_STATIC_INLINE void setTitleColorHighlighted(UIButton *bt,UIColor * _Nullable color){
    [bt setTitleColor:color forState:(UIControlStateHighlighted)];
}

UIKIT_STATIC_INLINE void setTitleColor(UIButton *bt,UIColor * _Nullable color){
    setTitleColorNormal(bt, color);
    setTitleColorHighlighted(bt, color);
}

#pragma mark --- setImage
UIKIT_STATIC_INLINE void setImageNormal(UIButton *bt,UIImage * _Nullable image){
    [bt setImage:image forState:(UIControlStateNormal)];
}

UIKIT_STATIC_INLINE void setImageHighlighted(UIButton *bt,UIImage * _Nullable image){
    [bt setImage:image forState:(UIControlStateHighlighted)];
}

UIKIT_STATIC_INLINE void setImage(UIButton *bt,UIImage * _Nullable image){
    setImageNormal(bt, image);
    setImageHighlighted(bt, image);
}

UIKIT_STATIC_INLINE void setImageNameNormal(UIButton *bt,NSString * _Nullable imageName){
    if (imageName.length == 0 || !imageName) {
        return;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    if (!image) {
        return;
    }
    [bt setImage:image forState:(UIControlStateNormal)];
}

UIKIT_STATIC_INLINE void setImageNameHighlighted(UIButton *bt,NSString * _Nullable imageName){
    if (imageName.length == 0 || !imageName) {
        return;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    if (!image) {
        return;
    }
    [bt setImage:image forState:(UIControlStateHighlighted)];
}

UIKIT_STATIC_INLINE void setImageName(UIButton *bt,NSString * _Nullable imageName){
    setImageNameNormal(bt, imageName);
    setImageNameHighlighted(bt, imageName);
}

#pragma mark --- setBackgroundImage
UIKIT_STATIC_INLINE void setBackgroundImageNormal(UIButton *bt,UIImage * _Nullable image){
    [bt setBackgroundImage:image forState:(UIControlStateNormal)];
}

UIKIT_STATIC_INLINE void setBackgroundImageHighlighted(UIButton *bt,UIImage * _Nullable image){
    [bt setBackgroundImage:image forState:(UIControlStateHighlighted)];
}

UIKIT_STATIC_INLINE void setBackgroundImage(UIButton *bt,UIImage * _Nullable image){
    setBackgroundImageNormal(bt, image);
    setBackgroundImageHighlighted(bt, image);
}

UIKIT_STATIC_INLINE void setBackgroundImageNameNormal(UIButton *bt,NSString * _Nullable imageName){
    if (imageName.length == 0 || !imageName) {
        return;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    if (!image) {
        return;
    }
    [bt setBackgroundImage:image forState:(UIControlStateNormal)];
}

UIKIT_STATIC_INLINE void setBackgroundImageNameHighlighted(UIButton *bt,NSString * _Nullable imageName){
    if (imageName.length == 0 || !imageName) {
        return;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    if (!image) {
        return;
    }
    [bt setBackgroundImage:image forState:(UIControlStateHighlighted)];
}

UIKIT_STATIC_INLINE void setBackgroundImageName(UIButton *bt,NSString * _Nullable imageName){
    setBackgroundImageNameNormal(bt, imageName);
    setBackgroundImageNameHighlighted(bt, imageName);
}

#pragma mark --- setAttributedTitle
UIKIT_STATIC_INLINE void setAttributedTitleNormal(UIButton *bt,NSAttributedString * _Nullable title){
    if (!title || title.string.length == 0) {
        return;
    }
    [bt setAttributedTitle:title forState:(UIControlStateNormal)];
}

UIKIT_STATIC_INLINE void setAttributedTitleHighlighted(UIButton *bt,NSAttributedString * _Nullable title){
    if (!title || title.string.length == 0) {
        return;
    }
    [bt setAttributedTitle:title forState:(UIControlStateHighlighted)];
}

UIKIT_STATIC_INLINE void setAttributedTitle(UIButton *bt,NSAttributedString * _Nullable title){
    setAttributedTitleNormal(bt, title);
    setAttributedTitleHighlighted(bt, title);
}

#endif /* PPMakerUIButtonDefine_h */
