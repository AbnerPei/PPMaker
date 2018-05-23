//
//  PPMake.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/17.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake.h"

#define PPMake_SpecialAssert(_makeType_) \
NSString *recommendStr = \
[NSString stringWithFormat:@"%@不是%@所拥有的属性,请注意！",NSStringFromSelector(_cmd),NSStringFromClass([self.creatingV class])]; \
NSAssert(self.makeType == (_makeType_), recommendStr);

#define PPMake_TableViewSpecialAssert \
NSString *recommendString = \
[NSString stringWithFormat:@"%@不是%@所拥有的属性,请注意！",NSStringFromSelector(_cmd),NSStringFromClass([self.creatingV class])]; \
NSAssert((self.makeType == PPMakeTypeTableVPlain || self.makeType == PPMakeTypeTableVGrouped), recommendString);


@interface PPMake ()
/** 要创建的ui */
@property(nonatomic,strong) UIView *creatingV;
/** 记录当前要创建的UI类型，以便于特殊处理 */
@property(nonatomic,assign) PPMakeType makeType;

@end

@implementation PPMake
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


+(instancetype)makeWithType:(PPMakeType)makeType
{
    PPMake *m = [[PPMake alloc]init];
    m.makeType = makeType;
    
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
            m.creatingV.contentMode = UIViewContentModeScaleAspectFit;
        }
            break;
        //UITableView
        case PPMakeTypeTableVPlain:{
            m.creatingV = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        }
            break;
        case PPMakeTypeTableVGrouped:{
            m.creatingV = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        }
            break;
            
        default:
            break;
    }
    return m;
}

-(UIView *)pp_make:(void (^)(PPMake *))make
{
    PPMake *m = self;
    if (!m) { return nil; }
    if (make) { make(m);}
    return self.creatingV;
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

#pragma mark --- label相关
@implementation PPMake (UILabelSupport)
#pragma mark --- 文字
-(PPMake *(^)(NSString *))text
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSString *text){
        UILabel *lb = (UILabel *)self.creatingV;
        lb.text = text;
        return self;
    };
}
#pragma mark --- attributedText
-(PPMake *(^)(NSAttributedString *))attributedText
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSAttributedString *aStr){
        UILabel *lb = (UILabel *)self.creatingV;
        lb.attributedText = aStr;
        return self;
    };
}
#pragma mark --- 字体颜色
-(PPMake *(^)(UIColor *))textColor
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(UIColor *color){
        UILabel *lb = (UILabel *)self.creatingV;
        lb.textColor = color;
        return self;
    };
}
#pragma mark --- font
-(PPMake *(^)(UIFont *))font
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(UIFont *font){
        UILabel *lb = (UILabel *)self.creatingV;
        lb.font = font;
        return self;
    };
}
-(PPMake *(^)(CGFloat))fontSize
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(CGFloat fontSize){
        UILabel *lb = (UILabel *)self.creatingV;
        lb.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}
-(PPMake *(^)(CGFloat))boldFontSize
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(CGFloat boldFontSize){
        UILabel *lb = (UILabel *)self.creatingV;
        lb.font = [UIFont boldSystemFontOfSize:boldFontSize];
        return self;
    };
}
-(PPMake *(^)(NSString *, CGFloat))fontNameAndSize
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSString *fontName,CGFloat fontSize){
        UILabel *lb = (UILabel *)self.creatingV;
        lb.font = [UIFont fontWithName:fontName size:fontSize];
        return self;
    };
}
#pragma mark --- 文字对齐方式
-(PPMake *(^)(NSTextAlignment))textAlignment
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSTextAlignment textAlignment){
        UILabel *lb = (UILabel *)self.creatingV;
        lb.textAlignment = textAlignment;
        return self;
    };
}
#pragma mark --- numberOfLines
-(PPMake *(^)(NSInteger))numberOfLines
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSInteger numberOfLines){
        UILabel *lb = (UILabel *)self.creatingV;
        lb.numberOfLines = numberOfLines;
        return self;
    };
}
#pragma mark --- 尾巴
-(PPMake *(^)(NSLineBreakMode))lineBreakMode
{
    PPMake_SpecialAssert(PPMakeTypeLB)
    return ^PPMake *(NSLineBreakMode lineBreakMode){
        UILabel *lb = (UILabel *)self.creatingV;
        lb.lineBreakMode = lineBreakMode;
        return self;
    };
}
@end

#pragma mark --- button相关的
@implementation PPMake (UIButtonSupport)

#pragma mark --- private method
/**
 内部提供的方法：设置button的title以及titleColor
 */
static inline PPMake *makeBtTC(id tOrC,UIControlState cs,BOOL isT,PPMake *m){
    UIButton *bt = (UIButton *)m.creatingV;
    if (isT) {
        [bt setTitle:tOrC forState:cs];
    }else{
        [bt setTitleColor:tOrC forState:cs];
    }
    return m;
}

-(PPMake *(^)(NSString *, UIControlState))title
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(NSString *t,UIControlState cs){
       return makeBtTC(t, cs, YES, self);
    };
}
-(PPMake *(^)(NSString *))normalTitle
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(NSString *nt){
        return makeBtTC(nt, UIControlStateNormal, YES, self);
    };
}
-(PPMake *(^)(NSString *))highlightedTitle
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(NSString *ht){
        return makeBtTC(ht, UIControlStateHighlighted, YES, self);
    };
}

-(PPMake *(^)(UIColor *, UIControlState))titleColor
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(UIColor *tc,UIControlState cs){
        return makeBtTC(tc, cs, NO, self);
    };
}
-(PPMake *(^)(UIColor *))normalTitleColor
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(UIColor *ntc){
        return makeBtTC(ntc, UIControlStateNormal, NO, self);
    };
}
-(PPMake *(^)(UIColor *))highlightedTitleColor
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(UIColor *htc){
        return makeBtTC(htc, UIControlStateHighlighted, NO, self);
    };
}
static inline PPMake *makeBtTA(id target,SEL action,UIControlEvents ce,PPMake *m){
    UIButton *bt = (UIButton *)m.creatingV;
    [bt addTarget:target action:action forControlEvents:ce];
    return m;
}
-(PPMake *(^)(id, SEL, UIControlEvents))addTarget
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(id target,SEL action,UIControlEvents ce){
        return makeBtTA(target, action, ce, self);
    };
}
-(PPMake *(^)(id, SEL))addTargetTouchUpInside
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(id target,SEL action){
        return makeBtTA(target, action, UIControlEventTouchUpInside, self);
    };
}
-(PPMake *(^)(makeBtActionBlock))actionBlock
{
    PPMake_SpecialAssert(PPMakeTypeBT)
    return ^PPMake *(makeBtActionBlock ab){
        if (ab) {
            UIButton *bt = (UIButton *)self.creatingV;
            [bt ppmake_actionWithBlock:ab];
        }
        return self;
    };
}
#pragma mark --- 设置button的图片
-(PPMake *(^)(UIImage *, UIControlState))image
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(UIImage *img,UIControlState state){
      UIButton *bt = (UIButton *)self.creatingV;
        [bt setImage:img forState:state];
        return self;
    };
}
-(PPMake *(^)(NSString *, UIControlState))imageName
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(NSString *imgN,UIControlState s){
        UIButton *bt = (UIButton *)self.creatingV;
        [bt setImage:[UIImage imageNamed:imgN] forState:s];
        return self;
    };
}
-(PPMake *(^)(NSString *))normalImageName
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(NSString *nImgN){
        UIButton *bt = (UIButton *)self.creatingV;
        [bt setImage:[UIImage imageNamed:nImgN] forState:UIControlStateNormal];
        return self;
    };
}
-(PPMake *(^)(NSString *))highlightedImageName
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(NSString *hImgN){
        UIButton *bt = (UIButton *)self.creatingV;
        [bt setImage:[UIImage imageNamed:hImgN] forState:UIControlStateHighlighted];
        return self;
    };
}
#pragma mark --- attributedString
-(PPMake *(^)(NSAttributedString *, UIControlState))attributedString
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(NSAttributedString *as,UIControlState s){
        UIButton *bt = (UIButton *)self.creatingV;
        [bt setAttributedTitle:as forState:s];
        return self;
    };
}
-(PPMake *(^)(NSAttributedString *))normalAttributedString
{
    return [self _asWithState:UIControlStateNormal];
}
-(PPMake *(^)(NSAttributedString *))highlightAttributedString
{
    return [self _asWithState:UIControlStateHighlighted];
}
-(PPMake *(^)(NSAttributedString *))_asWithState:(UIControlState)state
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(NSAttributedString *as){
        UIButton *bt = (UIButton *)self.creatingV;
        [bt setAttributedTitle:as forState:state];
        return self;
    };
}
-(PPMake *(^)(UIFont *, UIColor *, UIControlState))attributedFontColor
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(UIFont *f,UIColor *c,UIControlState cs){
        return [self _configureBtAttributedFont:f color:c state:cs];
    };
}
-(PPMake *)_configureBtAttributedFont:(UIFont *)f color:(UIColor *)c state:(UIControlState)state
{
    UIButton *bt = (UIButton *)self.creatingV;
    NSString *title = [bt titleForState:state];
    NSString *stateStr = @"UIControlStateNormal";
    if (state == UIControlStateHighlighted) {
        stateStr = @"UIControlStateHighlighted";
    }
    NSString *recommendStr = [NSString stringWithFormat:@"PPMaker提示：%@状态下的title为空时，无法设置对应的attributedStr",stateStr];
    NSAssert(title.length>0, recommendStr);
    NSMutableDictionary<NSAttributedStringKey, id> *attributes = [NSMutableDictionary dictionary];
    if (f) {
        [attributes setValue:f forKey:NSFontAttributeName];
    }
    if (c) {
        [attributes setValue:c forKey:NSForegroundColorAttributeName];
    }
    NSMutableAttributedString *titleAttributedStr = [[NSMutableAttributedString alloc]initWithString:title attributes:attributes];
    [bt setAttributedTitle:titleAttributedStr forState:state];
    return self;
}
-(PPMake *(^)(UIFont *, UIColor *))normalAttributedFontColor
{
    return [self _asFontColorWithState:UIControlStateNormal];
}
-(PPMake *(^)(UIFont *, UIColor *))highlightAttributedFontColor
{
    return [self _asFontColorWithState:UIControlStateHighlighted];
}
-(PPMake *(^)(UIFont *, UIColor *))_asFontColorWithState:(UIControlState)state
{
    PPMake_SpecialAssert(PPMakeTypeBT);
    return ^PPMake *(UIFont *f,UIColor *c){
        return [self _configureBtAttributedFont:f color:c state:state];
    };
}
@end

#pragma mark --- tableView支持
@implementation PPMake (UITableViewSupport)
-(PPMake *(^)(id))delegate
{
    PPMake_TableViewSpecialAssert
    return ^PPMake *(id d){
        UITableView *tableV = (UITableView *)self.creatingV;
        tableV.delegate = d;
        tableV.dataSource = d;
        return self;
    };
}
#pragma mark --- 隐藏分割线(all)
-(PPMake *(^)(BOOL))hideAllSeparator
{
    PPMake_TableViewSpecialAssert
    return ^PPMake *(BOOL isHidden){
        if (isHidden) {
            UITableView *tableV = (UITableView *)self.creatingV;
            tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        }
        return self;
    };
}
#pragma mark --- 隐藏分割线(extra)
-(PPMake *(^)(BOOL))hideExtraSeparator
{
    PPMake_TableViewSpecialAssert
    return ^PPMake *(BOOL isHidden){
        if (isHidden) {
            UITableView *tableV = (UITableView *)self.creatingV;
            [tableV setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        }
        return self;
    };
}
@end

@implementation PPMake (UIImageViewSupport)
#pragma mark --- 图片
-(PPMake *(^)(UIImage *))image
{
    PPMake_SpecialAssert(PPMakeTypeImgV)
    return ^PPMake *(UIImage *image){
        UIImageView *imgV = (UIImageView *)self.creatingV;
        imgV.image = image;
        return self;
    };
}
#pragma mark --- 图片名字
-(PPMake *(^)(NSString *))imageName
{
    PPMake_SpecialAssert(PPMakeTypeImgV)
    return ^PPMake *(NSString *imageName){
        UIImageView *imgV = (UIImageView *)self.creatingV;
        if (imageName && imageName.length > 0) {
            imgV.image = [UIImage imageNamed:imageName];
        }
        return self;
    };
}
@end



