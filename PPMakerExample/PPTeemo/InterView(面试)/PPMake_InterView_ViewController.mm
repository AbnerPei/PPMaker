//
//  PPMake_InterView_ViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake_InterView_ViewController.h"
#import "Masonry.h"
#import "PPMaker.h"

@interface Competition : NSObject
@property(nonatomic,assign) NSUInteger status;
@end

@implementation Competition
@end

@interface Audience : NSObject
@end

@implementation Audience
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"观察到了");
}

@end

@interface Person : NSObject

@end

@implementation Person

@end

@interface Student : Person

@end

@implementation Student

@end

@interface PPMake_InterView_ViewController ()
@property(nonatomic,strong) CABasicAnimation *flashAnimation;
@property(nonatomic,strong) UIImageView *imgView;
@property(nonatomic,strong) Competition *competiton;
/** 观众 */
@property(nonatomic,strong) Audience *audience;
@property(nonatomic,strong) Person *person;
@end

@implementation PPMake_InterView_ViewController
-(void)getPerson:(Student *)stu
{
    self.person = stu;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self masonry];
    
}
-(void)masonry
{
    UIView *bgV = [UIView new];
    bgV.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgV];
    
    
    UIView *subV1 = [UIView new];
    [bgV addSubview:subV1];
    subV1.backgroundColor = [UIColor purpleColor];
    
    UIView *subV2 = [UIView new];
    [bgV addSubview:subV2];
    subV2.backgroundColor = [UIColor yellowColor];
    
    
    [subV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgV);
        make.left.equalTo(bgV);
        make.right.equalTo(subV2.mas_left);
        make.width.equalTo(subV2);
        make.height.equalTo(bgV);
    }];
    
    [subV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgV);
        make.right.equalTo(bgV);
        make.width.equalTo(subV1);
        make.height.equalTo(bgV);
    }];
    
    
    bgV.frame = CGRectMake(10, 150, 200, 200);
    
}

-(void)before
{
    [self imgView];
    
    self.competiton = [[Competition alloc]init];
    self.audience = [[Audience alloc]init];
    
    [self.competiton addObserver:self.audience forKeyPath:@"status" options:(NSKeyValueObservingOptionNew) context:nil];
    
    self.competiton.status = 1;
    
    //面试题：当时没反应过来，特此记录
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        
        
        
        
        
        
        
        
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_sync(mainQueue, ^{
            NSLog(@"12");
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                NSLog(@"34");
            });
            NSLog(@"56");
        });
        
        //问 ： 上面代码打印顺序
        
        
        
    });
}


-(void)observeAction
{
    if (_flashAnimation) {
        NSLog(@"key %@",[self.imgView.layer animationKeys]);
    }
//    if ([keyPath isEqualToString:@"status"]) {
        if (self.competiton.status == 2) {
            //显示且添加动画
            self.imgView.hidden = NO;
            [self.imgView.layer addAnimation:[self opacityForever_Animation:1.0f] forKey:@"pp888"]; //动画使用单例，防止重复添加
            
        }else{
            self.imgView.hidden = YES; //否则隐藏掉，有 -》无
            [self.imgView.layer removeAllAnimations];//移除掉动画
            
        }
//    }
}
-(void)dealloc
{
    [self.competiton removeObserver:self.audience forKeyPath:@"status" context:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.competiton.status == 3) {
        self.competiton.status = 1;
    }else{
        self.competiton.status++;
    }
}

#pragma mark === 永久闪烁的动画 ======
-(CABasicAnimation *)opacityForever_Animation:(float)time{
    if (!_flashAnimation) {
        _flashAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];//必须写opacity才行。
        _flashAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
        _flashAnimation.toValue = [NSNumber numberWithFloat:0.4f];//这是透明度。
        _flashAnimation.autoreverses = YES;
        _flashAnimation.duration = time;
        _flashAnimation.repeatCount = MAXFLOAT;
        _flashAnimation.removedOnCompletion = NO;
        _flashAnimation.fillMode = kCAFillModeForwards;
        _flashAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];///没有的话是均匀的动画。
    }
    return _flashAnimation;
}


-(UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [PPMAKEImgV pp_make:^(PPMake *make) {
            make.imageName(@"kg_icon_mascot_1");
            make.hidden(YES);
            make.frame(CGRectMake(10, 100, 100, 80));
            make.intoView(self.view);
        }];
    }
    return _imgView;
}


//-(void)test_005
//{
//    NSArray<NSNumber *> *nums = @[
//                                  @1,@1,@1,@0,
//                                  @1,@1,@1,@0,
//                                  @1,@1,@1,@0,
//                                  @1,@1,@1,@1,
//                                  @0,@1,@1,@1,
//                                  @1,@0,@1,@1,
//                                  ];
//}
//-(int)getLWithNums:(NSArray<NSNumber *> *)nums
//          row:(int)row
//          clo:(int)clo
//{
//    if (nums.count != row*clo) {
//        return 0;
//    }
//    if (![nums containsObject:@0]) {
//        return MIN(row, clo);
//    }
//
//    int i = clo-1;
//    //有效的row
//    int usableRow = row;
//    while (i >= 0) {
//        int cloTrueCount = 0;
//        //先查找最后列由下到上有多少个true
//        for (int j = usableRow-1; j >= 0; usableRow--) {
//            NSInteger index = clo*(j+1)-(clo-i+1);
//            NSNumber *item = nums[index];
//            if ([item isEqualToNumber:@1]) {
//                cloTrueCount++;
//            }
//        }
//        //处理特殊情况：列数小于cloTrueCount
//        if (clo < cloTrueCount) {
//            cloTrueCount = clo;
//        }
//
//        for (int k = cloTrueCount; k >= 0; k--) {
//            NSInteger index = clo*
//        }
//
//        //现在已经确定了最终可能最大的clo，然后对比前一列与之对应的元素是否也为true
//        int nextCloTrueCount = 0;
//        for (int k = row-1; k >= 0; k--) {
//            NSInteger index = clo*(k+1)-(clo-i+1);
//            NSNumber *item = nums[index];
//            if ([item isEqualToNumber:@1]) {
//                nextCloTrueCount++;
//            }else{
//                break;
//            }
//        }
//
//        cloTrueCount = MIN(nextCloTrueCount, cloTrueCount);
//
//        if (cloTrueCount <= 1) {
//            return 0
//        }else{
//
//        }
//    }
//
//    return 0;
//}
//-(BOOL)_col_allFalse
//{
//
//}

-(void)test_004
{
    NSArray<NSNumber *> *nums = @[
                                  @2,@3,@4,
                                  @5,@7,@9,
                                  @1,@0,@6
                                  ];
    NSMutableArray<NSNumber *> *matNums = [NSMutableArray array];
    [self matWithNums:nums row:3 clo:3 matNums:matNums];
    NSLog(@"matNums is %@",matNums);
    /*
     matNums is (
     2,
     3,
     4,
     9,
     6,
     0,
     1,
     5,
     7
     )
     */
    
    NSArray<NSNumber *> *nums1 = @[
                                   @2,@3,@4,@8,
                                   @5,@7,@9,@12,
                                   @1,@0,@6,@10
                                   ];
    NSMutableArray<NSNumber *> *matNums1 = [NSMutableArray array];
    [self matWithNums:nums1 row:3 clo:4 matNums:matNums1];
    NSLog(@"matNums1 is %@",matNums1);
    /*
     matNums1 is (
     2,
     3,
     4,
     8,
     12,
     10,
     6,
     0,
     1,
     5,
     7,
     9
     )
     */
    NSArray<NSNumber *> *nums2 = @[
                                   @2,@3,@4,@5,
                                   @6,@7,@8,@9,
                                   @10,@11,@12,@13,
                                   @14,@15,@16,@17
                                   ];
    NSMutableArray<NSNumber *> *matNums2 = [NSMutableArray array];
    [self matWithNums:nums2 row:4 clo:4 matNums:matNums2];
    NSLog(@"matNums2 is %@",matNums2);
    /*
     matNums2 is (
     2,
     3,
     4,
     5,
     9,
     13,
     17,
     16,
     15,
     14,
     10,
     6,
     7,
     8,
     12,
     11
     )
     */
    
    NSArray<NSNumber *> *nums3 = @[
                                   @1,@2,@3,@4,@5,@6,@7,@8,@9,@10,
                                   @11,@12,@13,@14,@15,@16,@17,@18,@19,@20,
                                   @21,@22,@23,@24,@25,@26,@27,@28,@29,@30
                                   ];
    NSMutableArray<NSNumber *> *matNums3 = [NSMutableArray array];
    [self matWithNums:nums3 row:3 clo:10 matNums:matNums3];
    NSLog(@"matNums3 is %@",matNums3);
    
    
    NSArray<NSNumber *> *nums4 = @[
                                   @2,@3
                                   ];
    NSMutableArray<NSNumber *> *matNums4 = [NSMutableArray array];
    [self matWithNums:nums4 row:1 clo:2 matNums:matNums4];
    NSLog(@"matNums4 is %@",matNums4);
    
    NSArray<NSNumber *> *nums5 = @[
                                   @2,
                                   @3
                                   ];
    NSMutableArray<NSNumber *> *matNums5 = [NSMutableArray array];
    [self matWithNums:nums5 row:2 clo:1 matNums:matNums5];
    NSLog(@"matNums5 is %@",matNums5);
    
    /**
     matNums4 is (
     2,
     3
     )
     
     matNums5 is (
     2,
     3
     )
     */
}

#pragma mark --- 第4题 顺时针环绕列印矩阵元素
-(void)matWithNums:(NSArray<NSNumber *> *)nums
               row:(int)row
               clo:(int)clo
           matNums:(NSMutableArray<NSNumber *> *)matNums
{
    if (nums.count != clo*row) {
        return;
    }
    
    BOOL isLeft2Right = YES;
    BOOL isTop2Bottom = NO;
    BOOL isRight2Left = NO;
    BOOL isBottom2Top = NO;
    
    //左→右
    if (isLeft2Right) {
        for (int i = 0; i < clo; i++) {
            [matNums addObject:nums[i]];
            if (i == clo-1) {
                isLeft2Right = NO;
                isTop2Bottom = YES;
                isRight2Left = NO;
                isBottom2Top = NO;
                //只要一行
                if (row == 1) {
                    isTop2Bottom = NO;
                    break;
                }
            }
        }
    }
    
    if (isTop2Bottom) {
        for (int i = 1; i < row; i++) {
            int index = clo*(i+1)-1;
            [matNums addObject:nums[index]];
            if (i == row-1) {
                isLeft2Right = NO;
                isTop2Bottom = NO;
                isRight2Left = YES;
                isBottom2Top = NO;
                //只有一列
                if (clo == 1) {
                    isRight2Left = NO;
                    return;
                }
            }
        }
    }
    
    if (isRight2Left) {
        for (int i = 0; i <= clo-2; i++) {
            int index = clo*(row-1)+(clo-2-i);
            [matNums addObject:nums[index]];
            if (i == 0) {
                isLeft2Right = NO;
                isTop2Bottom = NO;
                isRight2Left = NO;
                isBottom2Top = YES;
            }
        }
    }
    
    if (isBottom2Top) {
        for (int i = 1; i <= row-2; i++) {
            int index = clo*(row-1-i);
            [matNums addObject:nums[index]];
            if (i == row-2) {
                isLeft2Right = YES;
                isTop2Bottom = NO;
                isRight2Left = NO;
                isBottom2Top = NO;
                clo -= 2;
                row -= 2;
                //处理特殊情况
                if (clo == 1 && row == 1) {
                    [matNums addObject:nums[4]];
                    isLeft2Right = NO;
                    break;
                }else{
                    NSMutableArray *originalNums = [NSMutableArray arrayWithArray:nums];
                    [originalNums removeObjectsInArray:matNums];
                    [self matWithNums:originalNums row:row clo:clo matNums:matNums];
                }
            }
        }
    }

}



/*
 * 5 
 */


@end
