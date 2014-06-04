//
//  xiangmuCell.h
//  FutureDoor_end
//
//  Created by apple on 14-5-30.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xiangmuCell : NSObject

@property (strong,nonatomic) NSString *labelText;
@property (strong,nonatomic) NSString *detailText1;
@property (strong,nonatomic) UIImage *numImage;
@property (strong,nonatomic) UIImage *dateImage;
@property (strong,nonatomic) NSString *numLabel;
@property (strong,nonatomic) NSString *dateLabel;

-(xiangmuCell *)initWithLbelText:(NSString *)aLabelText
                  andDetailText1:(NSString *)aDetailText
                     andNumImage:(UIImage *)aNumImage
                    andDateImage:(UIImage *)aDateImage
                     andNumLabel:(NSString *)aNumLabel
                    andDateLabel:(NSString *)aDateLabel;

@end
