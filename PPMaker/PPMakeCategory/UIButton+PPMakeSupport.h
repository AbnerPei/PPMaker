//
//  UIButton+PPMakeSupport.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^makeBtActionBlock)(void);

@interface UIButton (PPMakeSupport)
//button点击事件block
-(void)ppmake_actionWithControlEvent:(UIControlEvents )event
                           withBlock:(makeBtActionBlock)actionBlock;
-(void)ppmake_actionWithBlock:(makeBtActionBlock)actionBlock;
@end



@interface UIControl (PPMakeSupport)
/** 点击事件的间隔时间 */
@property(nonatomic,assign) NSTimeInterval clickTimeInterval;
/**
 * 是否忽略点击事件，还有改属性不建议外部调用。
 * 🙏🙏🙏： 如果想纯粹的不让点击，设置userInteractionEnabled = NO即可,而别管clickTimeInterval && isIgnoreClickEvent && reset。
 * 📱📱📱：【补充说明】既然用isIgnoreClickEvent了，就不要考虑userInteractionEnabled了，
 *                  虽然两者意思相同，但最终效果不一样。混合使用可能会有不想要的结果。【亲测】
 */
@property(nonatomic,assign) BOOL isIgnoreClickEvent;
/**
 * 重置button的可点击状态，为可点击，用于clickTimeInterval时间未到，但是需要可点击。
 */
-(void)ppmake_reset;
@end
