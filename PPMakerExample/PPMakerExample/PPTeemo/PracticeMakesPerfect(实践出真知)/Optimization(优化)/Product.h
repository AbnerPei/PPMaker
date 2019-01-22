//
//  Product.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/17.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
/** 商品id */
@property(nonatomic,copy) NSString *productId;
/** 商品名 */
@property(nonatomic,copy) NSString *name;
/** 总价 */
@property(nonatomic,assign) NSInteger totalPrice;
/** 优惠券价格（不一定有） */
@property(nonatomic,assign) NSInteger couponPrice;
@end


//MVC中，M层承担的就是数据逻辑的处理，而此次用Category的目的是：是的业务逻辑更清楚！（很显然，此处效果不明显）
@interface Product (Helper)
/** 是否使用优惠券 */
@property(nonatomic,assign,readonly) BOOL hasCoupon;
/** 界面要展示的价格 */
@property(nonatomic,copy,readonly) NSString *showPrice;
@end
