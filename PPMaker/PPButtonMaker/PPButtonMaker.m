//
//  PPButtonMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPButtonMaker.h"
#import <objc/runtime.h>
#import "PPMaker.h"

static char KBtnActionBlockKey;

@interface UIButton (PPMakerActionBlock)
-(void)actionWithControlEvent:(UIControlEvents )event
                    withBlock:(actionB)block;
-(void)actionWithBlock:(actionB)block;
@end

@implementation UIButton (PPMakerActionBlock)
-(void)actionWithControlEvent:(UIControlEvents )event
                    withBlock:(actionB)block
{
    objc_setAssociatedObject(self, &KBtnActionBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)actionWithBlock:(actionB)block
{
    [self actionWithControlEvent:UIControlEventTouchUpInside withBlock:block];
}

-(void)clickAction:(UIButton *)button{
    actionB block =objc_getAssociatedObject(self, &KBtnActionBlockKey);
    if (block) {
        block();
    }
}
@end

@interface PPButtonMaker ()
/** 要创建的bt */
@property(nonatomic,strong) UIButton *creatingBT;
/** 记录bt的block点击事件 */
@property(nonatomic,copy) actionB creatingBtActionBlock;

@end

@implementation PPButtonMaker
-(instancetype)init
{
    self = [super init];
    if (self) {
        PPMakerWeakSelf(self)
        //父视图
        _intoView = ^PPButtonMaker *(UIView *superV){
            PPMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingBT];
            }
            return self;
        };
        
        //frame
        _frame = ^PPButtonMaker *(CGRect frame){
            PPMakerStrongSelf(self)
            self.creatingBT.frame = frame;
            return self;
        };
        
        //背景色
        _bgColor = ^PPButtonMaker *(UIColor *color){
            PPMakerStrongSelf(self)
            self.creatingBT.backgroundColor = color;
            return self;
        };
        
        //字体颜色
        _titleColor = ^PPButtonMaker *(UIColor *titleColor,UIControlState state){
            PPMakerStrongSelf(self)
            [self.creatingBT setTitleColor:titleColor forState:state];
            return self;
        };
        
        //文字
        _title = ^PPButtonMaker *(NSString *title,UIControlState state){
            PPMakerStrongSelf(self)
            [self.creatingBT setTitle:title forState:state];
            return self;
        };
        
        //点击事件
        _actionBlock = ^PPButtonMaker *(actionB block){
            PPMakerStrongSelf(self)
            if (block) {
                self.creatingBtActionBlock = block;
            }
            return self;
        };
    }
    return self;
}
+(UIButton *)pp_btMake:(void (^)(PPButtonMaker *))make
{
    PPButtonMaker *btMaker = [[PPButtonMaker alloc]init];
    if (make) {
        make(btMaker);
    }
    return btMaker.creatingBT;
}
-(UIButton *)creatingBT
{
    if (!_creatingBT) {
        _creatingBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [_creatingBT actionWithBlock:^{
            if (self.creatingBtActionBlock) {
                self.creatingBtActionBlock();
            }
        }];
    }
    return _creatingBT;
}
@end





