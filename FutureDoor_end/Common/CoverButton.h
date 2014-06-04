//
//  CoverButton.h
//  FutureDoor_end
//
//  Created by 席鹏飞 on 14-5-31.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoverButton : UIViewController
{
    UIButton *coverBtn;
}
@property (nonatomic,strong) UIButton *coverBtn;
@property (nonatomic,strong) NSString *direction;
+ (CoverButton*)instance;
@end
