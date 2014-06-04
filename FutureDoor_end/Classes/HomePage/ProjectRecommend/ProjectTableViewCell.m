//
//  ProjectTableViewCell.m
//  FutureDoor_end
//
//  Created by apple on 14-5-29.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "ProjectTableViewCell.h"

@implementation ProjectTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(16.5, 11.5, 65, 65)];
        self.myImageView.layer.cornerRadius = self.myImageView.frame.size.height/2;
        self.myImageView.layer.borderWidth = 1.5;
        self.myImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.myImageView.layer.masksToBounds = YES;

        [self.contentView addSubview:self.myImageView];
        
        self.labelText = [[UILabel alloc]initWithFrame:CGRectMake(16.5+65+10, 21, 220, 20)];
        self.labelText.font = [UIFont systemFontOfSize:14.5];
        [self.contentView addSubview:self.labelText];
        
        self.detailText = [[UILabel alloc]initWithFrame:CGRectMake(16.5+65+10, 35, 220, 40)];
        self.detailText.numberOfLines = 3;
        NSString *noteStr = self.detailText.text;
        NSUInteger charnum = noteStr.length;
        if (charnum < 40) {
            self.detailText.text = noteStr;
        }else{
            self.detailText.text = [[noteStr substringToIndex:15]stringByAppendingString:@"..."];
            
        }
        self.detailText.textColor = [UIColor grayColor];
        self.detailText.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:self.detailText];
        
        self.dateText = [[UILabel alloc]initWithFrame:CGRectMake(220+32, 53, 90, 15)];
        self.dateText.textColor = [UIColor grayColor];
        self.dateText.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:self.dateText];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}
//数据绑定方法
-(void)blind:(ProjectCell *)project{
    self.myImageView.image = project.projectImage;
    self.labelText.text = project.text;
    self.detailText.text = project.detailText;
    self.dateText.text = project.dateText;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
