//
//  PPMakerUIHorizontalCollectionView.m
//  PPMakerExample
//
//  Created by PPAbner on 2020/12/30.
//  Copyright © 2020 PPAbner. All rights reserved.
//

#import "PPMakerUIHorizontalCollectionView.h"

@interface PPMakerUIHorizontalCollectionView ()
@property (nonatomic, strong) PPMakerUIHorizontalCollectionViewConfirguration *internalConfiguration;
@end

@implementation PPMakerUIHorizontalCollectionView

- (instancetype)initWithFrame:(CGRect)frame configuration:(PPMakerUIHorizontalCollectionViewConfirguration *)configuration
{
    self = [super initWithFrame:frame collectionViewLayout:configuration.flowLayout];
    if (self) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        NSString *cellIdentifier = nil;
        if (configuration.cellIdentifier.length > 0) {
            cellIdentifier = configuration.cellIdentifier;
        }else{
            cellIdentifier = NSStringFromClass([configuration.cellClass class]);
        }
        configuration.cellIdentifier = cellIdentifier;
        [self registerClass:[configuration.cellClass class] forCellWithReuseIdentifier:cellIdentifier];
        _internalConfiguration = configuration;
    }
    return self;
}


- (PPMakerUIHorizontalCollectionViewConfirguration *)configuration
{
    return _internalConfiguration;
}

@end
