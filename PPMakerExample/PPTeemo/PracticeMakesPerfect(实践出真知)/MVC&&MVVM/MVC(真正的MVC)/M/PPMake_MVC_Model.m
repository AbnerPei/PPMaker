//
//  PPMake_MVC_Model.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMake_MVC_Model.h"
#import <PPMaker/PPMaker.h>

@implementation PPMake_MVC_Model

@end


@implementation PPMake_MVC_Model (ShowOrderMess)
-(NSString *)orderStatusStr
{
    switch (self.orderStatus) {
            
        case PTMake_MVC_M_OrderStatusChuShiZhuangTai:
            return @"";
            break;
            
        case PTMake_MVC_M_OrderStatusDingDanYiQuXiao:
            return @"订单取消";
            break;
            
        case PTMake_MVC_M_OrderStatusDingDanGuanBi:
            return @"订单关闭";
            break;
            
        case PTMake_MVC_M_OrderStatusDaiZhiFu:
            return @"待支付";
            break;
            
        case PTMake_MVC_M_OrderStatusZhiFuChengGong:
            return @"支付成功";
            break;
            
        case PTMake_MVC_M_OrderStatusChuPiaoZhong:
            return @"出票中";
            break;
            
        case PTMake_MVC_M_OrderStatusChuPiaoChengGong:
            return @"出票成功";
            break;
            
        case PTMake_MVC_M_OrderStatusChuPiaoShiBai:
            return @"出票失败";
            break;
            
        default:
            return @"";
            break;
    }
}
-(NSMutableArray<NSString *> *)leftTitles
{
    NSMutableArray<NSString *> *titles = [NSMutableArray arrayWithArray:@[
                                                                              @"订单号",
                                                                              @"订单金额",
                                                                              @"预订时间"
                                                                              ]];
    if (self.payTime.length > 0) {
        [titles addObject:@"支付时间"];
    }
    if (self.ticketTime.length > 0) {
        [titles addObject:@"出票时间"];
    }
    
    return titles;
}
-(NSMutableArray<NSString *> *)rightTitles
{
    NSMutableArray<NSString *> *titles = [NSMutableArray array];
    
    //订单号
    _addItem(titles, self.orderNo, YES);
    
    //订单金额
    NSInteger orderPrice = [self.orderPrice integerValue];
    NSInteger couponPrice = [self.couponPrice integerValue];
    if (couponPrice > 0) {
        orderPrice -= couponPrice;
    }
    NSString *prcieStr = [NSString stringWithFormat:@"¥%ld",(long)orderPrice];
    _addItem(titles, prcieStr, YES);
    
    //下单时间
    _addItem(titles, self.orderTime, YES);
    
    //支付时间
    _addItem(titles, self.payTime, NO);

    //出票时间
    _addItem(titles, self.ticketTime, NO);

    return titles;
}
static inline void _addItem(NSMutableArray *arr,NSString *item,bool needAddTempty){
    if (item.length > 0) {
        [arr addObject:item];
    }else{
        if (needAddTempty) {
            [arr addObject:@""];
        }
    }
}

-(CGFloat)viewHeight
{
    if (!self) {
        return 0;
    }
    CGFloat viewH = kHeight(130);//38+(8+20)*3+8
    if (self.payTime.length > 0) {
        viewH += kHeight(28);
    }
    if (self.ticketTime.length > 0) {
        viewH += kHeight(28);
    }
    return viewH;
}
@end
