//
//  xiangmuCell.m
//  FutureDoor_end
//
//  Created by apple on 14-5-30.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "xiangmuCell.h"

@implementation xiangmuCell

- (xiangmuCell *)initWithLbelText:(NSString *)aLabelText andDetailText1:(NSString *)aDetailText andNumImage:(UIImage *)aNumImage andDateImage:(UIImage *)aDateImage andNumLabel:(NSString *)aNumLabel andDateLabel:(NSString *)aDateLabel{
    if (self = [super init]) {
        self.labelText = aLabelText;
        self.detailText1 = aDetailText;
        self.numImage = aNumImage;
        self.dateImage = aDateImage;
        self.numLabel = aNumLabel;
        self.dateLabel = aDateLabel;
    }
    return self;
}

@end
