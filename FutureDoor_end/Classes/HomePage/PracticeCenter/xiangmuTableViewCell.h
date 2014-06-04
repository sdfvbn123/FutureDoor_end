//
//  xiangmuTableViewCell.h
//  FutureDoor_end
//
//  Created by apple on 14-5-30.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xiangmuCell.h"
@interface xiangmuTableViewCell : UITableViewCell

@property (strong,nonatomic) UILabel *labelText;
@property (strong,nonatomic) UILabel *detailText1;
@property (strong,nonatomic) UIImageView *numImage;
@property (strong,nonatomic) UIImageView *dateImage;
@property (strong,nonatomic) UILabel *numLabel;
@property (strong,nonatomic) UILabel *dateLabel;

-(void)bind:(xiangmuCell *)xiangmuCell;

@end
