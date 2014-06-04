//
//  RegisteredViewController.h
//  FutureDoor_end
//
//  Created by apple on 14-5-29.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisteredViewController : UIViewController<UITextFieldDelegate>

@property (strong,nonatomic) UITextField *numText;
@property (strong,nonatomic) UITextField *pwdText;
@property (strong,nonatomic) UITextField *secondPWD;
@property (strong,nonatomic) UITextField *cdkey;

@end
