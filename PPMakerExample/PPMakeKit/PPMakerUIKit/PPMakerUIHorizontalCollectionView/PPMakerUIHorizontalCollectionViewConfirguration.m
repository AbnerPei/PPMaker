//
//  PPMakerUIHorizontalCollectionViewConfirguration.m
//  PPMakerExample
//
//  Created by PPAbner on 2020/12/30.
//  Copyright © 2020 PPAbner. All rights reserved.
//

#import "PPMakerUIHorizontalCollectionViewConfirguration.h"
@interface PPMakerUIHorizontalCollectionViewConfirguration ()
@property (nonatomic, strong) UICollectionViewFlowLayout *internalFlowLayout;
@property (nonatomic, strong) NSMutableArray *internalDataArray;
@end

@implementation PPMakerUIHorizontalCollectionViewConfirguration

- (instancetype)initWithItemSize:(CGSize)itemSize itemMargin:(CGFloat)itemMargin headerReferenceSize:(CGSize)headerReferenceSize footerReferenceSize:(CGSize)footerReferenceSize cellClass:(Class)cellClass
{
    self = [super init];
    if (self) {
        self.itemSize = itemSize;
        self.itemMargin = itemMargin;
        self.headerReferenceSize = headerReferenceSize;
        self.footerReferenceSize = footerReferenceSize;
        self.cellClass = cellClass;
        
        self.internalFlowLayout.itemSize = itemSize;
        self.internalFlowLayout.minimumLineSpacing = itemMargin;
        self.internalFlowLayout.headerReferenceSize = headerReferenceSize;
        self.internalFlowLayout.footerReferenceSize = footerReferenceSize;
    }
    return self;
}


#pragma mark --- getter
- (UICollectionViewFlowLayout *)flowLayout
{
    return self.internalFlowLayout;
}

- (NSMutableArray *)dataArray
{
    return self.internalDataArray;
}


#pragma mark --- lazy load
- (UICollectionViewFlowLayout *)internalFlowLayout
{
    if (!_internalFlowLayout) {
        _internalFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        _internalFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _internalFlowLayout;
}
- (NSMutableArray *)internalDataArray
{
    if (!_internalDataArray) {
        _internalDataArray = [NSMutableArray array];
    }
    return _internalDataArray;
}
@end
