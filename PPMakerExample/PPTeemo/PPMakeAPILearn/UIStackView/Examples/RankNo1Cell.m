//
//  RankNo1Cell.m
//  PPMakerExample
//
//  Created by jianbo.pei on 2022/10/28.
//  Copyright © 2022 PPAbner. All rights reserved.
//

#import "RankNo1Cell.h"
#import <Masonry/Masonry.h>
#import "LMCellModel.h"

@interface RankNo1Cell ()

@property (nonatomic, strong) UIStackView *vStackViw;
@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation RankNo1Cell

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
    
    _vStackViw = [[UIStackView alloc] init];
    [bgV addSubview:_vStackViw];
    _vStackViw.axis = UILayoutConstraintAxisVertical;
    [_vStackViw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
    }];
    
    UIView *topV = [[UIView alloc] init];
    [_vStackViw addArrangedSubview:topV];
    topV.backgroundColor = UIColor.purpleColor;
    [topV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
    }];
    
    UIView *middleV = [[UIView alloc] init];
    [_vStackViw addArrangedSubview:middleV];
    middleV.backgroundColor = UIColor.cyanColor;
    [middleV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(60);
    }];
    
    [_vStackViw setCustomSpacing:10 afterView:middleV];
    
    _descLabel = [[UILabel alloc] init];
    [_vStackViw addArrangedSubview:_descLabel];
    _descLabel.numberOfLines = 0;
}

- (void)setupWithCellModel:(LMCellModel *)cellModel
{
    _descLabel.text = cellModel.desc;
}

@end
