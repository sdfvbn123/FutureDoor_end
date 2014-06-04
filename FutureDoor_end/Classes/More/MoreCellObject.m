//
//  MoreCellObject.m
//  FutureDoor_end
//
//  Created by apple on 14-5-19.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "MoreCellObject.h"

@implementation MoreCellObject

-(MoreCellObject *)initWithMyimage:(UIImage *)aMyImage andNextImage:(UIImage *)aNextImage andSeparatorImage:(UIImage *)aSeparatorImage andText:(NSString *)aText{
    if (self = [super init]) {
        self.myImage = aMyImage;
        self.nextImage = aNextImage;
        self.separatorImage = aSeparatorImage;
        self.text = aText;
    }
    return self;
}
- (MoreCellObject *)initWithMidImage:(UIImage *)aMidImage{
    if (self = [super init]) {
        self.midImage = aMidImage;
    }
    return self;
}
- (NSString *)description {
    
    return [NSString stringWithFormat:@" %@",self.text];
}

@end
