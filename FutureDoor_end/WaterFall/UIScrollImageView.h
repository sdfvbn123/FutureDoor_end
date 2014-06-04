//
//  UISrcollImageView.h
//  FutureDoor_end
//
//  Created by Leador on 14/6/4.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollImageView : UIView<UIScrollViewDelegate>

-(id) initWithFrame:(CGRect)frame withPics:(NSArray*) picArrays;

@end
