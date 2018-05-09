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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self ppmaker];
   
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 300, 50)];
    [self.view addSubview:lb];
    lb.backgroundColor = [UIColor whiteColor];
    lb.text = @"我是一个lb";
    lb.textColor = [UIColor blueColor];
    lb.textAlignment = NSTextAlignmentCenter;
    lb.font = [UIFont systemFontOfSize:18];
    
    
    UIImageView *imgV = [UIImageView pp_]

    
}

-(void)ppmaker
{
   UILabel *lb10 = [UILabel pp_lbMake:^(PPLabelMaker *maker) {
        maker.bgColor([UIColor redColor]).textAlignment(NSTextAlignmentCenter).intoView(self.view).numberOfLines(0);
        maker.textColor([UIColor purpleColor]).boldFontSize(25).frame(CGRectMake(10, 80, 300, 110));
//        maker.text(@"笑傲江湖");
        maker.attributedText([NSMutableAttributedString pp_attributedStringMake:^(PPMutAttributedStringMaker *maker) {
            maker.textColor([UIColor yellowColor]).font([UIFont boldSystemFontOfSize:16]).fontRange([UIFont systemFontOfSize:28], [@"笑傲江湖" rangeOfString:@"江湖"]);
            maker.kern(@4).lineSpacing(10);
//            maker.specialTextSet(@[@"笑",@"江湖"], @[[UIFont systemFontOfSize:16],[UIFont boldSystemFontOfSize:30]], @[[UIColor cyanColor],[UIColor orangeColor]]);
            maker.specialText(@"江湖", [UIFont systemFontOfSize:16], [UIColor blueColor]);
        } str:@"笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖笑傲江湖"]);
       
    }];
    
    //常规lb
    UILabel *lb = [UILabel pp_lbMake:^(PPLabelMaker *maker) {
        maker.intoView(self.view).frame(CGRectMake(10, 80, 300, 110));
        maker.textColor([UIColor purpleColor]).fontSize(18);
        maker.text(@"PPMaker");
    }];
    
    lb;
    
    //attributedText的lb
    UILabel *lb1 = [UILabel pp_lbMake:^(PPLabelMaker *maker) {
        maker.intoView(self.view);
        maker.attributedText([NSMutableAttributedString pp_attributedStringMake:^(PPMutAttributedStringMaker *maker) {
            maker.textColor([UIColor blueColor]);
            maker.specialText(@"lb", [UIFont systemFontOfSize:18], [UIColor yellowColor]);
        } str:@"含有attributedText的lb"]);
    }];
    
    lb1;
    
    //特别字统一处理的lb
    UILabel *lb2 = [UILabel pp_lbMake:^(PPLabelMaker *maker) {
        maker.intoView(self.view);
        maker.attributedText([NSMutableAttributedString pp_attributedStringMake:^(PPMutAttributedStringMaker *maker) {
            maker.textColor([UIColor blueColor]);
            maker.specialTextSet(@[@"有",@"lb"],
                                 @[[UIFont systemFontOfSize:18],[UIFont boldSystemFontOfSize:20]],
                                 @[[UIColor redColor],[UIColor purpleColor]]);
        } str:@"含有attributedText的lb"]);
    }];
    
    lb2;


    //button的创建
    UIButton *bt = [UIButton pp_btMake:^(PPButtonMaker *maker) {
        maker.intoView(self.view).bgColor([UIColor orangeColor]).frame(CGRectMake(10, 200, 260, 40));
        maker.normalTitle(@"点击一下试试").normalTitleColor([UIColor purpleColor]);
        maker.highlightedTitle(@"高亮了").highlightedTitleColor([UIColor cyanColor]);
        maker.actionBlock(^{
            NSLog(@"单击了button");
        });
        maker.intoView(self.view);
    }];
    
    bt;
    
    
    //imageView的创建
    UIImageView *imgV = [UIImageView pp_imgVMake:^(PPImageViewMaker *maker) {
        maker.intoView(self.view).frame(CGRectMake(10, 260, 80, 80));
        maker.imageName(@"1024");
    }];
    
    
    //UIView的创建
    UIView *view = [UIView pp_viewMake:^(PPViewMaker *maker) {
        maker.intoView(self.view).frame(CGRectMake(20, 360, 40, 40));
        maker.bgColor([UIColor yellowColor]);
    }];
    
    view;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
