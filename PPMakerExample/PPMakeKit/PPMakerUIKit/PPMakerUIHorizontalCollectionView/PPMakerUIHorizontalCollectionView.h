//
//  PPMakerUIHorizontalCollectionView.h
//  PPMakerExample
//
//  Created by PPAbner on 2020/12/30.
//  Copyright © 2020 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPMakerUIHorizontalCollectionViewConfirguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPMakerUIHorizontalCollectionView : UICollectionView


+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame configuration:(PPMakerUIHorizontalCollectionViewConfirguration *)configuration NS_DESIGNATED_INITIALIZER;


@property (nonatomic, strong, readonly) PPMakerUIHorizontalCollectionViewConfirguration *configuration;

@end

NS_ASSUME_NONNULL_END
