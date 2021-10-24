//
//  PPMakePathManager.h
//  PPMakerExample
//
//  Created by AbnerPei on 2021/10/24.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

#if defined __cplusplus
extern "C" {
#endif
    
    BOOL isFileExist(NSString *path);
    
    BOOL creatFileDirectory(NSString *directoryPath);
    BOOL creatFileDirectoryIfNotExist(NSString *directoryPath);

    BOOL creatFilePath(NSString *filePath);
    BOOL creatFilePathIfNotExist(NSString *filePath);

    BOOL cleanFile(NSString *path);
    BOOL cleanFileIfExist(NSString *path);

#if defined __cplusplus
};
#endif


NS_ASSUME_NONNULL_BEGIN

@interface PPMakePathManager : NSObject

/// 获取Document的路径
+ (NSString *)ppmake_documentPath;

@end

NS_ASSUME_NONNULL_END
