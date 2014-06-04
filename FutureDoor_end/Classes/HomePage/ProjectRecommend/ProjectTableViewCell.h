//
//  ProjectTableViewCell.h
//  FutureDoor_end
//
//  Created by apple on 14-5-29.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectCell.h"
@interface ProjectTableViewCell : UITableViewCell

@property (strong,nonatomic) UIImageView *myImageView;
@property (strong,nonatomic) UILabel *labelText;
@property (strong,nonatomic) UILabel *detailText;
@property (strong,nonatomic) UILabel *dateText;

-(void)blind:(ProjectCell *)projectCell;

@end
