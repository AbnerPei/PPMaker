//
//  PPImageViewMaker.h
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PPImageViewMaker : NSObject

@property(nonatomic,copy,readonly) PPImageViewMaker *(^intoView)(UIView *superV);
@property(nonatomic,copy,readonly) PPImageViewMaker *(^frame)(CGRect frame);

@property(nonatomic,copy,readonly) PPImageViewMaker *(^image)(UIImage *image);
@property(nonatomic,copy,readonly) PPImageViewMaker *(^imageName)(NSString *imageName);

/**
 * 设置图片的contentMode,默认是UIViewContentModeScaleAspectFit（保持图片内容的纵横比例，来适应视图的大小）
 * 此处注意：系统默认是UIViewContentModeScaleToFill（根据视图的比例去拉伸图片内容）
 * 其它值得关注的：
 * UIViewContentModeScaleAspectFill（用图片内容来填充视图的大小，多余得部分可以被修剪掉来填充整个视图边界）
 * UIViewContentModeCenter（保持图片原比例在视图中间显示图片内容，如果视图大小小于图片的尺寸，则图片会超出视图边界，只能看到中间的部分）
 */
@property(nonatomic,copy,readonly) PPImageViewMaker *(^contentMode)(UIViewContentMode contentMode);

@property(nonatomic,copy,readonly) PPImageViewMaker *(^userInteractionEnabled)(BOOL userInteractionEnabled);


@end

@interface UIImageView (PPMaker)
+(UIImageView *)pp_imgVMake:(void(^)(PPImageViewMaker *maker))make;
@end
