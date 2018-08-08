//
//  PPMakeGridViewViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeGridViewViewController.h"
#import "PPTool.h"

@interface PPMakeGridViewViewController ()

@end

@implementation PPMakeGridViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *titles = @[
                        @"北京",
                        @"上海",
                        @"重庆",
                        @"天津",
                        @"郑州",
                        @"西安",
                        @"合肥",
                        @"广州",
                        @"哈尔滨",
                        @"南京",
                        @"武汉",
                        @"长沙",
                        @"云南",
                        @"河南",
                        @"湖南"
                        ];
    
    [PPTool ppmake_gridViewWithViewWidth:kScreenW
                          viewLeftMargin:kWidth(16)
                           viewTopMargin:kHeight(100)
                      itemVerticalMargin:kHeight(10)
                    itemHorizontalMargin:kWidth(8)
                              itemHeight:kHeight(40)
                               itemCount:titles.count
                            rowItemCount:3
                       itemPropertyBlock:^(CGFloat itemX, CGFloat itemY, CGFloat itemW, NSInteger currentIndex) {
    
        [PPMAKE(PPMakeTypeLB) pp_make:^(PPMake *make) {
            make.intoView(self.view);
            make.frame(CGRectMake(itemX, itemY, itemW, kHeight(40)));
            make.text(titles[currentIndex]);
            make.textColor(kColorHex(0xff4d4d));
            make.textAlignment(NSTextAlignmentCenter);
            make.bgColor(kColorHexA(0xff4d4d, 0.1));
            if (currentIndex == 4) {
                make.borderColor(kColorHex(0xff4d4d));
                make.borderWidth(1);
                make.cornerRadius(4);
            }
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
