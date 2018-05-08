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
}

-(void)ppmaker
{
    [PPLabelMaker pp_lbMake:^(PPLabelMaker *maker) {
        maker.bgColor([UIColor redColor]).textAlignment(NSTextAlignmentCenter).intoView(self.view);
        maker.textColor([UIColor purpleColor]).boldFontSize(25).frame(CGRectMake(10, 100, 300, 50));
        maker.text(@"笑傲江湖");
    }];
    
    [PPButtonMaker pp_btMake:^(PPButtonMaker *maker) {
        maker.intoView(self.view).bgColor([UIColor orangeColor]).frame(CGRectMake(10, 200, 260, 40));
        maker.normalTitle(@"点击一下哦").normalTitleColor([UIColor purpleColor]);
        maker.highlightedTitle(@"高亮了").highlightedTitleColor([UIColor cyanColor]);
        maker.actionBlock(^{
            NSLog(@"单击了button");
        });
        maker.intoView(self.view);
        
    }];
    
    [PPImageViewMaker pp_imageViewMake:^(PPImageViewMaker *maker) {
        maker.intoView(self.view).frame(CGRectMake(10, 260, 80, 80)).imageName(@"1024");
    }];
    
    [PPViewMaker pp_viewMake:^(PPViewMaker *maker) {
        maker.intoView(self.view).bgColor([UIColor blueColor]).frame(CGRectMake(20, 360, 40, 40));
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
