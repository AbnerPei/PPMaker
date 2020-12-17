//
//  KGSubcategoryListModel.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/27.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KGBaseRequestResult.h"

@interface KGTrans_param : NSObject
@property (nonatomic, assign) NSInteger special_tag;
@end

@interface KGSubcategoryListModel : NSObject
@property (nonatomic, copy)   NSString *singername;
//专题介绍
@property (nonatomic, copy)   NSString *intro;
@property (nonatomic, assign) NSInteger collectcount;
//专题图片路径
@property (nonatomic, copy)   NSString *imgurl;
//专题名称
@property (nonatomic, copy)   NSString *specialname;
@property (nonatomic, assign) NSInteger verified;
@property (nonatomic, strong) KGTrans_param *trans_param;
@property (nonatomic, assign) NSInteger suid;
//播放次数
@property (nonatomic, assign) NSInteger playcount;
@property (nonatomic, copy)   NSString *username;
@property (nonatomic, assign) NSInteger specialid;
@property (nonatomic, copy)   NSString *publishtime;
@property (nonatomic, assign) NSInteger slid;
@end

@interface KGSubcategoryListDataModel : NSObject
@property (nonatomic, assign) NSInteger timestamp;
@property (nonatomic, strong) NSArray *info;
/* 总数据量 */
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, strong) NSArray *vipspecials;
@end


@interface KGSubcategoryListRequestResult : KGBaseRequestResult
@property(nonatomic,strong) KGSubcategoryListDataModel *data;
@end


