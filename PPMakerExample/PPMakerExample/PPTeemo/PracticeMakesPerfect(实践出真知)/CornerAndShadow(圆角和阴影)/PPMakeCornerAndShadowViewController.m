//
//  PPMakeCornerAndShadowViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/10.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeCornerAndShadowViewController.h"
#import "PPMakerDefines.h"

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
    self.view.backgroundColor = colorWhite();
    
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

    _imgView = [PPMAKEImgV pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.imageName(@"lol003");
        make.frame(CGRectMake(37.5, 150, 300, 160));
    }];

//    [_imgView ppmake_cornerRadius:20 shadowRadius:18 shadowOpacity:0.9];

//    [_imgView ppmake_cornerShadowByRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(18, 18) shadowRadius:20 shadowOpacity:0.9];

    [_imgView ppmake_cornerShadowByRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(18, 18) shadowRadius:8 shadowColor:[UIColor blueColor] shadowOffset:CGSizeMake(0, -5) shadowOpacity:0.9];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGFloat paintingWidth = 300;
    CGFloat paintingHeight = 160;
    [UIView animateWithDuration:2 animations:^{
        _imgView.frame = CGRectMake(37.5, 100, paintingWidth+10, paintingHeight+100);
    }];

}



@end
