//
//  UIViewController+UIScreenBrightness.m
//  PPMakerExample
//
//  Created by PPAbner on 2019/10/31.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import "UIViewController+UIScreenBrightness.h"
#import <objc/runtime.h>

static const char kUIScreenBrightnessKey;

@interface JCBrightness : NSObject

@property (nonatomic, assign) CGFloat userBrightness;
@property (nonatomic, assign) CGFloat maxBrightness;
@property (nonatomic, strong) NSOperationQueue *queue;

- (instancetype)initWithViewController:(UIViewController *)viewController maxBrightness:(CGFloat)maxBrightness;
- (void)changeToMaxBrightness;
- (void)changeToUserBrightness;

@end

@interface JCBrightness ()

@end

@implementation JCBrightness

- (instancetype)initWithViewController:(UIViewController *)viewController maxBrightness:(CGFloat)maxBrightness
{
    self = [super init];
    if (self) {
        _maxBrightness = maxBrightness;
        _userBrightness = [UIScreen mainScreen].brightness;
        
        objc_setAssociatedObject(viewController, &kUIScreenBrightnessKey, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willResignActive) name:UIApplicationWillResignActiveNotification object:nil];
        
    }
    return self;
}

- (void)DidBecomeActive
{
    [self changeToMaxBrightness];
}

- (void)willResignActive
{
    [self changeToUserBrightness];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)changeToMaxBrightness
{
    [self changeToBrightness:_maxBrightness];
}

- (void)changeToUserBrightness
{
    [self changeToBrightness:_userBrightness];
}

- (void)changeToBrightness:(CGFloat)brightness
{
    [self.queue cancelAllOperations];
    CGFloat currentBrightness = [UIScreen mainScreen].brightness;
    CGFloat step = 0.005 * ((brightness > currentBrightness) ? 1 : -1);
    int times = fabs((brightness - currentBrightness) / 0.005);
    //根据亮度差计算出时间和每个单位时间调节的亮度值
    for (CGFloat i = 1; i < times + 1; i++) {
        [self.queue addOperationWithBlock:^{
                        [NSThread sleepForTimeInterval:1 / 180.0];
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIScreen mainScreen].brightness = currentBrightness + i * step;
            });
        }];
    }
}

- (void)changeUserBrightness
{
    UIApplicationState applicationState = [UIApplication sharedApplication].applicationState;
    if (applicationState == UIApplicationStateActive) {
        //活跃状态
    }else if (applicationState == UIApplicationStateInactive){
        //不活跃状态
        //1.【下拉通知栏】更改亮度，更新用户设置的亮度
        _userBrightness = [UIScreen mainScreen].brightness;
    }else{
        //进入后台
        //2. 进入后台（双击home键或者打开其它APP）,用户通过【设置--亮度】or【下拉通知栏】更改亮度，更新用户设置的亮度
        _userBrightness = [UIScreen mainScreen].brightness;
    }
}

#pragma mark --- lazy load
- (NSOperationQueue *)queue
{
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 1;
    }
    return _queue;
}

@end



@implementation UIViewController (UIScreenBrightness)

- (BOOL)isNeedToUpdateWhenUserBrightnessChanged
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsNeedToUpdateWhenUserBrightnessChanged:(BOOL)isNeedToUpdateWhenUserBrightnessChanged
{
    objc_setAssociatedObject(self, @selector(isNeedToUpdateWhenUserBrightnessChanged), [NSNumber numberWithBool:isNeedToUpdateWhenUserBrightnessChanged], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    JCBrightness *brightness = objc_getAssociatedObject(self, &kUIScreenBrightnessKey);
    if (!brightness) {
        //先isNeedToUpdateUserBrightnessWhenInactive，默认0.8
        brightness = [[JCBrightness alloc] initWithViewController:self maxBrightness:0.8];
    }
    [[NSNotificationCenter defaultCenter] addObserver:brightness selector:@selector(changeUserBrightness) name:UIScreenBrightnessDidChangeNotification object:nil];
}

- (void)setupMaxBrightness:(CGFloat)maxBrightness
{
    if (maxBrightness < 0.0) {
        maxBrightness = 0.6;
    }
    
    if (maxBrightness > 1.0) {
        maxBrightness = 1.0;
    }
    
    JCBrightness *brightness = objc_getAssociatedObject(self, &kUIScreenBrightnessKey);
    if (!brightness) {
        //先setupMaxBrightness
        brightness = [[JCBrightness alloc] initWithViewController:self maxBrightness:maxBrightness];
    }else{
        //先isNeedToUpdateUserBrightnessWhenInactive后setupMaxBrightness
        brightness.maxBrightness = maxBrightness;
    }
}

- (void)changeToMaxBrightnessWhenViewDidAppear
{
    JCBrightness *brightness = objc_getAssociatedObject(self, &kUIScreenBrightnessKey);
    [brightness changeToMaxBrightness];
}

- (void)changeToUserBrightnessWhenViewDidDisappear
{
    JCBrightness *brightness = objc_getAssociatedObject(self, &kUIScreenBrightnessKey);
    [brightness changeToUserBrightness];
}
@end

