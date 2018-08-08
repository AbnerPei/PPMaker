//
//  PPTool.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^pptoolGridViewItemPropertyBlock)(CGFloat itemX,CGFloat itemY,CGFloat itemW,NSInteger currentIndex);

@interface PPTool : NSObject

/**
 * 九宫格布局，返回item的left/top/width (gridView命名借鉴Android)
 * * *
 * @param viewWidth              九宫格父视图的宽
 * @param viewLeftMargin         九宫格左边（left）
 * @param viewTopMargin          九宫格顶部（top）
 * @param itemVerticalMargin     九宫格item间垂直方向间距
 * @param itemHorizontalMargin   九宫格item间水平平方向间距
 * @param itemHeight             九宫格item高度
 * @param itemCount              九宫格item数量
 * @param itemPropertyBlock      回调block
 */
+(void)ppmake_gridViewWithViewWidth:(CGFloat)viewWidth
                     viewLeftMargin:(CGFloat)viewLeftMargin
                      viewTopMargin:(CGFloat)viewTopMargin
                 itemVerticalMargin:(CGFloat)itemVerticalMargin
               itemHorizontalMargin:(CGFloat)itemHorizontalMargin
                         itemHeight:(CGFloat)itemHeight
                          itemCount:(NSInteger)itemCount
                       rowItemCount:(NSInteger)rowItemCount
                  itemPropertyBlock:(pptoolGridViewItemPropertyBlock)itemPropertyBlock;

@end
