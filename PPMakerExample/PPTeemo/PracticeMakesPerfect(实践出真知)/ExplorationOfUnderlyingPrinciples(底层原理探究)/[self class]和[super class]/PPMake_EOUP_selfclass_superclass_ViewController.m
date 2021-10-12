//
//  PPMake_EOUP_selfclass_superclass_ViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/9/20.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPMake_EOUP_selfclass_superclass_ViewController.h"
#import "PPMake_EOUP_Student.h"

@interface PPMake_EOUP_selfclass_superclass_ViewController ()

@end

@implementation PPMake_EOUP_selfclass_superclass_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PPMake_EOUP_Student *stu = [[PPMake_EOUP_Student alloc] init];
    stu.schoolName = @"家里蹲大学";
}


@end
