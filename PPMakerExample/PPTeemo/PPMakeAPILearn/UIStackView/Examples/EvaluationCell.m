//
//  EvaluationCell.m
//  PPMakerExample
//
//  Created by jianbo.pei on 2022/10/28.
//  Copyright © 2022 PPAbner. All rights reserved.
//

#import "EvaluationCell.h"
#import <Masonry/Masonry.h>
#import "LMCellModel.h"

@interface EvaluationImageView : UIView

@end

@implementation EvaluationImageView


@end

@interface EvaluationCell ()

@property (nonatomic, strong) UIStackView *vStackViw;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) EvaluationImageView *imagesView;

@end

@implementation EvaluationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = UIColor.grayColor;
        
        [self createCellUI];
    }
    return self;
}

- (void)createCellUI
{
    UIView *bgV = [[UIView alloc] init];
    [self.contentView addSubview:bgV];
    bgV.backgroundColor = UIColor.whiteColor;
    bgV.layer.masksToBounds = YES;
    bgV.layer.cornerRadius = 10;
    [bgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    
    UIView *topV = [[UIView alloc] init];
    [bgV addSubview:topV];
    topV.backgroundColor = UIColor.blueColor;
    [topV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.left.top.right.mas_equalTo(bgV);
    }];
    
    UIView *middleV = [[UIView alloc] init];
    [bgV addSubview:middleV];
    middleV.backgroundColor = UIColor.redColor;
    [middleV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(60);
        make.left.right.mas_equalTo(topV);
        make.top.mas_equalTo(topV.mas_bottom);
    }];
    
    _vStackViw = [[UIStackView alloc] init];
    [bgV addSubview:_vStackViw];
    _vStackViw.axis = UILayoutConstraintAxisVertical;
    _vStackViw.distribution = UIStackViewDistributionEqualSpacing;
    _vStackViw.spacing = 10;
    [_vStackViw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(120);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    _descLabel = [[UILabel alloc] init];
    [_vStackViw addArrangedSubview:_descLabel];
    _descLabel.numberOfLines = 0;
    _descLabel.hidden = YES;
    
    _imagesView = [[EvaluationImageView alloc] init];
    [_vStackViw addArrangedSubview:_imagesView];
    _imagesView.hidden = YES;
    _imagesView.backgroundColor = UIColor.yellowColor;
    [_imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
    }];
    
    UIView *bottomMoreBgView = [[UIView alloc] init];
    [_vStackViw addArrangedSubview:bottomMoreBgView];
    bottomMoreBgView.backgroundColor = UIColor.greenColor;
    [bottomMoreBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(55);
    }];
    
    UIButton *moreBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bottomMoreBgView addSubview:moreBt];
    moreBt.backgroundColor = UIColor.orangeColor;
    [moreBt setTitle:@"查看更多评价" forState:UIControlStateNormal];
    [moreBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 30));
        make.centerX.mas_equalTo(bottomMoreBgView.mas_centerX);
        make.top.mas_equalTo(0);
    }];
}

- (void)setupWithCellModel:(LMCellModel *)cellModel
{
    if (cellModel.desc.length == 0 || cellModel.desc == nil) {
        _descLabel.hidden = YES;
    } else {
        _descLabel.hidden = NO;
        _descLabel.text = cellModel.desc;
    }
    
    if ([cellModel.imageCount intValue] == 0) {
        _imagesView.hidden = YES;
    } else {
        _imagesView.hidden = NO;
    }
}

@end



