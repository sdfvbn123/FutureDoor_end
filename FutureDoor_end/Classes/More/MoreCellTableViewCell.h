//
//  MoreCellTableViewCell.h
//  FutureDoor_end
//
//  Created by apple on 14-5-19.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreCellObject.h"
@interface MoreCellTableViewCell : UITableViewCell
@property (strong,nonatomic) UIImageView *myImageView;
@property (strong,nonatomic) UIButton *button ;
@property (strong,nonatomic) UIImageView *nextImageView;
@property (strong,nonatomic) UIImageView *separatorImageView;
@property (strong,nonatomic) UILabel *label;


-(void)bind:(MoreCellObject *)moreCell;

@end
