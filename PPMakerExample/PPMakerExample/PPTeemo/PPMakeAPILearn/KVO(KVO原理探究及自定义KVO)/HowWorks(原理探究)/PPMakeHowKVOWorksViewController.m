//
//  PPMakeHowKVOWorksViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/7/17.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeHowKVOWorksViewController.h"
#import "PPKVOPerson.h"

@interface PPMakeHowKVOWorksViewController ()
{
    NSInteger tapCount;
}
@property(nonatomic,strong) PPKVOPerson *person;
@end

@implementation PPMakeHowKVOWorksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.person = [[PPKVOPerson alloc]init];
//    [self.person addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:@"测试一下"];
//    [self.person PG_addObserver:self forKey:@"name" withBlock:^(id observedObject, NSString *observedKey, id oldValue, id newValue) {
//        NSLog(@"%@--%@--%@--%@",observedObject,observedKey,oldValue,newValue);
//    }];
}
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
//{
//     NSLog(@"%@对象的%@属性改变了：%@", object, keyPath, change);
//}
//-(void)dealloc
//{
//    [self.person removeObserver:self forKeyPath:@"name"];
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.person.name = [NSString stringWithFormat:@"小明%ld",(long)tapCount];
}

@end
