//
//  SelfImageVIew.m
//  hlrenTest
//
//  Created by blue on 13-4-23.
//  Copyright (c) 2013年 blue. All rights reserved.
//

#import "SelfImageVIew.h"

#define _WIDTH [UIScreen mainScreen].applicationFrame.size.width/2

@implementation SelfImageVIew

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithImageInfo:(ImageInfo*)imageInfo y:(float)y  withA:(int)a
{
    
    float imageW = imageInfo.width;
    float imageH = imageInfo.height;
    //缩略图宽度和宽度
    float width = _WIDTH - SPACE;
    float height = width * imageH / imageW;
    self = [super initWithFrame:CGRectMake(0, y, _WIDTH, height + SPACE)];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        if(a == 1)
        {
            
            
            return self;
        }
        
        
        
        
        self.data = imageInfo;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SPACE / 2 , SPACE / 2 , width, height)];
        NSURL *url = [NSURL URLWithString:imageInfo.thumbURL];
        [imageView setImageWithURL:url placeholderImage:nil];
        imageView.backgroundColor = [UIColor greenColor];
        [self addSubview:imageView];
        //如果想加别的信息在此可加
        UILabel *labe = [[UILabel alloc]initWithFrame:CGRectMake(SPACE / 2, height - 22 + SPACE, width, 20)];
        labe.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        labe.font = [UIFont systemFontOfSize:20];
        labe.text = [NSString stringWithFormat:@"第%i张图片张图片张图片张图片张图片张图片张图片张图片张图片张图片张图片张图片张图片张图片张图片张图片",a];
        labe.numberOfLines = 10;
        
        CGSize constraint = CGSizeMake(width, 20000.0f);
        
        CGSize size = [labe.text sizeWithFont:labe.font constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
        
        CGFloat labelH = MAX(size.height, 30.0f);
        
//        return height + (CELL_CONTENT_MARGIN * 2);
        
        labe.frame = CGRectMake(SPACE / 2, height, width, labelH);
        
        
        //价格评论
        CGFloat priceH = 20;
        UILabel *priceLabel= [[UILabel alloc] initWithFrame:CGRectMake(labe.frame.origin.x, labe.frame.origin.y + labelH, width, priceH)];
        priceLabel.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        priceLabel.font = [UIFont systemFontOfSize:20];
        priceLabel.text = [NSString stringWithFormat:@"¥%0.1f ☆%d",100.00,8800];
        
        
        
        
        
        
        self.frame = CGRectMake(0, y, _WIDTH, height + SPACE + labelH + priceH);
        
        
        [self addSubview:labe];
        [self addSubview:priceLabel];
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate clickImage:self.data];
}
@end
