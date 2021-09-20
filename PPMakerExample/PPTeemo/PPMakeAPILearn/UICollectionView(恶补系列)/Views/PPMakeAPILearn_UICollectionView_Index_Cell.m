//
//  PPMakeAPILearn_UICollectionView_Index_Cell.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/9/20.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMakeAPILearn_UICollectionView_Index_Cell.h"

@interface PPMakeAPILearn_UICollectionView_Index_Cell ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation PPMakeAPILearn_UICollectionView_Index_Cell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.textLabel];
    self.textLabel.frame = self.contentView.bounds;
}

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont boldSystemFontOfSize:25];
    }
    return _textLabel;
}
@end
