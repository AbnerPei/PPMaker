//
//  UIScrollView+ScrollBlock.m
//  PPTransitions
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/3/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UIScrollView+ScrollBlock.h"
#import <objc/runtime.h>

static NSString *const kUIScrollViewPropertyContentOffset = @"contentOffset";
static NSString *const kUIScrollViewPropertyPanGestureRecognizerState = @"state";

@protocol PPMJRefreshComponentDelegate<NSObject>
@optional
-(void)scrollViewContentOffsetDidChange:(NSDictionary<NSKeyValueChangeKey,id> *)change;
-(void)scrollViewPanStateDidChange:(NSDictionary<NSKeyValueChangeKey,id> *)change;
@end

@interface PPMJRefreshComponent : NSObject
+(PPMJRefreshComponent *)shareInstanceWithScrollView:(UIScrollView *)scrollView;
@property(nonatomic,assign) id<PPMJRefreshComponentDelegate> delegate;
@end


@interface UIView (PPFrameForScrollBlock)
@property (assign, nonatomic) CGFloat pp_h;
@end

@implementation UIView(PPFrameForScrollBlock)
-(void)setPp_h:(CGFloat)pp_h
{
    CGRect frame = self.frame;
    frame.size.height = pp_h;
    self.frame = frame;
}
-(CGFloat)pp_h
{
    return self.frame.size.height;
}
@end

@interface UIScrollView (PPPropertyForScrollBlock)<PPMJRefreshComponentDelegate>
@property (readonly, nonatomic) UIEdgeInsets pp_FSB_inset;
@property (assign, nonatomic) CGFloat pp_FSB_insetT;
@property (assign, nonatomic) CGFloat pp_FSB_offsetY;
@property (assign, nonatomic) CGFloat pp_FSB_contentH;

/** 监听UIScrollView的contentOffsetY的对象 */
@property(nonatomic,strong,readonly) PPMJRefreshComponent *pp_component;
/** 存储最后一次的ContentOffsetY */
@property(nonatomic,strong,readonly) NSNumber *pp_lastContentOffsetY;
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
@implementation UIScrollView(PPPropertyForScrollBlock)
static BOOL gt_ios_11_;

-(PPMJRefreshComponent *)pp_component
{
    PPMJRefreshComponent *component = objc_getAssociatedObject(self, _cmd);
    if (!component) {
        component = [PPMJRefreshComponent shareInstanceWithScrollView:self];
        //此时给UIScrollView绑定component，直到UIScrollView销毁。要不，它的pp_component会提前释放。
        //强行绑定，观察者不过早释放
        //为什么会过早释放呢？？
        //因为此时的component，readonly属性的（只有getter），创建后在self.pp_component.delegate = self;使用后就没有人继续要持有它,所以它会走dealloc方法，为了让scrollView的观察者存在，就用runtime给它强制绑定。
        objc_setAssociatedObject(self, @selector(pp_component), component, OBJC_ASSOCIATION_RETAIN);
    }
    
    return component;
}
-(NSNumber *)pp_lastContentOffsetY{
    return objc_getAssociatedObject(self, _cmd);
}

+ (void)load
{
    // 缓存判断值
    gt_ios_11_ = [[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending;
}

- (UIEdgeInsets)pp_FSB_inset
{
#ifdef __IPHONE_11_0
    if (gt_ios_11_) {
        return self.adjustedContentInset;
    }
#endif
    return self.contentInset;
}

- (void)setPp_FSB_insetT:(CGFloat)pp_FSB_insetT
{
    UIEdgeInsets inset = self.contentInset;
    inset.top = pp_FSB_insetT;
#ifdef __IPHONE_11_0
    if (gt_ios_11_) {
        inset.top -= (self.adjustedContentInset.top - self.contentInset.top);
    }
#endif
    self.contentInset = inset;
}

- (CGFloat)pp_FSB_insetT
{
    return self.pp_FSB_inset.top;
}


- (void)setPp_FSB_offsetY:(CGFloat)pp_FSB_offsetY
{
    CGPoint offset = self.contentOffset;
    offset.y = pp_FSB_offsetY;
    self.contentOffset = offset;
}

- (CGFloat)pp_FSB_offsetY
{
    return self.contentOffset.y;
}

- (void)setPp_FSB_contentH:(CGFloat)pp_FSB_contentH
{
    CGSize size = self.contentSize;
    size.height = pp_FSB_contentH;
    self.contentSize = size;
}

- (CGFloat)pp_FSB_contentH
{
    return self.contentSize.height;
}


@end
#pragma clang diagnostic pop


@implementation UIScrollView (ScrollBlock)

#pragma mark --- PPMJRefreshComponentDelegate
-(void)scrollViewContentOffsetDidChange:(NSDictionary<NSKeyValueChangeKey,id> *)change{
     [self contentOffsetBlockAction:change];
}
-(void)scrollViewPanStateDidChange:(NSDictionary<NSKeyValueChangeKey,id> *)change{
    [self panGestureRecognizerStateAction:change];
}

-(void)contentOffsetBlockAction:(NSDictionary<NSKeyValueChangeKey,id> *)change
{
    //这个属性字面理解意思为：正在拖动。实际上是：scrollView是否滚动了，只要不是最开始初始化的时候设置的位置，就为YES。
    if (!self.isDragging) {
        return;
    }
    //【注意】此处要特别注意，如果设置contentInset的话，要给pp_lastContentOffsetY赋值为insetT的初始值
    if (!self.pp_lastContentOffsetY) {
        [self setupInitializeOffsetY];
    }
    //获取当前的contentOffsetY
    CGFloat currentContentOffsetY = self.pp_FSB_offsetY;
   
    //如果前后的contentOffsetY值相同，就不做处理
    CGFloat lastContentOffsetY = [self.pp_lastContentOffsetY floatValue];
    if (currentContentOffsetY == lastContentOffsetY) {
        return;
    }

    //是否是向上滑，初始值为NO
    BOOL isToUp = NO;

    //向上滑动
    if (currentContentOffsetY > lastContentOffsetY) {
        //处理滑动到底部，继续上滑后系统自动反弹而重复调用的情况
        if (currentContentOffsetY+self.pp_h > self.pp_FSB_contentH) {
            return;
        }
        isToUp = YES;
        
    }else{
        //向下滑动
        //处理已经最上面了仍然下拉而反弹时，反复调用
        if (currentContentOffsetY <= self.pp_FSB_insetT) {
            return;
        }
        
    }
    
    //给pp_lastContentOffsetY绑定值
    objc_setAssociatedObject(self, @selector(pp_lastContentOffsetY), [NSNumber numberWithFloat:currentContentOffsetY], OBJC_ASSOCIATION_RETAIN);
    
    //是否超过一个屏幕
    BOOL isInOneScreen = (self.pp_FSB_insetT+self.pp_FSB_contentH <= self.pp_h);
    
    if (self.pp_scrollBlock) {
        self.pp_scrollBlock(currentContentOffsetY, isToUp,isInOneScreen);
    }

}
-(void)panGestureRecognizerStateAction:(NSDictionary<NSKeyValueChangeKey,id> *)change
{
    if (self.panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        //内容不够一个屏幕时，系统会自动回弹，这时候记得把pp_lastContentOffsetY重新设置一下
        if (self.pp_FSB_insetT+self.pp_FSB_contentH <= self.pp_h) {
            [self setupInitializeOffsetY];
        }else{
            //超过一个屏幕,这时候下拉，当松开的时候要把pp_lastContentOffsetY重新设置一下
            if (self.pp_FSB_offsetY < self.pp_FSB_insetT) {
                [self setupInitializeOffsetY];
            }
        }
    }
    
}

#pragma mark --- 初始化contentOffsetY的值
-(void)setupInitializeOffsetY{
    CGFloat currentContentOffsetY = -self.pp_FSB_insetT;
    objc_setAssociatedObject(self, @selector(pp_lastContentOffsetY), [NSNumber numberWithFloat:currentContentOffsetY], OBJC_ASSOCIATION_RETAIN);
}

-(void)setPp_scrollBlock:(PPUIScrollViewScrollBlock)pp_scrollBlock
{
    //在设置scrollBlock的时候，触发监听
    self.pp_component.delegate = self;
    objc_setAssociatedObject(self, @selector(pp_scrollBlock), pp_scrollBlock, OBJC_ASSOCIATION_RETAIN);
}
-(PPUIScrollViewScrollBlock)pp_scrollBlock
{
   return objc_getAssociatedObject(self, _cmd);
}
@end


@interface PPMJRefreshComponent ()
@property(nonatomic,strong) UIScrollView *scrollView;
/**  */
@property(nonatomic,strong) UIPanGestureRecognizer *pan;
@end

@implementation PPMJRefreshComponent
+(PPMJRefreshComponent *)shareInstanceWithScrollView:(UIScrollView *)scrollView
{
   return [[PPMJRefreshComponent alloc]initWithScrollView:scrollView];
}
-(instancetype)initWithScrollView:(UIScrollView *)scrollView
{
    self = [super init];
    if (self) {
        self.scrollView = scrollView;
        [self addObserver];
    }
    
    return self;
}
-(void)addObserver
{
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:kUIScrollViewPropertyContentOffset options:options context:nil];
    self.pan = self.scrollView.panGestureRecognizer;
    [self.pan addObserver:self forKeyPath:kUIScrollViewPropertyPanGestureRecognizerState options:options context:nil];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:kUIScrollViewPropertyContentOffset]){
        if ([self.delegate respondsToSelector:@selector(scrollViewContentOffsetDidChange:)]) {
            [self.delegate scrollViewContentOffsetDidChange:change];
        }
    }else if ([keyPath isEqualToString:kUIScrollViewPropertyPanGestureRecognizerState]){
        if ([self.delegate respondsToSelector:@selector(scrollViewPanStateDidChange:)]) {
            [self.delegate scrollViewPanStateDidChange:change];
        }
    }
    
}
-(void)removeObserver
{
    [self.scrollView removeObserver:self forKeyPath:kUIScrollViewPropertyContentOffset];
    [self.pan removeObserver:self forKeyPath:kUIScrollViewPropertyPanGestureRecognizerState];
    self.pan = nil;
    
}
-(void)dealloc
{
    [self removeObserver];
}
@end




