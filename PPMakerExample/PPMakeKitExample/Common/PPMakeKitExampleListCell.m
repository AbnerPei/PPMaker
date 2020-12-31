//
//  PPMakeKitExampleListCell.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/6.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeKitExampleListCell.h"
#import "PPMakerDefines.h"
#import <PPMaker/PPMaker.h>

@interface PPMakeKitExampleListCell ()
@property(nonatomic,strong) UILabel *titleLB;
@end

@implementation PPMakeKitExampleListCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self creatCellUI];
    }
    return self;
}
-(void)creatCellUI
{
    CGFloat contentVX = kHeight(8);
    CGFloat totalW = kScreenW-contentVX*2;

    CGFloat contentVH = kHeight(50);
    
    CGFloat moreW = 20;
    CGFloat moreY = (contentVH-moreW)/2;
    
    CGFloat titleX = kWidth(16);
    CGFloat titleY = kHeight(10);
    CGFloat titleH = contentVH-titleY*2;
    CGFloat titleW = totalW-titleX*2-moreW-kWidth(5); //文字和more间距5

    
    UIView *contentV = [PPMAKEV pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(contentVX, 0, totalW, contentVH));
        make.bgColor(colorWhite());
        make.cornerShadow(8, 8, 0.12);
    }];
    
    self.titleLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(contentV);
        make.frame(CGRectMake(titleX, titleY, titleW, titleH));
        make.font(fontPingFangSCSemibold(16));
        make.textColor(colorBlack());
    }];
    
    [PPMAKEImgV pp_make:^(PPMake *make) {
        make.intoView(contentV);
        make.imageName(@"ppmaker_more");
        make.frame(CGRectMake(self.titleLB.right+kWidth(5), moreY, moreW, moreW));
    }];
}

-(void)setupCellWithTitle:(NSString *)title
{
    self.titleLB.text = title;
}


@end
