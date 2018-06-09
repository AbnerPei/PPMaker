//
//  PPMake+UIImageView.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/6/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake.h"

@interface PPMake (UIImageView)

/**【UIImageView】设置image,传(UIImage *)对象。*/
@property(nonatomic,copy,readonly) PPMake *(^image)(UIImage *image);
/**【UIImageView】设置image,传图片名(NSString *)对象。*/
@property(nonatomic,copy,readonly) PPMake *(^imageName)(NSString *imageName);
@end
