//
//  PPMake_UITableView_UpdatesViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/4.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake_UITableView_UpdatesViewController.h"
#import "NSIndexPath+PPMakeEasilyDebug.h"

@interface PPMakeTableViewUpdateRowModel : NSObject
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *number;
@end

@implementation PPMakeTableViewUpdateRowModel
@end

@interface PPMakeTableViewUpdateSectionModel : NSObject
@property(nonatomic,copy) NSString *dateStr;
@property(nonatomic,strong) NSMutableArray<PPMakeTableViewUpdateRowModel *> *rowModels;
@end

@implementation PPMakeTableViewUpdateSectionModel
@end


@interface PPMakeTableViewRowCell : UITableViewCell

@property(nonatomic,strong) UILabel *titleLB;
@property(nonatomic,strong) UILabel *numberLB;
@property(nonatomic,strong) UIButton *deleteBT;
@property(nonatomic,copy) void(^deleteRowBlock)(PPMakeTableViewUpdateRowModel *rowModel,NSIndexPath *indexP);

-(void)setupCellWithRowModel:(PPMakeTableViewUpdateRowModel *)rowModel indexPath:(NSIndexPath *)indexPath;
@end



@implementation PPMakeTableViewRowCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self createCellUI];
    }
    return self;
}
-(void)createCellUI
{
    self.titleLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(10, 10, kScreenW-20, 30));
        make.textColor([UIColor ppmake_violet]);
        make.font(kFontSemibold(18));
    }];
    
    self.numberLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(10, 50, kScreenW-20, 30));
        make.textColor([UIColor ppmake_black]);
        make.font(kFontRegular(14));
    }];
    
    self.deleteBT = [PPMAKEBT pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(kScreenW-110, 90, 100, 40));
        make.normalAttributedFontColorTitle(kFontSemibold(16), kColorHex(0xff4d4d), @"删除此行");
        make.borderColor(kColorHex(0xf2f2f2));
        make.borderWidth(2);
    }];
    
    [PPMAKEV pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(0, 133, kScreenW, 2));
        make.bgColor(kColorHex(0xf2f2f2));
    }];
    
}
-(void)setupCellWithRowModel:(PPMakeTableViewUpdateRowModel *)rowModel indexPath:(NSIndexPath *)indexPath
{
    [self.deleteBT ppmake_actionWithBlock:^{
        if (self.deleteRowBlock) {
            self.deleteRowBlock(rowModel, indexPath);
        }
    }];
    
    self.titleLB.text = rowModel.title;
    self.numberLB.text = rowModel.number;
}
@end



@interface PPMake_UITableView_UpdatesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray<PPMakeTableViewUpdateSectionModel *> *sectionModels;
@end

@implementation PPMake_UITableView_UpdatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addDatas];
    [self createUI];
}

-(void)createUI
{
    self.tableView = [PPMAKETableVP pp_make:^(PPMake *make) {
        make.intoView(self.view);
        make.frame(CGRectMake(0, self.navigationView.height, kScreenW, kScreenH-self.navigationView.height));
        make.delegate(self);
        make.hasEstimatedHeight(NO);
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionModels.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.sectionModels.count > section) {
        PPMakeTableViewUpdateSectionModel *sectionM = self.sectionModels[section];
        return sectionM.rowModels.count;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPMakeTableViewRowCell *cell = [PPMakeTableViewRowCell ppmake_cellWithTableView:tableView];
    if (self.sectionModels.count > indexPath.section) {
        PPMakeTableViewUpdateSectionModel *sectionM = self.sectionModels[indexPath.section];
        if (sectionM.rowModels.count > indexPath.row) {
            PPMakeTableViewUpdateRowModel *rowM = sectionM.rowModels[indexPath.row];
            [cell setupCellWithRowModel:rowM indexPath:indexPath];
            
            cell.deleteRowBlock = ^(PPMakeTableViewUpdateRowModel *rowModel, NSIndexPath *indexP) {
                [indexPath ppmake_debugLog];
                NSLog(@"8888");
                [indexP ppmake_debugLog];
                [self deleteRowWithRowModel:rowModel indexPath:indexP];
            };
        }
    }
    return cell;
}
-(void)deleteRowWithRowModel:(PPMakeTableViewUpdateRowModel *)rowModel indexPath:(NSIndexPath *)indexPath
{
    if (self.sectionModels.count > indexPath.section) {
        PPMakeTableViewUpdateSectionModel *sectionM = self.sectionModels[indexPath.section];
        if (sectionM.rowModels.count <= 1) {
            NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSetWithIndex:indexPath.section];
            [self.sectionModels removeObjectsAtIndexes:indexSet];
            [self.tableView deleteSections:indexSet withRowAnimation:(UITableViewRowAnimationFade)];
            [self.tableView reloadData];
        }else{
            if (sectionM.rowModels.count > indexPath.row) {
                [sectionM.rowModels removeObjectAtIndex:indexPath.row];

                NSMutableArray *indexPaths = [NSMutableArray arrayWithObject:indexPath];

                [CATransaction begin];
                [CATransaction setCompletionBlock:^{
                    NSLog(@"aferCompletionBlock");
                    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:(UITableViewRowAnimationNone)];
                }];
                [self.tableView beginUpdates];
                [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:(UITableViewRowAnimationFade)];
                [self.tableView endUpdates];
                [CATransaction commit];
            }
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.sectionModels.count > section) {
        return 50;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.sectionModels.count > section) {
        UIView *view = [PPMAKEV pp_make:^(PPMake *make) {
            make.frame(CGRectMake(0, 0, kScreenW, 50));
            make.bgColor([UIColor ppmake_strawberry]);
        }];
        UILabel *dateLB = [PPMAKELB pp_make:^(PPMake *make) {
            make.intoView(view);
            make.frame(CGRectMake(10, 5, 120, 40));
            make.cornerRadius(20);
            make.textAlignment(NSTextAlignmentCenter);
            make.font(kFontMedium(16));
            make.textColor([UIColor ppmake_orange]);
        }];
        
        PPMakeTableViewUpdateSectionModel *sectionM = self.sectionModels[section];
        dateLB.text = sectionM.dateStr;
        return view;
    }
    return [UIView new];
}
-(NSMutableArray<PPMakeTableViewUpdateSectionModel *> *)sectionModels
{
    if (!_sectionModels) {
        _sectionModels = [NSMutableArray array];
    }
    return _sectionModels;
}
-(void)addDatas
{
    for (int i = 0; i < 3; i++) {
        PPMakeTableViewUpdateSectionModel *sectionM = [[PPMakeTableViewUpdateSectionModel alloc]init];
        sectionM.dateStr = [NSString stringWithFormat:@"2018-09-%2d",i];
        NSMutableArray<PPMakeTableViewUpdateRowModel *> *rowModels = [NSMutableArray array];
        for (int j = 0; j < 5-i; j++) {
            PPMakeTableViewUpdateRowModel *rowM = [[PPMakeTableViewUpdateRowModel alloc]init];
            rowM.title = [NSString stringWithFormat:@"section---%d,row---%d",i,j];
            rowM.number = [NSString stringWithFormat:@"2018-%2d-%2d",i,j];
            [rowModels addObject:rowM];
        }
        sectionM.rowModels = rowModels;
        [self.sectionModels addObject:sectionM];
    }
}
@end
