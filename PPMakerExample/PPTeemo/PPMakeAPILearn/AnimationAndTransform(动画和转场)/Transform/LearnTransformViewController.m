//
//  LearnTransformViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/9.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "LearnTransformViewController.h"
#import "PPMakeBannerView.h"
#import <PPMaker/PPMaker.h>

@interface LearnTransformViewController ()

@end

@implementation LearnTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.    
    
    [self demo2];
}

-(void)demo3
{
    /*
http://app.image.jinri.cn/banner/2817d3be-6b52-48a3-9280-f5b3f84f39ba.png,
http://app.image.jinri.cn/banner/70c30df2-9de8-418a-a7cd-98bdf4de838e.png,
http://app.image.jinri.cn/banner/78d595b0-39f5-41fe-861c-a939386902f5.jpg
     */
    NSArray *urls = @[
                      @"http://app.image.jinri.cn/banner/2817d3be-6b52-48a3-9280-f5b3f84f39ba.png",
                      @"http://app.image.jinri.cn/banner/70c30df2-9de8-418a-a7cd-98bdf4de838e.png",
                      @"http://app.image.jinri.cn/banner/78d595b0-39f5-41fe-861c-a939386902f5.jpg"
                      ];
    PPMakeBannerView *bannerV = [PPMakeBannerView cycleRollViewWithFrame:CGRectMake(0, 100, kScreenW, 166)];
    [bannerV setImgUrls:urls autoCycleRoll:YES clickImgBlock:^(NSInteger selectedIndex) {
        NSLog(@"点击 %ld",(long)selectedIndex);
    }];
    bannerV.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:bannerV];
    
}

#pragma mark --- 缩放
-(void)demo1
{
    UIImageView *lolImgV = [PPMAKEImgV pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.frame(CGRectMake((kScreenW-225)/2, 80, 225, 124));
        make.imageName(@"lol001.jpg");
    }];
    
    [UIView animateWithDuration:1.5 animations:^{
        lolImgV.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
}

-(void)demo2
{
    UIImageView *v1 = [PPMAKEImgV pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.imageName(@"ppamer_banner_competition");
        make.frame(CGRectMake(0, 100, kScreenW, 150));
    }];
    [self setAnchorPoint:CGPointMake(1, 1) forView:v1];
    v1.transform = CGAffineTransformMake(0.0000000001, 0, 0, 1, 0, 0);

    
    UIImageView *v2 = [PPMAKEImgV pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.imageName(@"ppamer_banner_james");
        make.frame(CGRectMake(0, 100, kScreenW, 150));
    }];
    [self setAnchorPoint:CGPointMake(0, 0) forView:v2];
    [UIView animateWithDuration:0.5 delay:2 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
        v2.transform = CGAffineTransformMake(0.0000000001, 0, 0, 1, 0, 0);
        v1.transform = CGAffineTransformIdentity;
    } completion:nil];
    
}
- (void) setAnchorPoint:(CGPoint)anchorpoint forView:(UIView *)view{
    CGRect oldFrame = view.frame;
    view.layer.anchorPoint = anchorpoint;
    view.frame = oldFrame;
}
@end
