//
//  PPMake__PathManager__ViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/10/24.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMake__PathManager__ViewController.h"
#import "PPMakePathManager.h"

@interface PPMake__PathManager__ViewController ()

@end

@implementation PPMake__PathManager__ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self log];
}

- (void)log
{
    NSString *documentPath = PPMakePathManager.ppmake_documentPath;
    NSLog(@"documentPath is %@",documentPath);
}

@end
