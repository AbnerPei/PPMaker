////
////  NSUserDefaults+PPMakeSupport.m
////  PPMakerExample
////
////  Created by ╰莪呮想好好宠Nǐつ on 2018/11/5.
////  Copyright © 2018 PPAbner. All rights reserved.
////
//
//#import "NSUserDefaults+PPMakeSupport.h"
//
//@implementation NSUserDefaults (PPMakeSupport)
//
////static inline NSUserDefaults *userDefaults(){
////    return [NSUserDefaults standardUserDefaults];
////}
////static inline void udSync(){
////    [userDefaults() synchronize];
////}
//
//+ (void)ppmake_setObject:(nullable id)value forKey:(NSString *)key
//{
//    [userDefaults() setObject:value forKey:key];
//    udSync();
//}
//+ (nullable id)ppmake_objectForKey:(NSString *)key
//{
//   return [userDefaults() valueForKey:key];
//}
//
//+ (void)ppmake_setInteger:(NSInteger)value forKey:(NSString *)key
//{
//    [userDefaults() setInteger:value forKey:key];
//    udSync();
//}
//+ (NSInteger)ppmake_integerForKey:(NSString *)key
//{
//    return [userDefaults() integerForKey:key];
//}
//
//+ (void)ppmake_setBool:(BOOL)value forKey:(NSString *)key
//{
//    [userDefaults() setBool:value forKey:key];
//    udSync();
//}
//+ (BOOL)ppmake_boolForKey:(NSString *)key
//{
//    return [userDefaults() boolForKey:key];
//}
//
//+ (void)ppmake_setFloat:(NSInteger)value forKey:(NSString *)key
//{
//    [userDefaults() setFloat:value forKey:key];
//    udSync();
//}
//+ (float)ppmake_floatForKey:(NSString *)key
//{
//    return [userDefaults() floatForKey:key];
//}
//
//+ (void)ppmake_setDouble:(NSInteger)value forKey:(NSString *)key
//{
//    [userDefaults() setDouble:value forKey:key];
//    udSync();
//}
//+ (double)ppmake_doubleForKey:(NSString *)key
//{
//   return [userDefaults() doubleForKey:key];
//}
//@end
