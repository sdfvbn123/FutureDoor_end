//
//  ProjectCell.h
//  FutureDoor_end
//
//  Created by apple on 14-5-29.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ProjectCell : NSObject

@property (strong,nonatomic) UIImage *projectImage;
@property (strong,nonatomic) NSString *text;
@property (strong,nonatomic) NSString *detailText;
@property (strong,nonatomic) NSString *dateText;

-(ProjectCell *)initWithProjectImage:(UIImage *)aMyImage
                           andText:(NSString *)aText
                           andDetailTex:(NSString *)aDetail
                           andDateTex:(NSString *)aDate;


@end
