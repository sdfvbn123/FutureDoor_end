//
//  MyFutureDoorViewController.h
//  Future_Door
//
//  Created by apple on 14-4-25.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "ForgetPWDViewController.h"
#import "LoginViewController.h"
#import "TabBarViewController.h"
#import "RegisteredViewController.h"
@interface MyFutureDoorViewController : UIViewController <UITextFieldDelegate>

@property (strong,nonatomic) UIImageView *myImageView;
@property (strong,nonatomic) UITextField *nameTextField;
@property (strong,nonatomic) UITextField *passwordTextField;
@property (strong,nonatomic) UIButton *downBtn;
@property (strong,nonatomic) UIView *nameView;
@property (strong,nonatomic) UIView *passwordView;

//@property (strong,nonatomic) TabBarViewController *tab;
@end
