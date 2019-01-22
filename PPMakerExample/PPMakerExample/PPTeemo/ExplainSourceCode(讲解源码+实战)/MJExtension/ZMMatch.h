//
//  ZMMatch.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/29.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

//解析如下
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//
//    NSDictionary *dataSourceDict = [self readLocalFileWithName:@"NBA"];
//    ZMMatchRequestResult *result = [ZMMatchRequestResult mj_objectWithKeyValues:dataSourceDict];
//    if ([result.message isEqualToString:@"success"]) {
//        //请求成功，有数据
//        ZMMatchData *matchData = result.data;
//        //然后接下来数据你自己处理
//        //比如，你肯定是按照天显示
//        NSMutableArray *todayMatches = [NSMutableArray arrayWithArray:matchData.matches];
//        //...
//    }else{
//        //失败or没数据
//    }
//}
//
//// 读取本地JSON文件
//- (NSDictionary *)readLocalFileWithName:(NSString *)name {
//    // 获取文件路径
//    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
//    // 将文件数据化
//    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
//    // 对数据进行JSON格式化并返回字典形式
//    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//}

 

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ZMScheduleDetailStatusState) {
    ZMScheduleDetailStatusStateUnstart = 0, //未开赛
    ZMScheduleDetailStatusStatePlaying,     //正在比赛
    ZMScheduleDetailStatusStateEnded        //比赛已结束
};
@class ZMMatchData;



//整体的网络请求结果模型
@interface ZMMatchRequestResult : NSObject
@property(nonatomic,copy) NSString *message;
@property(nonatomic,strong) ZMMatchData *data;
@end

//比赛
@interface ZMMatchData : NSObject
@property(nonatomic,strong) NSMutableArray *matches;//放ZMMatch的数组
@property(nonatomic,copy) NSString *anchor;
@end

//比赛
@interface ZMMatch : NSObject
@property(nonatomic,copy) NSString *schedule_time;
@property(nonatomic,strong) NSMutableArray *schedule_list; //放ZMSchedule的数组
@property(nonatomic,copy) NSString *anchor;
@end

//比赛---计划
@class ZMScheduleDetail;
@interface ZMSchedule : NSObject
@property(nonatomic,copy) NSString *schedule_name;
@property(nonatomic,strong) ZMScheduleDetail *schedule_detail;
@property(nonatomic,copy) NSString *schedule_tour;
@end

//计划---详情
@class ZMScheduleDetailStatus;
@class ZMTeam;
@interface ZMScheduleDetail : NSObject
@property(nonatomic,copy) NSString *schedule_name;
@property(nonatomic,strong) ZMScheduleDetailStatus *status;
@property(nonatomic,strong) ZMTeam *guest_team;
@property(nonatomic,strong) ZMTeam *host_team;
@property(nonatomic,assign) BOOL is_follow;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *live_id;
@property(nonatomic,copy) NSString *guess_url;
@property(nonatomic,assign) NSInteger mid;
#warning 888
/** 这个我看是""型的，所以用字符串，如果没猜错，这个实际可能是个数组 */
@property(nonatomic,copy) NSString *tv_live_channels;
@property(nonatomic,copy) NSString *anchor;

@end

//赛事状态模型
@interface ZMScheduleDetailStatus : NSObject
#warning 888
///此处，我没猜错，应该是个枚举值，可根据具体项目改进
@property(nonatomic,assign) ZMScheduleDetailStatusState state;
@property(nonatomic,copy) NSString *time;
@end

//NBA球队模型
@interface ZMTeam : NSObject
@property(nonatomic,copy) NSString *portrait;
@property(nonatomic,assign) NSInteger score;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) NSInteger teamId;
@end

