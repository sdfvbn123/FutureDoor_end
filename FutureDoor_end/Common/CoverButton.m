//
//  CoverButton.m
//  FutureDoor_end
//
//  Created by 席鹏飞 on 14-5-31.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "CoverButton.h"

@interface CoverButton ()

@end

static CoverButton *coverButton;

@implementation CoverButton
@synthesize coverBtn;
@synthesize direction;

+ (CoverButton *)instance{
	if (coverButton == nil) {
		coverButton = [[CoverButton alloc] init];
	}
	return coverButton;
}

- (void)dealloc{
    
    self.coverBtn = nil;
    self.direction = nil;
}

@end
