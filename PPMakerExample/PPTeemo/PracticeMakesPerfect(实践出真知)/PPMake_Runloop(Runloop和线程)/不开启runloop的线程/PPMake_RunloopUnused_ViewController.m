//
//  PPMake_RunloopUnused_ViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/3.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake_RunloopUnused_ViewController.h"
#import "PPMakeDemoThread.h"

@interface PPMake_RunloopUnused_ViewController ()

@end

@implementation PPMake_RunloopUnused_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PPMakeDemoThread *thread = [[PPMakeDemoThread alloc]initWithTarget:self selector:@selector(threadAction) object:nil];
    thread.name = NSStringFromClass([PPMakeDemoThread class]);
    [thread start];
}

-(void)threadAction
{
    NSLog(@"%s - %@",__func__,[NSThread currentThread]);
}

@end
