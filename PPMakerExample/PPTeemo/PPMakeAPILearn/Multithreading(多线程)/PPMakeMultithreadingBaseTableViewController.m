//
//  PPMakeMultithreadingBaseTableViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/27.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeMultithreadingBaseTableViewController.h"

@interface PPMakeMultithreadingBaseTableViewController ()

@end

@implementation PPMakeMultithreadingBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self testGCD3];
    
}
-(void)configureDatas
{
    self.titles = @[
                    @"七牛上传图片"
                    ];
    self.vcs = @[
                 @"PPMake_QiNiu_ViewController"
                 ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)testGCD3
{
    dispatch_semaphore_t semaphore =  dispatch_semaphore_create(5);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (int i=0;i<100 ; i++) {
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        dispatch_async(queue, ^{
            NSLog(@"i = %d",i);
            //此处模拟一个 异步下载图片的操作
            sleep(2);
            dispatch_semaphore_signal(semaphore);
        });
    }
}

@end
