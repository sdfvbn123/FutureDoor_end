//
//  NewsListCell.m
//  FutureDoor_end
//
//  Created by apple on 14-5-9.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "NewsListCell.h"

@implementation NewsListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];//清除cell的背景色
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 60)];
//        bgView.backgroundColor = [UIColor lightGrayColor];
        bgView.alpha = 0.3;
        [self.contentView addSubview:bgView];
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 5, 42, 42)];
        [self.contentView addSubview:self.imgView];
        self.lbTitle = [[UILabel alloc]initWithFrame:CGRectMake(75, 5, 200, 20)];
        [self.lbTitle setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:self.lbTitle];
        self.lbSubtitle = [[UILabel alloc]initWithFrame:CGRectMake(75, 30, 200, 20)];
        [self.lbSubtitle setFont:[UIFont systemFontOfSize:12]];
        [self.lbSubtitle setTextColor:[UIColor grayColor]];
        [self.contentView addSubview:self.lbSubtitle];
//        UIImageView *myimg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner2"]];
//        myimg.frame = CGRectMake(295, 20, 20, 20);
//        [self.contentView addSubview:myimg];
//        self.selectionStyle = UITableViewCellSelectionStyleNone;//去除选中行的状态
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
