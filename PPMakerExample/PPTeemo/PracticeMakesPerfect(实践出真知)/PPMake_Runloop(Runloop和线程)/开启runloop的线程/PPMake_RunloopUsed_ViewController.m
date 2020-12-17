//
//  PPMake_RunloopUsed_ViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/3.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake_RunloopUsed_ViewController.h"
#import "PPMakeDemoThread.h"

@interface PPMake_RunloopUsed_ViewController ()
@property(nonatomic,strong) PPMakeDemoThread *demoThread;
@end

@implementation PPMake_RunloopUsed_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _demoThread = [[PPMakeDemoThread alloc]initWithTarget:self selector:@selector(threadAction) object:nil];
    _demoThread.name = NSStringFromClass([PPMakeDemoThread class]);
    [_demoThread start];
    
    
    // [_demoThread start];
    
    //reason: '*** -[PPMakeDemoThread start]: attempt to start the thread again'
    /*
     执行完任务后，虽然_demoThread没有被释放，还处于内存中，但是它处于死亡状态（当线程的任务结束后就会进入这种状态）.
     */
    
}

-(void)threadAction
{
    NSLog(@"%s - %@",__func__,[NSThread currentThread]);
}



@end
