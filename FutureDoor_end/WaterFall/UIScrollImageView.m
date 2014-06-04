//
//  UISrcollImageView.m
//  FutureDoor_end
//
//  Created by Leador on 14/6/4.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "UIScrollImageView.h"

@interface UIScrollImageView ()
{
    UIScrollView* scrollView;
    
    NSArray* picArray;
    UIPageControl* pageControl;
}

@end

@implementation UIScrollImageView

-(id) initWithFrame:(CGRect)frame withPics:(NSArray*) picArrays
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        picArray = picArrays;
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        
        for (int i = 0; i < [picArray count]; i++) {
            UIImageView* scrollImageView = [[UIImageView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            scrollImageView.image = [UIImage imageNamed:@"banner1.png"];
            [scrollView addSubview:scrollImageView];
        }
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self; //**代理一定要设置,需要用到代理方法
        scrollView.userInteractionEnabled = NO;
//        scrollView.page = 0;
        [self addSubview:scrollView];
        
        
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height-20, frame.size.width, 20)];
        
        pageControl.currentPage = 0;
        pageControl.numberOfPages = [picArray count];
        
        [self addSubview:pageControl];
        
    }
    return self;
}

@end
