//
//  UIFontCacheViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/2.
//  Copyright © 2018年 PPAbner. All rights reserved.
//
/*
   ------------- 结论 ----
 
 #### ---- 字体
 是否有进入后台过：0
 UIFont新建的font     <UICTFont: 0x7fa711c1c5b0> font-family: "PingFangSC-Semibold"; font-weight: bold; font-style: normal; font-size: 14.00pt
 fontTestLB设置的font <UICTFont: 0x7fa711c1c5b0> font-family: "PingFangSC-Semibold"; font-weight: bold; font-style: normal; font-size: 14.00pt

 是否有进入后台过：1
 UIFont新建的font     <UICTFont: 0x7fa711e06450> font-family: "PingFangSC-Semibold"; font-weight: bold; font-style: normal; font-size: 14.00pt
 fontTestLB设置的font <UICTFont: 0x7fa711c1c5b0> font-family: "PingFangSC-Semibold"; font-weight: bold; font-style: normal; font-size: 14.00pt

 #### ---- 颜色
 是否有进入后台过：0
 UIColor新建的color     UIExtendedSRGBColorSpace 1 0 1 1
 fontTestLB设置的color  UIExtendedSRGBColorSpace 1 0 1 1
 
 是否有进入后台过：1
 UIColor新建的color     UIExtendedSRGBColorSpace 1 0 1 1
 fontTestLB设置的color UIExtendedSRGBColorSpace 1 0 1 1
 
 #### ---- PPMakeHomepageViewController中font打印
 系统启动就创建一个font对象 <UICTFont: 0x7fa711c1c5b0> font-family: "PingFangSC-Semibold"; font-weight: bold; font-style: normal; font-size: 14.00pt
 
 #### 总结：
 > 1. UIFont是有指针地址的，并且有缓存，而UIColor没有;
 > 2. UIFont的缓存，具体如下：
    -> 2.1 系统在启动某个APP时，如果遇到第一个UIFont对象的创建，就会开辟一部分空间，类似TableViewCell缓存池一样，然后把这个UIFont对象扔进缓存池，如果遇到第二个，先检测缓存池有没有，没有就创建，有，就把这个font指向缓存池已经存在的font,第三个、第四个...以此类推；
    -> 2.2 可，可，可，这时，APP被home到后台而没有杀掉，这时候又需要一个如上（已经存在or已经创建过）的font？如果缓存池逻辑的话，如上line 17就不会新建的font的指针跟fontTestLB所持有的font的指针不同？
      --> 2.2.1 我的解释：
        ----> 2.2.1.1 系统在进入后台（被home），像示例中的creatingFont肯定会被释放，而因为fontTestLB持有为它设置的font，它俩指向同一块内存地址，creatingFont虽然释放了，但是这块内存地址并没有释放。但是，系统会在进入后台时，把这个内存分配的更优（就是说，内存只够保存fontTestLB的font或者再多点，但是又不足以再存放任意font）;
        ----> 2.2.1.2 这时候，再进入前台，系统并没有去检测内存中的font，而是如2.1中那样，新建一个缓存池。（因为font分配的内存不大，但是去内存找到font缓存池，然后再在里面找到想要的font，这样的操作，没有新建一个缓存池来的效率高）；
    -> 2.3 如果这样说的话：用户反反复复进前台退后台？是不是一直分配缓存池空间？？答案很显然，是的，可是系统会处理那些消耗内存和资源的东西，具体何时、如何不得而知，有机会再深究。
 
 
 */

#import "UIFontCacheViewController.h"
#import "UIFontCacheNextViewController.h"
#import "PPMutAttributedStringMaker.h"

static NSString *key = @"pppp8888";

@interface UIFontCacheViewController ()
/** 用来持有font的LB */
@property(nonatomic,strong) UILabel *fontTestLB;
@end

@implementation UIFontCacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fontTestLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.font([UIFont fontWithName:@"PingFangSC-Semibold" size:14]);
        make.text(@"lb UIFont是有缓存的");
        make.textColor([UIColor ppmake_deepRed]);
        make.textAlignment(NSTextAlignmentCenter);
        make.frame(CGRectMake(0, kHeight(400), kScreenW, kHeight(50)));
        make.bgColor(kColorHex(0x27f2f2));
        
    }];
    
    //应用执行后打印结果（未切到后台）
    [self logFontWithHasFromBackground:NO];
    
    //创建一个触发从后台进入前台打印fontTestLB.font和UIFont *creatingFont = kFontSemibold(14);的button
    [self createBT];

    //显示一些信息
    [self.view addSubview:[self introLB]];
    
}


-(void)logFontWithHasFromBackground:(BOOL)hasBackground
{
    //进入测试界面用同样的创建方式再次创建一个UIFont对象
    UIFont *creatingFont = kFontSemibold(14);
    UIImage *img = [UIImage imageNamed:@"1024"];
    NSLog(@"\n是否有进入后台过：%d\nUIFont新建的font     \n%@ \nfontTestLB设置的font \n%@---%@",hasBackground,creatingFont,self.fontTestLB.font,img);
    
    //UIImage没有缓存池机制
    
}
-(void)createBT
{
    [PPMAKEBT pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.frame(CGRectMake(kWidth(60), self.fontTestLB.bottom+kHeight(20), kScreenW-kWidth(120), kHeight(50)));
        make.normalAttributedFontColorTitle(kFontSemibold(16), [UIColor ppmake_chocolate], @"bt 请进去后台再切回来再点击打印");
        make.actionBlock(^{
            [self logFontWithHasFromBackground:YES];
        });
        make.cornerShadow(8, 8, 0.12);
    }];
}

-(UILabel *)introLB
{
    return [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.frame(CGRectMake(kWidth(10), kNavBarH, kScreenW-kWidth(20), kHeight(300)));
        NSMutableAttributedString *attributedStr = [NSMutableAttributedString pp_attributedStringMake:^(PPMutAttributedStringMaker *maker) {
            maker.font(kFontRegular(16));
            maker.textColor(kColorHex(0x222222));
            maker.lineSpacing(4);
            maker.kern(@2);
            maker.specialTextSet(
                                 @[@"秘密",@"UIFont是有缓存的",@"测试方法如下"],
                                 @[kFontMedium(18),kFontSemibold(22),kFontMedium(18)],
                                 @[[UIColor ppmake_violet],kColorHex(0xff4d4d),kColorBlack]
                                 );
        } str:@"有一天，我发现了一个秘密:\nUIFont是有缓存的，类似我们常说的缓存池。\n测试方法如下：停留在该界面，摁手机home键，然后再切回来，看控制台打印"];
        make.attributedText(attributedStr);
        make.numberOfLines(0);
    }];
}

-(void)colorTest
{
//    UIColor *creatingColor = [UIColor ppmake_deepRed];
//
//    NSLog(@"\n是否有进入后台过：%d\nUIColor新建的color     %@ \n fontTestLB设置的color %@",hasBackground,creatingColor,self.fontTestLB.textColor);
//    NSLog(@"颜色是否相等-%d",[creatingColor ppmake_isEqualToColor:self.fontTestLB.textColor]);
//
//    NSLog(@"%f",CGColorGetAlpha(kColorRGBA(220, 220, 220, 0.6).CGColor));
}

@end
