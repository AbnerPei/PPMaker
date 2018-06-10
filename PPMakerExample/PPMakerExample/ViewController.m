//
//  ViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/8.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "ViewController.h"

#import "PPMaker.h"


@interface ViewController ()
{
    PPMake *make22;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self ppmake];

//    UIButton *lb = [PPMAKE(PPMakeTypeBT) pp_make:^(PPMake *make) {
//        make.intoView(self.view).bgColor([UIColor redColor]);
//        make.frame(CGRectMake(40, 100, 100, 50));
//    }];
    
//    UIButton *lb = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.view addSubview:lb];
//    lb.frame = CGRectMake(40, 100, 100, 50);
//    lb.backgroundColor = [UIColor yellowColor];
//    [lb maker_actionBlock:^{
//        NSLog(@"点击lb bt");
//    }];
    
//    [lb ppmake_actionWithBlock:^{
//        NSLog(@"maker点击lb bt");
//    }];
//    NSLog(@"%@",lb);
    
//    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, 100, 40)];
//    [self.view addSubview:lb];
//    lb.text = @"99999";
//    lb.backgroundColor = [UIColor cyanColor];
    
    
////    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [lb pp_make:^(PPMake *make) {
//            make.bgColor([UIColor purpleColor]);
////            make.title(@"8888", UIControlStateNormal);
////            make.titleColor([UIColor whiteColor], UIControlStateNormal);
////            make.addTargetTouchUpInside(self, @selector(btnClick));
//            make.actionBlock(^{
//                NSLog(@"btn点击了");
//            });
////            make.delegate(self);
////            make.imageName(@"1024");
////            make.textAlignment(NSTextAlignmentCenter);
//            [UIView animateWithDuration:3 animations:^{
//                make.frame(CGRectMake(20, 210, 100, 40));
//            }];
//        }];
////    });


    
    
}
-(void)ppmake
{
//    __weak typeof(make22) weakM22 = make22;
    UIButton *bt = [PPMAKE(PPMakeTypeBT) pp_make:^(PPMake *make) {
//        __strong typeof(weakM22) strongM22 = weakM22;
//        strongM22 = make;
        make.intoView(self.view).bgColor([UIColor cyanColor]);
        make.frame(CGRectMake(40, 100, 200, 50));
        make.actionBlock(^{
            NSLog(@"btn点击了");
        });

//        make.normalTitle(@"normal状态");
        make.normalAttributedFontColorTitle([UIFont systemFontOfSize:35], [UIColor purpleColor],@"normal状态");
        make.normalAttributedString([NSMutableAttributedString pp_attributedStringMake:^(PPMutAttributedStringMaker *maker) {
            maker.font([UIFont systemFontOfSize:18]);
            maker.textColor([UIColor purpleColor]);
        } str:@"attributedStr"]);
//
//        make.cornerShadow(8, 8, 0.5);
        
        make.cornerRadius(6);
        make.borderColor([UIColor redColor]);
        make.borderWidth(4);
        make.clickTimeInterval(60);
        
//        make.text(@"88888");
        
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [bt ppmake_reset];
    });
    
    

    
    
    UILabel *lb = [PPMAKE(PPMakeTypeLB) pp_make:^(PPMake *make) {
        make.intoView(self.view).frame(CGRectMake(40, 160, 200, 50));
        make.text(@"lb点击一下").textColor([UIColor redColor]);
        make.bgColor([UIColor cyanColor]);
        make.tapBlock(^{
            NSLog(@"lb被点击了");
        });
        make.longPressBlock(^{
            NSLog(@"lb被长恩了");
        });
//        make.titleState(@"8888", UIControlStateNormal);
    }];

    
    
    
}
-(void)btnClick
{
    NSLog(@"btn点击了");
}

-(void)ppmaker
{
//   UILabel *lb = [UILabel pp_lbMake:^(PPLabelMaker *maker) {
//        maker.bgColor([UIColor redColor]).textAlignment(NSTextAlignmentCenter).intoView(self.view).numberOfLines(0);
//        maker.textColor([UIColor purpleColor]).boldFontSize(25).frame(CGRectMake(10, 80, 300, 110));
////        maker.text(@"笑傲江湖");
//        maker.attributedText([NSMutableAttributedString pp_attributedStringMake:^(PPMutAttributedStringMaker *maker) {
//            maker.textColor([UIColor yellowColor]).font([UIFont boldSystemFontOfSize:16]).fontRange([UIFont systemFontOfSize:28], [@"笑傲江湖" rangeOfString:@"江湖"]);
//            maker.kern(@4).lineSpacing(10);
////            maker.specialTextSet(@[@"笑",@"江湖"], @[[UIFont systemFontOfSize:16],[UIFont boldSystemFontOfSize:30]], @[[UIColor cyanColor],[UIColor orangeColor]]);
//            maker.specialText(@"江湖", [UIFont systemFontOfSize:16], [UIColor blueColor]);
//        } str:@"笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖"]);
//
//    }];
//
//
    //button的创建
   UIButton *btn = [UIButton pp_btMake:^(PPButtonMaker *maker) {
        NSLog(@"button的创建");
        maker.intoView(self.view).bgColor([UIColor orangeColor]).frame(CGRectMake(10, 200, 260, 40));
        maker.normalTitle(@"点击一下试试").normalTitleColor([UIColor purpleColor]);
        maker.highlightedTitle(@"高亮了").highlightedTitleColor([UIColor cyanColor]);
        maker.actionBlock(^{
            NSLog(@"单击了button");
        });
        maker.intoView(self.view);
    }];
    
    CGFloat f = [@"0.6666" floatValue];
    NSLog(@"%.2f",f);
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc]initWithString:@"9999999" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor purpleColor],NSKernAttributeName:@3}];
    [btn setAttributedTitle:mut forState:UIControlStateNormal];
    NSAttributedString *st = btn.currentAttributedTitle;
    NSLog(@"currentAttributedTitle %@",st);
    

    [mut enumerateAttribute:NSFontAttributeName inRange:NSMakeRange(0, mut.length) options:(NSAttributedStringEnumerationLongestEffectiveRangeNotRequired) usingBlock:^(UIFont *value, NSRange range, BOOL * _Nonnull stop) {
        NSLog(@"value %@ range %@ stop %d",value,NSStringFromRange(range),stop);
    }];
    
    [mut enumerateAttributesInRange:NSMakeRange(0, mut.length) options:(NSAttributedStringEnumerationLongestEffectiveRangeNotRequired) usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        id iiiiid = [attrs valueForKey:NSFontAttributeName];

        NSLog(@"attrs %@ range %@ stop %d",attrs,NSStringFromRange(range),stop);
    }];
    
//    NSRange allRange = NSMakeRange(0, mut.length);
//   id fontID = [mut attribute:NSFontAttributeName atIndex:0 effectiveRange:&allRange];
//    NSLog(@"%@",fontID);
//
//    UIFont *font1 = [UIFont alloc]
    
//
//
//    //imageView的创建
//    [UIImageView pp_imgVMake:^(PPImageViewMaker *maker) {
//        maker.intoView(self.view).frame(CGRectMake(10, 260, 80, 80));
//        maker.imageName(@"1024");
//    }];
//
//
//    //UIView的创建
//   UIView *v = [UIView pp_viewMake:^(PPViewMaker *maker) {
//        maker.intoView(self.view).frame(CGRectMake(20, 360, 40, 40));
//        maker.bgColor([UIColor yellowColor]);
//    }];
//
//
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
