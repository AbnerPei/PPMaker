//
//  PPMake_MVC_Model.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef NS_ENUM(NSInteger,PTMake_MVC_M_OrderStatus) {
    PTMake_MVC_M_OrderStatusChuShiZhuangTai = 0,                       //初始状态
    PTMake_MVC_M_OrderStatusDingDanYiQuXiao,                           //订单取消
    PTMake_MVC_M_OrderStatusDingDanGuanBi,                             //订单关闭
    PTMake_MVC_M_OrderStatusDaiZhiFu,                                  //待支付
    PTMake_MVC_M_OrderStatusZhiFuChengGong,                            //支付成功
    PTMake_MVC_M_OrderStatusChuPiaoZhong,                              //出票中
    PTMake_MVC_M_OrderStatusChuPiaoChengGong,                          //出票成功
    PTMake_MVC_M_OrderStatusChuPiaoShiBai                              //出票失败
};

@interface PPMake_MVC_Model : NSObject
/** 订单号  */
@property (nonatomic,copy) NSString *orderNo;
/** 订单状态 */
@property(nonatomic,assign) PTMake_MVC_M_OrderStatus orderStatus;
/** 订单金额 */
@property(nonatomic,copy) NSString *orderPrice;
/** 优惠券金额 */
@property(nonatomic,copy) NSString *couponPrice;
/** 下单时间 （一定有的） */
@property(nonatomic,copy) NSString *orderTime;
/** 支付时间 （不一定有，必须支付成功后才有） */
@property(nonatomic,copy) NSString *payTime;
/** 出票时间 （不一定有，必须在出票成功后才有） */
@property(nonatomic,copy) NSString *ticketTime;
@end


///展示订单信息的Category （此处以第二种方式演示）
///使用的Category的好处：代码逻辑层级清晰，业务模块分明
/*
 * 有两种方式
 * 1> 方法
 * 2> readonly属性
 */
@interface PPMake_MVC_Model (ShowOrderMess)
/** 订单状态字符串 */
@property(nonatomic,copy,readonly) NSString *orderStatusStr;
/** 左边文字数组 */
@property(nonatomic,strong,readonly) NSMutableArray<NSString *> *leftTitles;
/** 右边文字数组 */
@property(nonatomic,strong,readonly) NSMutableArray<NSString *> *rightTitles;
/** view的高度，因为出票时间不一定有 */
@property(nonatomic,assign,readonly) CGFloat viewHeight;
@end
