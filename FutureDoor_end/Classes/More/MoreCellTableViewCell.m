//
//  MoreCellTableViewCell.m
//  FutureDoor_end
//
//  Created by apple on 14-5-19.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "MoreCellTableViewCell.h"

@implementation MoreCellTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(18.5, 15.5, 29, 29)];
        self.myImageView.layer.cornerRadius = self.myImageView.frame.size.height/2;
        self.myImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.myImageView];
        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(59.5, 10, 240, 45)];
        [self.contentView addSubview:self.label];
        
        self.nextImageView = [[UIImageView alloc]initWithFrame:CGRectMake(286.5, 22, 24.5, 12.5)];
        [self.contentView addSubview:self.nextImageView];
        
        self.separatorImageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, self.myImageView.frame.origin.y+self.myImageView.frame.size.height+2, 280, 2)];
        [self.contentView addSubview:self.separatorImageView];
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}
//数据绑定方法
-(void)bind:(MoreCellObject *)moreCell{
    self.myImageView.image = moreCell.myImage;
    self.nextImageView.image = moreCell.nextImage;
    self.separatorImageView.image = moreCell.separatorImage;
    self.label.text = moreCell.text;
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
