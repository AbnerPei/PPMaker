//
//  HBRoom.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "HBRoom.h"
#import "PPMakerFontDefine.h"

@implementation HBRoom

@end


@implementation HBHotel

@end

@interface HBRoomCell ()
@property(nonatomic,strong) UILabel *roomNameLB;
@property(nonatomic,strong) UILabel *roomPriceLB;
@end

@implementation HBRoomCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = kColorR(248);
        [self creatCellUI];
    }
    return self;
}
-(void)creatCellUI
{
    self.roomNameLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.font(fontPingFangSCRegular(16));
        make.textColor(kColorBlack);
        make.frame(CGRectMake(30, 0, kScreenW/2-30, kHeight(50)));
    }];
    
    self.roomPriceLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.font(fontPingFangSCSemibold(18));
        make.textColor([UIColor ppmake_red]);
        make.frame(CGRectMake(kScreenW/2, 0, kScreenW/2-10, kHeight(50)));
        make.textAlignment(NSTextAlignmentRight);
    }];
    
    [PPMAKEV pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(30, kHeight(50)-1, kScreenW-30, 1));
        make.bgColor(kColorHex(0xf2f2f2));
    }];
}
-(void)setupWithRoom:(HBRoom *)room
{
    self.roomNameLB.text = room.roomTypeName;
    self.roomPriceLB.text = room.roomTypePrice;
}
@end


@interface HBHotelCell ()
@property(nonatomic,strong) UILabel *hotelNameLB;
@end
@implementation HBHotelCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self creatCellUI];
    }
    return self;
}
-(void)creatCellUI
{
    self.hotelNameLB = [PPMAKELB pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.font(fontPingFangSCRegular(16));
        make.textColor(kColorBlack);
        make.frame(CGRectMake(10, 0, kScreenW-20, kHeight(80)));
    }];
    
    [PPMAKEV pp_make:^(PPMake *make) {
        make.intoView(self.contentView);
        make.frame(CGRectMake(0, kHeight(80)-1, kScreenW, 1));
        make.bgColor(kColorHex(0xf2f2f2));
    }];
}
-(void)setupWithHotel:(HBHotel *)hotel
{
    self.hotelNameLB.text = hotel.hotelName;
}
@end
