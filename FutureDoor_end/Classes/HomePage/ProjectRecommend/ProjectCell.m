//
//  ProjectCell.m
//  FutureDoor_end
//
//  Created by apple on 14-5-29.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "ProjectCell.h"

@implementation ProjectCell

- (ProjectCell *)initWithProjectImage:(UIImage *)aMyImage andText:(NSString *)aText andDetailTex:(NSString *)aDetail andDateTex:(NSString *)aDate{
    if (self = [super init]) {
        self.projectImage = aMyImage;
        self.text = aText;
        self.detailText = aDetail;
        self.dateText = aDate;
    }
    return self;
}
- (NSString *)description {
    
    return [NSString stringWithFormat:@" %@",self.text];
}

@end
