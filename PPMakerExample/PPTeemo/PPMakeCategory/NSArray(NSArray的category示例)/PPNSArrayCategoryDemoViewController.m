//
//  PPNSArrayCategoryDemoViewController.m
//  PPMakerExample
//
//  Created by AbnerPei on 2021/8/14.
//  Copyright © 2021 PPAbner. All rights reserved.
//

#import "PPNSArrayCategoryDemoViewController.h"
#import "PPMakeDog.h"
#import "PPMakeStudent.h"
#import "NSArray+PPMakerSupport_Safe.h"

@interface PPNSArrayCategoryDemoViewController ()

@end

@implementation PPNSArrayCategoryDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test1];
}


- (void)test1
{
    NSArray *arr1 = [self dogs];
    
    PPMakePerson *person = [arr1 ppmake_objectAtIndex:2 specifiedClass:[PPMakePerson class]];
    NSLog(@"test1----person is %@", person);

    PPMakeDog *dog = [arr1 ppmake_objectAtIndex:2 specifiedClass:[PPMakeDog class]];
    NSLog(@"test1----dog is %@", dog);
    
    /**
     PPMakerExample[4417:119187] test1----person is (null)
     PPMakerExample[4417:119187] test1----dog is <PPMakeDog: 0x600002b04a80>
     */
}


- (NSArray *)dogs
{
    PPMakeDog *dog1 = [[PPMakeDog alloc] init];
    dog1.nickName = @"Xiaohei";
    dog1.breedName = @"Husky";
    
    PPMakeDog *dog2 = [[PPMakeDog alloc] init];
    dog2.nickName = @"Xiaohei2";
    dog2.breedName = @"Husky2";

    PPMakeDog *dog3 = [[PPMakeDog alloc] init];
    dog3.nickName = @"Xiaohei3";
    dog2.breedName = @"Husky3";
    
    PPMakePerson *p1 = [[PPMakePerson alloc] init];
    p1.dog = dog3;
    p1.name = @"Zhangyu";
    
    return @[dog1, dog2, dog3, p1];
}

@end
