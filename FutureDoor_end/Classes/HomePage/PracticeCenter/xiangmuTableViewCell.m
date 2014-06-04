//
//  xiangmuTableViewCell.m
//  FutureDoor_end
//
//  Created by apple on 14-5-30.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "xiangmuTableViewCell.h"

@implementation xiangmuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.labelText = [[UILabel alloc]initWithFrame:CGRectMake(25, 12, 290, 25.5)];
        self.labelText.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.labelText];
        self.detailText1 = [[UILabel alloc]initWithFrame:CGRectMake(25, self.labelText.frame.origin.y+self.labelText.frame.size.height+8, 290, 16)];
        self.detailText1.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.detailText1];
        
        self.numImage = [[UIImageView alloc]initWithFrame:CGRectMake(25, self.detailText1.frame.origin.y+self.detailText1.frame.size.height+8, 11, 11)];
        [self.contentView addSubview:self.numImage];
        self.dateImage = [[UIImageView alloc]initWithFrame:CGRectMake(210, self.detailText1.frame.origin.y+self.detailText1.frame.size.height+8, 11, 11)];
        [self.contentView addSubview:self.dateImage];
        
        self.numLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.numImage.frame.origin.x+self.numImage.frame.size.width+5, self.detailText1.frame.origin.y+self.detailText1.frame.size.height+8, 40, 11)];
        self.numLabel.font = [UIFont systemFontOfSize:12];
        self.numLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.numLabel];
        self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.dateImage.frame.origin.x+self.dateImage.frame.size.width+5, self.detailText1.frame.origin.y+self.detailText1.frame.size.height+8, 70, 11)];
        self.dateLabel.font = [UIFont systemFontOfSize:12];
        self.dateLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.dateLabel];
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}
- (void)bind:(xiangmuCell *)xiangmuCell{
    self.labelText.text = xiangmuCell.labelText;
    self.detailText1.text = xiangmuCell.detailText1;
    self.numLabel.text = xiangmuCell.numLabel;
    self.numImage.image = xiangmuCell.numImage;
    self.dateLabel.text = xiangmuCell.dateLabel;
    self.dateImage.image = xiangmuCell.dateImage;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
