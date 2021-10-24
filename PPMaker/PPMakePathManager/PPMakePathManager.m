//
//  PPMakePathManager.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/10/24.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMakePathManager.h"

BOOL isFileExist(NSString *path) {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

BOOL creatFileDirectory(NSString *directoryPath) {
   return [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
}

BOOL creatFileDirectoryIfNotExist(NSString *directoryPath) {
    if (isFileExist(directoryPath)) {
        return YES;
    }else{
        return creatFileDirectory(directoryPath);
    }
}

BOOL creatFilePath(NSString *filePath) {
    return [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
}

BOOL creatFilePathIfNotExist(NSString *filePath) {
    if (isFileExist(filePath)) {
        return YES;
    }else{
        return creatFilePath(filePath);
    }
}

BOOL cleanFile(NSString *path) {
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

BOOL cleanFileIfExist(NSString *path) {
    if (isFileExist(path)) {
        return cleanFile(path);
    }else{
        return YES;
    }
}

@implementation PPMakePathManager

+ (NSString *)ppmake_documentPath
{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

@end
