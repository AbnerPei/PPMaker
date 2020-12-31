//
//  PPMakeKGSubcategoryListCell.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/27.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeKGSubcategoryListCell.h"
#import "KGSubcategoryListModel.h"
#import "UIImageView+WebCache.h"
#import "KGHandler.h"
#import "PPMakerDefines.h"
#import <PPMaker/PPMaker.h>

@interface PPMakeKGSubcategoryListCell ()
@property(nonatomic,strong) UIImageView *specialImgV;
@property(nonatomic,strong) UIImageView *playImgV;
@property(nonatomic,strong) UILabel *specialNameLB;
@property(nonatomic,strong) UIImageView *earPhoneImgV;
@property(nonatomic,strong) UILabel *playCountLB;
@end

@implementation PPMakeKGSubcategoryListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.contentView.backgroundColor = kColorWhite;
//        self.selectionStyle = UITableViewCellSelectionStyleNone;  
        [self creatCellUI];
    }
    return self;
}
-(void)creatCellUI
{
    CGFloat totalH = kHeight(70);
    CGFloat topMargin = 1;
    
    //专题图片
    CGFloat specialImgW = totalH-topMargin*2;
    self.specialImgV = [PPMAKEImgV pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(0, topMargin, specialImgW, specialImgW));
        make.userInteractionEnabled(YES);
    }];
    
    //播放图标
    CGFloat playW = 26;
    CGFloat rightMargin = 3;
    CGFloat playX = specialImgW-rightMargin-playW;
    self.playImgV = [PPMAKEImgV pp_make:^(PPMake *make) {
        make.intoView(self.specialImgV);
        make.frame(CGRectMake(playX, playX, playW, playW));
        make.imageName(@"kg_icon_musicPlay");
        make.hidden(YES);
    }];
    
    //专题名字
    CGFloat imgLbMargin = kWidth(10);
    CGFloat lbX = specialImgW+imgLbMargin;
    CGFloat lbW = kScreenW-lbX-rightMargin;
    CGFloat lbY = kHeight(10);
    CGFloat lbH = kHeight(20);
    self.specialNameLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(lbX, lbY, lbW, lbH));
        make.textColor(colorBlack());
        make.font(fontPingFangSCMedium(14));
    }];
    
    //耳机🎧
    CGFloat earphoneW = 12;
    CGFloat earphoneY = self.specialNameLB.bottom+kHeight(3)+(lbH-earphoneW)/2;
    self.earPhoneImgV = [PPMAKEImgV pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(lbX, earphoneY, earphoneW, earphoneW));
        make.imageName(@"kg_icon_earphone");
        make.hidden(YES);
    }];
    
    //播放次数
    CGFloat playCountX = self.earPhoneImgV.right+4;
    CGFloat playCountY = self.specialNameLB.bottom+kHeight(3);
    CGFloat playCountW = lbW-playCountX;
    self.playCountLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(playCountX, playCountY, playCountW, lbH));
        make.font(fontPingFangSCRegular(12));
        make.textColor(color999999());
    }];
    
    [PPMAKEV pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(lbX, totalH-1, lbW, 1));
        make.bgColor(colorHex(@"0xf2f2f2"));
    }];
    
}
-(void)setupCellWithSubcategoryListModel:(KGSubcategoryListModel *)subcategoryListModel
{
    if (!subcategoryListModel) {
        return;
    }
    if ([subcategoryListModel.imgurl containsString:@"{size}"]) {
        subcategoryListModel.imgurl = [subcategoryListModel.imgurl stringByReplacingOccurrencesOfString:@"{size}" withString:@"120"];
    }
    
    [self.specialImgV sd_setImageWithURL:[NSURL URLWithString:subcategoryListModel.imgurl] placeholderImage:[UIImage imageNamed:@"kg_icon_placeholder"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.playImgV.hidden = !image;
    }];
    
    self.specialNameLB.text = subcategoryListModel.specialname;
    
    self.earPhoneImgV.hidden = subcategoryListModel.playcount <= 0;
    
    self.playCountLB.text = [KGHandler kg_playCount:subcategoryListModel.playcount];
}
@end
