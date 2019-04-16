//
//  PPMakerNSUserDefaultsDefine.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/4/16.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#ifndef PPMakerNSUserDefaultsDefine_h
#define PPMakerNSUserDefaultsDefine_h

NS_ASSUME_NONNULL_BEGIN

CG_INLINE NSUserDefaults *userDefaults(){
    return [NSUserDefaults standardUserDefaults];
}

CG_INLINE void ud_Sync(){
    [userDefaults() synchronize];
}

CG_INLINE void ud_setObject(_Nullable id value,NSString *key){
    [userDefaults() setObject:value forKey:key];
    ud_Sync();
}

CG_INLINE _Nullable id ud_valueForKey(NSString *key){
    return [userDefaults() valueForKey:key];
}

CG_INLINE void ud_setInteger(NSInteger value,NSString *key){
    [userDefaults() setInteger:value forKey:key];
    ud_Sync();
}

CG_INLINE NSInteger ud_integerForKey(NSString *key){
    return [userDefaults() integerForKey:key];
}

CG_INLINE void ud_setBool(BOOL value,NSString *key){
    [userDefaults() setBool:value forKey:key];
    ud_Sync();
}

CG_INLINE BOOL ud_boolForKey(NSString *key){
    return [userDefaults() boolForKey:key];
}

CG_INLINE void ud_setFloat(float value,NSString *key){
    [userDefaults() setFloat:value forKey:key];
    ud_Sync();
}

CG_INLINE float ud_floatForKey(NSString *key){
    return [userDefaults() floatForKey:key];
}

CG_INLINE void ud_setDouble(double value,NSString *key){
    [userDefaults() setDouble:value forKey:key];
    ud_Sync();
}

CG_INLINE float ud_doubleForKey(NSString *key){
    return [userDefaults() doubleForKey:key];
}

NS_ASSUME_NONNULL_END

#endif /* PPMakerNSUserDefaultsDefine_h */
