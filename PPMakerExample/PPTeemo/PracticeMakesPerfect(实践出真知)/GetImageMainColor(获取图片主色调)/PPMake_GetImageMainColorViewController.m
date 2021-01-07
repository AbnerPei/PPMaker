//
//  PPMake_GetImageMainColorViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/27.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake_GetImageMainColorViewController.h"
#import "PPMakerDefines.h"
#import <PPMaker/PPMaker.h>

@interface PPMake_GetImageMainColorViewController ()
@property(nonatomic,strong) UIImageView *lolImgV;
@end

@implementation PPMake_GetImageMainColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.lolImgV = [PPMAKEImgV pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.frame(CGRectMake(50, 100, 200, 200));
        make.imageName(@"lol001");
    }];
    
    UIView *v = [PPMAKEV pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.frame(CGRectMake(0, 360, kScreenW, 80));
        make.bgColor([self mostColor:self.lolImgV.image]);
    }];
    
    __block int i = 1;
    [PPMAKEBT pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.frame(CGRectMake(50, 310, kScreenW-100, 40));
        make.normalAttributedFontColorTitle(PPMakeUIFontPingFangSCSemibold(14), [UIColor redColor], @"点击一下");
        make.actionBlock(^{
            i++;
            [self.lolImgV pp_make:^(PPMake *make) {
                make.imageName([NSString stringWithFormat:@"lol%003d",i]);
            }];
            
            [v pp_make:^(PPMake *make) {
                make.bgColor([self mostColor:self.lolImgV.image]);
            }];
        });
    }];
    
    
}
//【VIP】 [图片颜色提取算法Google Palette分析及OC化](https://www.jianshu.com/p/a67a6d1b1844)
//https://link.jianshu.com/?t=https://github.com/tangdiforx/iOSPalette

//https://blog.csdn.net/small_tgs/article/details/51151197
//根据图片获取图片的主色调
-(UIColor*)mostColor:(UIImage*)image{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(image.size.width/2, image.size.height/2);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    if (data == NULL) return nil;
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            int offset = 4*(x*y);
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            if (alpha>0) {//去除透明
                if (red==255&&green==255&&blue==255) {//去除白色
                }else{
                    NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
                    [cls addObject:clr];
                }
                
            }
        }
    }
    CGContextRelease(context);
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        if ( tmpCount < MaxCount ) continue;
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}
@end
