//
//  PPMake.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/17.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake.h"
#import "UIView+PPMakeSupportCornerAndShadow.h"

#define kMasksToBounds \
if (!self.creatingV.layer.masksToBounds) { \
    self.creatingV.layer.masksToBounds = YES; \
}

@interface PPMake ()
/** 要创建的ui */
@property(nonatomic,strong) UIView *creatingV;
/** 记录当前要创建的UI类型，以便于特殊处理 */
@property(nonatomic,assign) PPMakeType mType;
@end

@implementation PPMake

-(UIView *)pp_make:(void (^)(PPMake *))make
{
    PPMake *m = self;
    if (!m) { return nil; }
    if (make) { make(m);}
    return self.creatingV;
}

+(instancetype)makeWithType:(PPMakeType)makeType
{
    PPMake *m = [[PPMake alloc]init];
    m.mType = makeType;
    
    switch (makeType) {
            //UIView
        case PPMakeTypeView: { m.creatingV = [[UIView alloc]init];}
            break;
            //UILabel
        case PPMakeTypeLB:{ m.creatingV = [[UILabel alloc]init]; }
            break;
            //UIButton
        case PPMakeTypeBT:{ m.creatingV = [UIButton buttonWithType:UIButtonTypeCustom];}
            break;
            //UIImageView
        case PPMakeTypeImgV:{
            m.creatingV = [[UIImageView alloc]init];
        }
            break;
            //UITableView
        case PPMakeTypeTableVPlain:{
            UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
            m.creatingV = tableV;
            
        }
            break;
        case PPMakeTypeTableVGrouped:{
            UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
            tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
            m.creatingV = tableV;
        }
            break;
            
        default:
            break;
    }
    return m;
}
-(UIView *)createdView
{
    return self.creatingV;
}
-(PPMakeType)makeType
{
    return self.mType;
}
#pragma mark --- 父视图
-(PPMake *(^)(UIView *))intoView
{
    return ^PPMake *(UIView *superV){
        if (superV) {
            [superV addSubview:self.creatingV];
        }
        return self;
    };
}
#pragma mark --- frame
-(PPMake *(^)(CGRect))frame
{
    return ^PPMake *(CGRect frame){
        self.creatingV.frame = frame;
        return self;
    };
}
#pragma mark --- 背景色
-(PPMake *(^)(UIColor *))bgColor
{
    return ^PPMake *(UIColor *color){
        self.creatingV.backgroundColor = color;
        return self;
    };
}
#pragma mark --- 是否隐藏
-(PPMake *(^)(BOOL))hidden
{
    return ^PPMake *(BOOL isHidden){
        self.creatingV.hidden = isHidden;
        return self;
    };
}
-(PPMake *(^)(NSInteger))tag
{
    return ^PPMake *(NSInteger t){
        self.creatingV.tag = t;
        return self;
    };
}
-(PPMake *(^)(BOOL))userInteractionEnabled
{
    return ^PPMake *(BOOL userIE){
        self.creatingV.userInteractionEnabled = userIE;
        return self;
    };
}
-(PPMake *(^)(UIViewContentMode))contentMode
{
    return ^PPMake *(UIViewContentMode cm){
        self.creatingV.contentMode = condense;
        return self;
    };
}
-(PPMake *(^)(CGFloat))cornerRadius
{
    return ^PPMake *(CGFloat cr){
        kMasksToBounds
        self.creatingV.layer.cornerRadius = cr;
        return self;
    };
}
-(PPMake *(^)(CGFloat))borderWidth
{
    return ^PPMake *(CGFloat bw){
        kMasksToBounds
        self.creatingV.layer.borderWidth = bw;
        return self;
    };
}
-(PPMake *(^)(UIColor *))borderColor
{
    return ^PPMake *(UIColor *bc){
        kMasksToBounds
        self.creatingV.layer.borderColor = bc.CGColor;
        return self;
    };
}

#pragma mark --- 是否裁剪超过父视图的部分， 系统默认NO
-(PPMake *(^)(BOOL))clipsToBounds
{
    return ^PPMake *(BOOL cb){
        self.creatingV.clipsToBounds = cb;
        return self;
    };
}

-(PPMake *(^)(CGFloat, CGFloat, CGFloat))cornerShadow
{
    return ^PPMake *(CGFloat cr,CGFloat sr,CGFloat so){
        [self.creatingV ppmake_cornerRadius:cr shadowRadius:sr shadowOpacity:so];
        return self;
    };
}
-(PPMake *(^)(makeViewGestureBlock))tapBlock
{
    return ^PPMake *(makeViewGestureBlock mb){
        if (mb) {
            [self.creatingV ppmake_tapBlock:mb];
        }
        return self;
    };
}
-(PPMake *(^)(makeViewGestureBlock))longPressBlock
{
    return ^PPMake *(makeViewGestureBlock mb){
        if (mb) {
            [self.creatingV ppmake_longPressBlock:mb];
        }
        return self;
    };
}

@end

@implementation UIView (PPMake)
-(void)pp_make:(void (^)(PPMake *))make
{
    PPMakeType makeType = PPMakeTypeView;
    if ([self isKindOfClass:[UILabel class]]) {
        makeType = PPMakeTypeLB;
    }else if ([self isKindOfClass:[UIButton class]]){
        makeType = PPMakeTypeBT;
    }else if ([self isKindOfClass:[UIImageView class]]){
        makeType = PPMakeTypeImgV;
    }else if ([self isKindOfClass:[UITableView class]]){
        UITableView *tableV = (UITableView *)self;
        makeType = (tableV.style == UITableViewStylePlain ? PPMakeTypeTableVPlain : PPMakeTypeTableVGrouped);
    }
    PPMake *m = PPMAKE(makeType);
    m.creatingV = self;
    if (make) {make(m);}
}
@end





