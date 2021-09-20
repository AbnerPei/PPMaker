//
//  PPMakeAPILearn_UICollectionView_Demo2_ViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/9/20.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMakeAPILearn_UICollectionView_Demo2_ViewController.h"
#import "PPMakeAPILearn_UICollectionView_Index_Cell.h"
#import "PPMakeCategory.h"

@interface PPMakeAPILearn_UICollectionView_Demo2_ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation PPMakeAPILearn_UICollectionView_Demo2_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = CGRectMake(0, kNavBarH, kScreenW, kScreenH - kNavBarH);
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 60;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PPMakeAPILearn_UICollectionView_Index_Cell *indexCell = [collectionView dequeueReusableCellWithReuseIdentifier:kPPMakeAPILearn_UICollectionView_Index_Cell_Identifier forIndexPath:indexPath];
    indexCell.textLabel.text = [NSString stringWithFormat:@"这时第%ld个cell",(long)indexPath.item];
    return indexCell;
}

#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了第%ld个cell",(long)indexPath.item);
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kScreenW, 60);
}

#pragma mark lazy load
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor lightGrayColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[PPMakeAPILearn_UICollectionView_Index_Cell class] forCellWithReuseIdentifier:kPPMakeAPILearn_UICollectionView_Index_Cell_Identifier];
    }
    return _collectionView;
}

@end
