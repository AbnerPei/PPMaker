//
//  PPMakeBannerView.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/10.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeBannerView.h"
#import "UIImageView+WebCache.h"

typedef void(^ClickImgBlock) (NSInteger);

@interface PPMakeBannerView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UIImageView *leftImgView;
@property (nonatomic, strong) UIImageView *middleImgView;
@property (nonatomic, strong) UIImageView *rightImgView;
/** 图片源 */
@property (nonatomic, strong) NSArray *imgUrls;
/** 当前显示的图片的 Index */
@property (nonatomic, assign) NSInteger showIndex;
/** 点击图片的回调 Block */
@property (nonatomic, strong) ClickImgBlock clickImgBlock;
/** 自动滚动的计时器 */
@property (nonatomic, strong) NSTimer *cycleRollTimer;
/** 是否手动滑动 */
@property (nonatomic, assign) BOOL manual;

@end

@implementation PPMakeBannerView
/** 默认循环滚动的时间间隔(s) */
static NSTimeInterval const DefaultRollTimeInterval = 4;

#pragma mark - 懒加载
- (UIImageView *)leftImgView {
    if (!_leftImgView) {
        _leftImgView = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return _leftImgView;
}

- (UIImageView *)middleImgView {
    if (!_middleImgView) {
        _middleImgView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
        /** 为中间正在显示的 ImgView 添加点击事件 */
        UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImgView)];
        [_middleImgView setUserInteractionEnabled:YES];
        [_middleImgView addGestureRecognizer:tapGr];
    }
    return _middleImgView;
}

- (UIImageView *)rightImgView {
    if (!_rightImgView) {
        _rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) * 2, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
    }
    return _rightImgView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) - 20, CGRectGetWidth(self.bounds), 20)];
        _pageControl.layer.shadowOpacity = 0.3;
        _pageControl.layer.shadowOffset = CGSizeMake(0, 0);
    }
    return _pageControl;
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.scrollView];
        [_scrollView addSubview:self.leftImgView];
        [_scrollView addSubview:self.middleImgView];
        [_scrollView addSubview:self.rightImgView];
        [self addSubview:self.pageControl];
    }
    return self;
}

#pragma mark - 类方法 返回 WTCycleRollView
+ (instancetype)cycleRollViewWithFrame:(CGRect)frame {
    return [[self alloc] initWithFrame:frame];
}

#pragma mark - 设置图片显示，自动滚动
- (void)setImgUrls:(NSArray *)imgUrls autoCycleRoll:(BOOL)autoCycleRoll clickImgBlock:(void (^)(NSInteger))clickImgBlock {
    _clickImgBlock = clickImgBlock;
    _imgUrls = imgUrls;
    _pageControl.numberOfPages = [imgUrls count];
    _pageControl.currentPage = 0;
    if ([_imgUrls count] > 1) {
//        [_leftImgView sd_setImageWithURL:[NSURL URLWithString:[imgUrls lastObject]]];
//        [_middleImgView sd_setImageWithURL:[NSURL URLWithString:[imgUrls firstObject]]];
//        [_rightImgView sd_setImageWithURL:[NSURL URLWithString:[imgUrls objectAtIndex:1]]];
        _leftImgView.image = [UIImage imageNamed:@"ppamer_banner_marathon"];
        _middleImgView.image = [UIImage imageNamed:@"ppamer_banner_james"];
        _rightImgView.image = [UIImage imageNamed:@"ppamer_banner_competition"];
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds) * 3, 0);
        [_scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.bounds), 0)];
        if (autoCycleRoll) {
            [self stopTimer];
            _cycleRollTimer = [NSTimer scheduledTimerWithTimeInterval:DefaultRollTimeInterval target:self selector:@selector(cycleRoll) userInfo:nil repeats:YES];
        } else {
            [self stopTimer];
        }
    } else {
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds), 0);
        [_leftImgView removeFromSuperview];
        [_rightImgView removeFromSuperview];
        if ([imgUrls count]) {
            [_middleImgView sd_setImageWithURL:[NSURL URLWithString:[imgUrls firstObject]]];
            _middleImgView.frame = self.bounds;
        }
    }
}

#pragma mark - 自动滚动的事件
- (void)cycleRoll {
    // 当手动滚动的时候，跳过此次循环
    if (_manual) {
        _manual = NO;
    } else {
        [_scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.bounds) * 2, 0) animated:YES];
    }
}

- (void)clickImgView {
    !_clickImgBlock ? : _clickImgBlock(_showIndex);
}

#pragma mark - UIScrollView Delegate
/** ScrollView 滑动减速停止回调【这里根据 ScrollView 的偏移量来判断是向左滑还是向右滑】 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([_imgUrls count]) {
        CGFloat offsetX = scrollView.contentOffset.x;
        if (offsetX <= 0) {
            // 向右滑，即将显示上一张图片(若当前显示的是第一张，则上一张为最后一张)
            self.showIndex = (_showIndex + [_imgUrls count] - 1) % [_imgUrls count];
        } else if (offsetX >= CGRectGetWidth(self.bounds) * 2) {
            // 向右滑，即将显示下一张图片(若当前显示的是最后一张，则下一张为第一张)
            self.showIndex = (_showIndex + 1) % [_imgUrls count];
        }
    }
}
/** 自动滑动【即代码设置的滚动(setContentOffset:animated:)】,不会直接调用上述方法(滑动减速停止回调),但会调用此方法,在此方法再调用上述方法便可 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:_scrollView];
}
/** 手动滑动手指触摸屏幕的回调，暂停计时器 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self pauseCycleRoll];
}
/** 手动滑动手指离开屏幕的回调，开启计时器 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _manual = YES;  // 这里开启计时器会立即调用循环滚动的方法，用户体验不好，所以设置此参数，让其跳过这次循环滚动事件
    [self startCycleRoll];
}
/** 根据 ScrollView 偏移量设置 PageControl 的当前页 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([_imgUrls count]) {
        CGFloat offsetX = scrollView.contentOffset.x;
        if (offsetX <= CGRectGetWidth(self.bounds) * 0.5) {
            _pageControl.currentPage = (_showIndex + [_imgUrls count] - 1) % [_imgUrls count];
        } else if (offsetX >= CGRectGetWidth(self.bounds) * 1.5) {
            _pageControl.currentPage = (_showIndex + 1) % [_imgUrls count];
        } else {
            _pageControl.currentPage = _showIndex;
        }
    }
}

#pragma mark - 设置当前显示的图片
- (void)setShowIndex:(NSInteger)showIndex {
    _showIndex = showIndex;
    // 不管向左滑还是向右滑，这里立即将将要显示的图片展示在中间的 ImgView 上，然后马上将 ScrollView 偏移量设置到显示中间的 ImgView
    // 由于代码执行及屏幕显示渲染非常快，肉眼几乎看不出，所以这样就达到了效果
    [_leftImgView sd_setImageWithURL:[NSURL URLWithString:_imgUrls[(_showIndex + [_imgUrls count] - 1) % [_imgUrls count]]]];
    [_middleImgView sd_setImageWithURL:[NSURL URLWithString:_imgUrls[showIndex]]];
    [_rightImgView sd_setImageWithURL:[NSURL URLWithString:_imgUrls[(showIndex + 1) % [_imgUrls count]]]];
    // 切记，这里设置 ScrollView 偏移量不能用动画
    [_scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.bounds), 0)];
}
#pragma mark - 自动滚动时，计时器的暂停与启动
/** 暂停计时器 */
- (void)pauseCycleRoll {
    if (_cycleRollTimer) {
        [_cycleRollTimer setFireDate:[NSDate distantFuture]];
    }
}
/** 启动定时器【在计时器暂停状态下】 */
- (void)startCycleRoll {
    if (_cycleRollTimer) {
        [_cycleRollTimer setFireDate:[NSDate distantPast]];
    }
}

#pragma mark - 停止计时器，并释放
- (void)stopTimer {
    if (_cycleRollTimer) {
        [_cycleRollTimer invalidate];
        _cycleRollTimer = nil;
    }
}
#pragma mark - WTCycleRollView 释放的时候 停止计时器，并释放，否则会造成内存泄漏
- (void)dealloc {
    [self stopTimer];
}

@end
