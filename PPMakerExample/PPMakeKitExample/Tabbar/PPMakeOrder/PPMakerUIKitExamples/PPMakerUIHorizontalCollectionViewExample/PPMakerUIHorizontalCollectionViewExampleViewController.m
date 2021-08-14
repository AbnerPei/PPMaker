//
//  PPMakerUIHorizontalCollectionViewExampleViewController.m
//  PPMakerExample
//
//  Created by PPAbner on 2020/12/30.
//  Copyright © 2020 PPAbner. All rights reserved.
//

#import "PPMakerUIHorizontalCollectionViewExampleViewController.h"
#import "PPMakerUIHorizontalCollectionView.h"
#import "PPMaker.h"
#import "PPMakerUIHorizontalCollectionViewExampleCell.h"

@interface PPMakerUIHorizontalCollectionViewExampleViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) PPMakerUIHorizontalCollectionView *collectionView;
@end

@implementation PPMakerUIHorizontalCollectionViewExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.collectionView];

}

#pragma mark --- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PPMakerUIHorizontalCollectionViewExampleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.collectionView.configuration.cellIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = UIColor.ppmake_randomColor;
    return cell;
}

#pragma mark --- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了cell");
}

#pragma mark --- lazy load
- (PPMakerUIHorizontalCollectionView *)collectionView
{
    if (!_collectionView) {
        PPMakerUIHorizontalCollectionViewConfirguration *conf = [[PPMakerUIHorizontalCollectionViewConfirguration alloc] initWithItemSize:CGSizeMake(KWIDTH(80), KWIDTH(120)) itemMargin:KWIDTH(5) headerReferenceSize:CGSizeMake(KWIDTH(10), KWIDTH(120)) footerReferenceSize:CGSizeMake(KWIDTH(10), KWIDTH(120)) cellClass:[PPMakerUIHorizontalCollectionViewExampleCell class]];
        _collectionView = [[PPMakerUIHorizontalCollectionView alloc] initWithFrame:CGRectMake(0, 200, kScreenW, KWIDTH(120)) configuration:conf];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = UIColor.yellowColor;
    }
    return _collectionView;
}

@end
