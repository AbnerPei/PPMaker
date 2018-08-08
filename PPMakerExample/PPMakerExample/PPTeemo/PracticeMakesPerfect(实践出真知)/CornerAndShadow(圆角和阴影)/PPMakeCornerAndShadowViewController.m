//
//  PPMakeCornerAndShadowViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/10.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeCornerAndShadowViewController.h"

@interface PPMakeCornerAndShadowViewController ()
{
    UIImageView *_imgView;
    UIView *_v;
}
@end

@implementation PPMakeCornerAndShadowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kColorWhite;
    
    [self demo1];
    
    int value = 10;
    
    NSLog(@"001-未赋值（最原始）的blcok %@",^{
        
    });
    
    NSLog(@"002-未赋值（调用了外部变量value）的blcok %@",^{
        NSLog(@"value: %d",value);
    });
    
    void(^blockA)(void) = ^{
       
    };
    
    void(^blockB)(void) = ^{
        NSLog(@"value: %d",value);
    };
    
    void(^blockC)(void) = ^{
        
    };
    NSLog(@"003 ARC blockA 引用计数: %ld, blockA is: %@",CFGetRetainCount(((__bridge CFTypeRef)blockA)), blockA);
    NSLog(@"004 ARC blockB 引用计数: %ld, blockB is: %@",CFGetRetainCount(((__bridge CFTypeRef)blockB)), blockB);
    NSLog(@"005 ARC blockC 引用计数: %ld, blockC is: %@",CFGetRetainCount(((__bridge CFTypeRef)blockC)), blockC);
    
    //001-未赋值（最原始）的blcok <__NSGlobalBlock__: 0x1009b1a78>
    //002-未赋值（调用了外部变量value）的blcok <__NSStackBlock__: 0x16f4afe38>
    //003 ARC blockA 引用计数: 1, blockA is: <__NSGlobalBlock__: 0x1009b1ad8>
    //004 ARC blockB 引用计数: 1, blockB is: <__NSMallocBlock__: 0x1c025c110>
    //005 ARC blockC 引用计数: 1, blockC is: <__NSGlobalBlock__: 0x1009b1b38>


    

}

-(void)demo1
{
//    UIView *tempView = [PPMAKEV pp_make:^(PPMake *make) {
//        make.intoView(self.view);
//        make.frame(CGRectMake(40, 300, 200, 200));
//        make.bgColor([UIColor ppmake_random]);
//    }];
    
    CGFloat paintingWidth = 300;
    CGFloat paintingHeight = 160;
    UIImageView *imgView = [PPMAKEImgV pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.imageName(@"lol003");
    }];
    _imgView = imgView;
    imgView.frame = CGRectMake(37.5, 100, paintingWidth, paintingHeight);

    [_imgView ppmake_cornerRadius:10 shadowRadius:12 shadowOpacity:0.7];

    
    
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(20, 300, 300, 300)];
    [self.view addSubview:v];
    v.backgroundColor = [UIColor cyanColor];
    v.layer.shadowColor = [UIColor blackColor].CGColor;
    v.layer.shadowOffset = CGSizeZero;
    v.layer.shadowOpacity = 0.8;
    v.layer.shadowRadius = 8;
    v.layer.cornerRadius = 8;
    v.clipsToBounds = NO;
    v.layer.masksToBounds = YES;
    
    UIImageView *imgView2 = [PPMAKEImgV pp_make:^(PPMake *make) {
        make.intoView(v);
        make.imageName(@"lol001");
        make.frame(CGRectMake(0, 00, 300, 255));
    }];


}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGFloat paintingWidth = 300;
    CGFloat paintingHeight = 160;
    [UIView animateWithDuration:2 animations:^{
//        [_imgView ppmake_cornerRadius:30 shadowRadius:12 shadowOpacity:0.9];
        _imgView.frame = CGRectMake(37.5, 100, paintingWidth+10, paintingHeight+100);
    }];

}



@end
