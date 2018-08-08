//
//  KGHandler.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/27.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "KGHandler.h"

@implementation KGHandler
/**
 * 处理播放次数，如1288060处理成128.9万
 */
+(NSString *)kg_playCount:(NSInteger)playCount
{
    if (playCount <= 0) {
        return @"";
    }else if (playCount < 10000) {
        return [NSString stringWithFormat:@"%ld",(long)playCount];
    }else if (playCount < 100000000){
        return [NSString stringWithFormat:@"%.1f万",(float)playCount/10000];
    }else{
        return [NSString stringWithFormat:@"%.1f亿",(float)playCount/100000000];
    }
}
@end
