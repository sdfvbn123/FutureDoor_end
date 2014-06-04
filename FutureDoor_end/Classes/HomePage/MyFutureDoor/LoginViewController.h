//
//  LoginViewController.h
//  FutureDoor_end
//
//  Created by apple on 14-5-20.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "ModifyViewController.h"
#import "AddressViewController.h"
#import "MyOrderViewController.h"

@interface LoginViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIActionSheetDelegate>

@property (strong,nonatomic) UIImageView *headImage;
@property (strong,nonatomic) UITextField *textField;
@property (strong,nonatomic) UIImageView *sexImage;
//图片选取器
@property (strong, nonatomic) UIImagePickerController *imagePickerController;
//照相机提示
@property ( nonatomic) BOOL isOK;
@end
