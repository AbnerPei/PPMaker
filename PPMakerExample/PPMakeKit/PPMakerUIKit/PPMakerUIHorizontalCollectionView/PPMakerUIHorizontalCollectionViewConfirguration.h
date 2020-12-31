//
//  PPMakerUIHorizontalCollectionViewConfirguration.h
//  PPMakerExample
//
//  Created by PPAbner on 2020/12/30.
//  Copyright © 2020 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPMakerUIHorizontalCollectionViewConfirguration : NSObject

@property (nonatomic, strong, readonly) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) CGFloat itemMargin;
@property (nonatomic) CGSize headerReferenceSize;
@property (nonatomic) CGSize footerReferenceSize;
@property (nonatomic) Class cellClass;
@property (nonatomic, copy) NSString *cellIdentifier;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithItemSize:(CGSize)itemSize itemMargin:(CGFloat)itemMargin headerReferenceSize:(CGSize)headerReferenceSize footerReferenceSize:(CGSize)footerReferenceSize cellClass:(Class)cellClass NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong, readonly) NSMutableArray *dataArray;

@end

NS_ASSUME_NONNULL_END
