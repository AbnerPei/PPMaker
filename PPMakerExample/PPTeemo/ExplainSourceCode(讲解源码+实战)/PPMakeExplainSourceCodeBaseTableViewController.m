//
//  PPMakeExplainSourceCodeBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/26.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeExplainSourceCodeBaseTableViewController.h"
#import "ZMMatch.h"
#import "MJExtension.h"

@interface PPMakeExplainSourceCodeBaseTableViewController ()

@end

@implementation PPMakeExplainSourceCodeBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *dataSourceDict = [self readLocalFileWithName:@"NBA"];
    ZMMatchRequestResult *result = [ZMMatchRequestResult mj_objectWithKeyValues:dataSourceDict];
    if ([result.message isEqualToString:@"success"]) {
        //请求成功，有数据
        ZMMatchData *matchData = result.data;
        //然后接下来数据你自己处理
        //比如，你肯定是按照天显示
        NSMutableArray *todayMatches = [NSMutableArray arrayWithArray:matchData.matches];
        //...
    }else{
        //失败or没数据
    }
}

// 读取本地JSON文件
- (NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

-(void)configureDatas
{
    self.titles = @[
                    @"MJRefresh源码解读与分析"
                    ];
    
    self.vcs = @[
                 @"PPMakeExplainSourceCodePracticeMJRefreshBaseTableViewController"
                 ];
}

@end
