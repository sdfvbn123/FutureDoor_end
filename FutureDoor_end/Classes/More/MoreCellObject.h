//
//  MoreCellObject.h
//  FutureDoor_end
//
//  Created by apple on 14-5-19.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoreCellObject : NSObject

@property (strong,nonatomic) UIImage *myImage;
@property (strong,nonatomic) UIImage *nextImage;
@property (strong,nonatomic) UIImage *separatorImage;
@property (strong,nonatomic) NSString *text;
@property (strong,nonatomic) UIImage *midImage;

-(MoreCellObject *)initWithMyimage:(UIImage *)aMyImage
                      andNextImage:(UIImage *)aNextImage
                 andSeparatorImage:(UIImage *)aSeparatorImage
                           andText:(NSString *)aText;
- (MoreCellObject *)initWithMidImage:(UIImage *)aMidImage;

@end
