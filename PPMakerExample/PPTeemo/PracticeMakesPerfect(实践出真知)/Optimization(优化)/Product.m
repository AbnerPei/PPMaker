//
//  Product.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/17.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "Product.h"

@interface Product ()
@property(nonatomic,copy) NSString *calculatedPrice;
@end

@implementation Product

@end


@implementation Product (Helper)
-(BOOL)hasCoupon
{
    return self.couponPrice > 0;
}

-(NSString *)showPrice
{
    //缓存思想的实践哦
    if (self.calculatedPrice.length > 0) {
        return self.calculatedPrice;
    }
    
    NSString *showPriceStr = @"";
    if (self.hasCoupon) {
        NSInteger realPrice = self.totalPrice - self.couponPrice;
        showPriceStr = [NSString stringWithFormat:@"%ld",(long)realPrice];
    }else{
        showPriceStr = [NSString stringWithFormat:@"%ld",(long)self.totalPrice];
    }
    return showPriceStr;
}
@end
