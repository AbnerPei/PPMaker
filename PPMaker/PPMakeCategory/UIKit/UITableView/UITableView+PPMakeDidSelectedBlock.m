//
//  UITableView+PPMakeDidSelectedBlock.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/30.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "UITableView+PPMakeDidSelectedBlock.h"
#import <objc/runtime.h>

@implementation UITableView (PPMakeDidSelectedBlock)

+(void)load
{
    swizzExchange([UITableView class], @selector(setDelegate:), @selector(ppmake_setDelegate:));
}
-(void)ppmake_setDelegate:(id<UITableViewDelegate>)delegate
{
    if(delegate){
        //1. 系统原生的didSelected方法
        SEL systemDidSelectedSelector = getSystemDidSelectedSelector();
        if ([delegate respondsToSelector:systemDidSelectedSelector]) {
            [self addMethodToClassWithDelegate:delegate];
            [self replaceDidSelectedMethodWithDelegate:delegate];
        }
    }
    //拦截原生的delegate，别忘了调用（此处调用ppmake_setDelegate:实际上就是调用setDelegate:，说句不该说的话，此处看不懂，runtime你根本不会）
    [self ppmake_setDelegate:delegate];
}
#pragma mark --- 给VC添加一个`内存地址指向系统didSelectd方法`的方法
-(void)addMethodToClassWithDelegate:(id<UITableViewDelegate>)delegate
{
    //假的didSelected方法（和系统原生的didSelected方法指针地址相同，但不是一个方法，却响应同样事件）
    SEL fakeDidSelectedSelector = makeFakeDidSelectedSelector();
    SEL systemDidSelectedSelector = getSystemDidSelectedSelector();
    
    Method systemDidSelectedMethod = class_getInstanceMethod([delegate class],systemDidSelectedSelector);
    IMP systemDidSelectedlMethodIMP = method_getImplementation(systemDidSelectedMethod);
    class_addMethod([delegate class], fakeDidSelectedSelector, systemDidSelectedlMethodIMP, method_getTypeEncoding(systemDidSelectedMethod));
}

#pragma mark --- 替换方法
-(void)replaceDidSelectedMethodWithDelegate:(id<UITableViewDelegate>)delegate
{
    //自定义的_custom_ppmake_tableView:didSelectRowAtIndexPath:方法，用于拦截处理想要的操作，比如：发通知，block回调等。
    SEL customDidSelectedSelector = makeCustomDidSelectedSelector();
    Method customDidSelectedMethod = class_getInstanceMethod([self class], customDidSelectedSelector);
    IMP customDidSelectedMethodIMP = method_getImplementation(customDidSelectedMethod);
    //替换系统的tableView:didSelectRowAtIndexPath:为自定义的_custom_ppmake_tableView:didSelectRowAtIndexPath:
    SEL systemDidSelectedSelector = getSystemDidSelectedSelector();
    class_replaceMethod([delegate class], systemDidSelectedSelector, customDidSelectedMethodIMP, method_getTypeEncoding(customDidSelectedMethod));
}
-(void)_custom_ppmake_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.ppmake_didSelectedBlock) {
        tableView.ppmake_didSelectedBlock(tableView, indexPath);
    }
    
    //VIP: 此时，系统原生的didSelected方法已经被拦截，并且做了你想做的事情，可是怎么让系统原生的didSelected还能响应点击？
    /*
     方案一： 不用class_addMethod方法，而是在[delegate respondsToSelector:systemDidSelectedSelector]条件语句里
     添加代理绑定：
     objc_setAssociatedObject(PPTableViewDidSelectedNotificationKey, @selector(_custom_ppmake_tableView:didSelectRowAtIndexPath:), delegate, OBJC_ASSOCIATION_RETAIN);
     然后在此处，执行：
     id ppDelegate = objc_getAssociatedObject(PPTableViewDidSelectedNotificationKey, _cmd);
     [ppDelegate _custom_ppmake_tableView:tableView didSelectRowAtIndexPath:indexPath];
     哦😯，傻了，这相当于直接调用系统的didSelected方法，/(ㄒoㄒ)/~~，错！错！错！
     */
    
    //方案二：利用NSInvocation底层发消息，如下：
    SEL fakeDidSelectedSelector = makeFakeDidSelectedSelector();
    NSMethodSignature *methodSignature = [[tableView.delegate class]instanceMethodSignatureForSelector:fakeDidSelectedSelector];

    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    invocation.target = tableView.delegate;
    invocation.selector = fakeDidSelectedSelector;
    [invocation setArgument:&tableView atIndex:2];
    [invocation setArgument:&indexPath atIndex:3];
    [invocation retainArguments];
    [invocation invoke];
}

#pragma mark --- 生成一个内存地址指向系统的tableView:didSelectRowAtIndexPath:方法的方法，类似浅拷贝：新生成的对象和旧对象，指向同一块内存地址。
static inline SEL makeFakeDidSelectedSelector(){
    return NSSelectorFromString(@"pp_fakeTableView:didSelectRowAtIndexPath:");
}
#pragma mark --- 获取系统原生的didSelected方法
static inline SEL getSystemDidSelectedSelector(){
    return @selector(tableView:didSelectRowAtIndexPath:);
}
#pragma mark --- 生成一个自定义的didSelected方法
static inline SEL makeCustomDidSelectedSelector(){
    return @selector(_custom_ppmake_tableView:didSelectRowAtIndexPath:);
}


-(void)setPpmake_didSelectedBlock:(PPMakeTableViewDidSelectedBlcok)ppmake_didSelectedBlock
{
    objc_setAssociatedObject(self, @selector(ppmake_didSelectedBlock), ppmake_didSelectedBlock, OBJC_ASSOCIATION_RETAIN);
}
-(PPMakeTableViewDidSelectedBlcok)ppmake_didSelectedBlock
{
    return objc_getAssociatedObject(self, _cmd);
}


#pragma mark --- 【内部】（交换同一个类两个方法）
static inline void swizzExchange(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod){
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod),method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
