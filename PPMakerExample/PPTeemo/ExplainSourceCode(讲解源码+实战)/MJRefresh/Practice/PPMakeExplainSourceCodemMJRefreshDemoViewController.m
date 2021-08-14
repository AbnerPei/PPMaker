//
//  PPMakeExplainSourceCodemMJRefreshDemoViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/27.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeExplainSourceCodemMJRefreshDemoViewController.h"
#import "XMNetworking.h"
#import "PPMakeKGSubcategoryListCell.h"
#import "KGSubcategoryListModel.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "AppDelegate.h"
#import "PPMaker.h"

@interface PPMakeExplainSourceCodemMJRefreshDemoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray<KGSubcategoryListModel *> *subcategoryListModels;
/** 当前页 */
@property(nonatomic,assign) NSInteger currentPage;
/** 是否正在下拉刷新 */
@property(nonatomic,assign) BOOL isRefreshing;
/** 是否正在加载更多 */
@property(nonatomic,assign) BOOL isLoadMore;
@end

@implementation PPMakeExplainSourceCodemMJRefreshDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //默认从第0页开始查询
    self.currentPage = 1; //酷狗后台默认传0或者小于0的数都是1.
    [self createUI];
    
    NSMutableArray *testArray = [NSMutableArray arrayWithObjects:@"2",@"3", nil];
    NSString *str = nil;
//    [testArray ppmake_addObject:str];
    [testArray ppmake_insertObject:@"4" atIndex:-6];

}
-(void)createUI
{
    self.tableView = [PPMAKETableVP pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.delegate(self);
        make.frame(CGRectMake(0, kNavBarH, kScreenW, kScreenH-kNavBarH));
    }];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getNetworkDatasWithIsLoadMore:NO];
    }];
    self.tableView.mj_header.ignoredScrollViewContentInsetTop = -100;
//    MJRefreshGifHeader *gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
//         [self getNetworkDatasWithIsLoadMore:NO];
//    }];
//    NSMutableArray<NSString *> *imgs = [NSMutableArray array];
//    for (int i = 1; i < 21; i++) {
//        NSString *imgName = [NSString stringWithFormat:@"kg_icon_mascot_%d",i];
//        UIImage *img = [UIImage imageNamed:imgName];
//        [imgs addObject:img];
//    }
//    [gifHeader setImages:imgs forState:MJRefreshStateRefreshing];
//    self.tableView.mj_header = gifHeader;
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self getNetworkDatasWithIsLoadMore:YES];
    }];
    self.tableView.mj_footer.automaticallyHidden = YES;
}
-(void)getNetworkDatasWithIsLoadMore:(BOOL)isLoadMore
{
    [self judgeWithIsLoadMore:isLoadMore];
    
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.url = [NSString stringWithFormat:@"http://mobilecdnbj.kugou.com/api/v3/tag/specialList?plat=2&id=35&tagid=76&page=%ld&pagesize=10&sort=2&ugc=1",(long)self.currentPage];
        request.httpMethod = kXMHTTPMethodGET;
        request.responseSerializerType = kXMResponseSerializerJSON;
    } onSuccess:^(id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!isLoadMore) {
                [self.subcategoryListModels removeAllObjects];
                [self.tableView reloadData];
                [self endRefresh];
            }
            KGSubcategoryListRequestResult *requestResult = [KGSubcategoryListRequestResult mj_objectWithKeyValues:responseObject];
            if (requestResult.errcode == 0) {
                KGSubcategoryListDataModel *dataModel = requestResult.data;
                [self.subcategoryListModels addObjectsFromArray:dataModel.info];
                [self.tableView reloadData];
                [self endRefresh];
            }else{
                [self endRefresh];
                NSLog(@"酷狗90后列表请求成功但数据不对 %@",requestResult.error);
            }
        });
    } onFailure:^(NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!isLoadMore) {
                [self.subcategoryListModels removeAllObjects];
                [self.tableView reloadData];
            }
            //错误处理
            NSLog(@"酷狗90后列表请求失败 %@",error);
            [self endRefresh];

        });
        
    }];
    

}
-(void)endRefresh
{
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
    self.isRefreshing = NO;
    self.isLoadMore = NO;
}
-(void)judgeWithIsLoadMore:(BOOL)isLoadMore
{
    if (self.isRefreshing || self.isLoadMore) {
        return;
    }
    
    if (isLoadMore) {
        self.currentPage += 1;
    }else{
        self.currentPage = 1;
    }
    
    self.isRefreshing = !isLoadMore;
    self.isLoadMore = isLoadMore;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.subcategoryListModels.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kHeight(70);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPMakeKGSubcategoryListCell *listCell = [PPMakeKGSubcategoryListCell ppmake_cellWithTableView:tableView];
    if (self.subcategoryListModels.count > indexPath.row) {
        [listCell setupCellWithSubcategoryListModel:self.subcategoryListModels[indexPath.row]];
    }
    listCell.selectionStyle = UITableViewCellSelectionStyleGray;
    return listCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击了第%ld行",(long)indexPath.row);

}

-(NSMutableArray<KGSubcategoryListModel *> *)subcategoryListModels
{
    if (!_subcategoryListModels) {
        _subcategoryListModels = [NSMutableArray array];
    }
    return _subcategoryListModels;
}


@end
