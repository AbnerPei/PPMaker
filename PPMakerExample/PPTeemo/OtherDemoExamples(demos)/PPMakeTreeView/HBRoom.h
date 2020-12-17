//
//  HBRoom.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPMakeTreeItem.h"



@interface HBRoom : PPMakeTreeItem
@property(nonatomic,copy) NSString *roomTypeName;
@property(nonatomic,copy) NSString *roomTypePrice;
@end


@interface HBHotel : PPMakeTreeItem
@property(nonatomic,copy) NSString *hotelName;
@end

@interface HBRoomCell : UITableViewCell
-(void)setupWithRoom:(HBRoom *)room;
@end

@interface HBHotelCell : UITableViewCell
-(void)setupWithHotel:(HBHotel *)hotel;
@end
