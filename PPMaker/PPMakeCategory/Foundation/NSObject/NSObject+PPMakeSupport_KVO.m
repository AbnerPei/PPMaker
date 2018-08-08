//
//  NSObject+PPMakeSupport_KVO.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/22.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "NSObject+PPMakeSupport_KVO.h"
#import <objc/message.h>
#import <objc/runtime.h>

NSString *const kPGKVOClassPrefix = @"PGKVOClassPrefix_";
NSString *const kPGKVOAssociatedObservers = @"PGKVOAssociatedObservers";

@interface PGObservationInfo:NSObject

@property (nonatomic, weak)NSObject *observer;
@property (nonatomic, copy)NSString *key;
@property (nonatomic, copy)PGObservingBlock block;

@end

@implementation PGObservationInfo

- (instancetype)initWithObserver:(NSObject *)observer key:(NSString *)key block:(PGObservingBlock)block {
    self = [super init];
    if (self) {
        _observer = observer;
        _key = key;
        _block = block;
    }
    return self;
}

@end

static NSArray *ClassMethodNames(Class c){
    NSMutableArray *array = [NSMutableArray array];
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(c, &methodCount);
    unsigned int i;
    for (i = 0;i<methodCount;i++) {
        [array addObject:NSStringFromSelector(method_getName(methodList[i]))];
    }
    free(methodList);
    
    return array;
}

static void PrintDescription(NSString *name,id obj){
    NSString *str = [NSString stringWithFormat:
                     @"%@: %@\n\tNSObject class %s\n\tRuntime class %s\n\timplements methods <%@>\n\n",
                     name,
                     obj,
                     class_getName([obj class]),
                     class_getName(object_getClass(obj)),
                     [ClassMethodNames(object_getClass(obj)) componentsJoinedByString:@", "]];
    printf("%s\n", [str UTF8String]);
}

#pragma mark - Helpers
static NSString *getterForSetter(NSString *setter){
    if (setter.length <=0 || ![setter hasPrefix:@"set"]|| ![setter hasSuffix:@":"]) {
        return nil;
    }
    NSRange range = NSMakeRange(3, setter.length - 4);
    NSString *key = [setter substringWithRange:range];
    NSString *firstLetter = [[key substringToIndex:1] lowercaseString];
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:firstLetter];
    return key;
}

static NSString *setterForGetter(NSString *getter){
    if (getter.length <= 0) {
        return nil;
    }
    
    NSString *firstLetter = [[getter substringToIndex:1] uppercaseString];
    NSString *remainingLetters = [getter substringFromIndex:1];
    NSString *setter = [NSString stringWithFormat:@"set%@%@:",firstLetter,remainingLetters];
    return setter;
    
}

static void kvo_setter(id self, SEL _cmd,id newValue){
    NSString *setterName = NSStringFromSelector(_cmd);
    NSString *getterName = getterForSetter(setterName);
    if (!getterName) {
        NSString *reason = [NSString stringWithFormat:@"Object %@ does not have setter %@", self, setterName];
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:reason
                                     userInfo:nil];
        return;
    }
    id oldValue = [self valueForKey:getterName];
    struct objc_super superclazz = {
        .receiver = self,
        .super_class = class_getSuperclass(object_getClass(self))
        
    };
    void (*objc_msgSendSuperCasted)(void *,SEL,id) = (void *)objc_msgSendSuper;
    objc_msgSendSuperCasted(&superclazz,_cmd,newValue);
    
    NSMutableArray *observers = objc_getAssociatedObject(self, (__bridge const void *)(kPGKVOAssociatedObservers));
    for (PGObservationInfo *each in observers) {
        if ([each.key isEqualToString:getterName]) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                each.block(self,getterName,oldValue,newValue);
            });
        }
    }
}

static Class kvo_class(id self, SEL _cmd){
    return class_getSuperclass(object_getClass(self));
}

@implementation NSObject (PPMakeSupport_KVO)



- (void)PG_addObserver:(NSObject *)observer
                forKey:(NSString *)key
             withBlock:(PGObservingBlock)block
{
    // Step 1: Throw exception if its class or superclasses doesn't implement the setter
    SEL setterSelector = NSSelectorFromString(setterForGetter(key));
    Method setterMethod = class_getInstanceMethod([self class], setterSelector);
    if (!setterMethod) {
        NSString *reason = [NSString stringWithFormat:@"Object %@ does not have a setter for key %@", self, key];
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:reason
                                     userInfo:nil];
        
        return;
    }
    
    Class clazz = object_getClass(self);
    NSString *clazzName = NSStringFromClass(clazz);
    
    // Step 2: Make KVO class if this is first time adding observer and
    //          its class is not an KVO class yet
    if (![clazzName hasPrefix:kPGKVOClassPrefix]) {
        clazz = [self makeKvoClassWithOriginalClassName:clazzName];
        object_setClass(self, clazz);
    }
    
    // Step 3: Add our kvo setter method if its class (not superclasses)
    //          hasn't implemented the setter
    if (![self hasSelector:setterSelector]) {
        const char *types = method_getTypeEncoding(setterMethod);
        class_addMethod(clazz, setterSelector, (IMP)kvo_setter, types);
    }
    
    // Step 4: Add this observation info to saved observation objects
    PGObservationInfo *info = [[PGObservationInfo alloc]initWithObserver:observer key:key block:block];
    NSMutableArray *observers = objc_getAssociatedObject(self, (__bridge const void *)(kPGKVOAssociatedObservers));
    if (!observers) {
        observers = [NSMutableArray array];
        objc_setAssociatedObject(self, (__bridge const void *)(kPGKVOAssociatedObservers), observers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [observers addObject:info];
}

- (Class)makeKvoClassWithOriginalClassName:(NSString *)originalClazzName {
    NSString *kvoClazzName = [kPGKVOClassPrefix stringByAppendingString:originalClazzName];
    Class clazz = NSClassFromString(kvoClazzName);
    if (clazz) {
        return clazz;
        
    }
    //目标类
    Class originalClazz = object_getClass(self);
    //kvo的新类
    Class kvoClazz = objc_allocateClassPair(originalClazz, kvoClazzName.UTF8String, 0);
    Method classMethod = class_getInstanceMethod(originalClazz, @selector(class));
    const char*types = method_getTypeEncoding(classMethod);
    class_addMethod(kvoClazz, @selector(class), (IMP)kvo_class, types);
    objc_registerClassPair(kvoClazz);
    return kvoClazz;
}

- (BOOL)hasSelector:(SEL)selector{
    Class clazz = object_getClass(self);
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(clazz, &methodCount);
    for (unsigned int i = 0; i< methodCount; i++) {
        SEL thisSelector = method_getName(methodList[i]);
        if (thisSelector == selector) {
            free(methodList);
            return YES;
        }
    }
    free(methodList);
    return NO;
}

@end
