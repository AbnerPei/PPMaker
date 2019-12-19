//
//  PPNSDateCategoryDemoViewController.m
//  PPMakerExample
//
//  Created by PPAbner on 2019/10/11.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import "PPNSDateCategoryDemoViewController.h"
#import "NSDate+PPMakeSupport.h"

@interface PPNSDateCategoryDemoViewController ()

@end

@implementation PPNSDateCategoryDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDate *tomorrowDate = [NSDate pp_dateTomorrow];
    NSString *tomorrowStr_line = [NSDate pp_strTomorrowWithWantedDateStyle:(NSDateFormatterStyleKeyLine_yyyyMMdd_HHmmss)];
    NSString *tomorrowStr_slash = [tomorrowDate pp_strWithWantedDateStyle:NSDateFormatterStyleKeySlash_yyyyMMdd_HHmmss];
    
    NSLog(@"tomorrowDate is %@\n",tomorrowDate);
    NSLog(@"tomorrowStr_line is %@\n",tomorrowStr_line);
    NSLog(@"tomorrowStr_slash is %@\n",tomorrowStr_slash);
    
    NSString *before1 = [[NSDate date] pp_strAfter:(NSCalendarUnitDay) interval:-14 wantedDateStyle:NSDateFormatterStyleKeySlash_yyyyMMdd_HHmmss];
    NSLog(@"before1 %@\n",before1);
    
    NSString *after1 = [[NSDate date] pp_strAfter:(NSCalendarUnitDay) interval:14 wantedDateStyle:NSDateFormatterStyleKeySlash_yyyyMMdd_HHmmss];
    NSLog(@"after1 %@\n",after1);
    
    BOOL isAdd = NO;
    NSInteger index = 60;
    if (isAdd) {
        index = index + 1;
        NSLog(@"yes %ld",(long)index);
    }else{
        index = index - 2;
        NSLog(@"no %ld",(long)index);
    }

}


@end
