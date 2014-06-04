//
//  Context.h
//  FutureDoor_end
//
//  Created by 席鹏飞 on 14-6-2.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Context : NSObject

@property (nonatomic,assign) UIWindow *homeWindow;

//获取工具对象
+(Context*) shareContext;

//显示状态提示框
+(void) showMBProgressHUD:(NSString *)title withParentView:(UIView *)view;

//隐藏状态提示框
+(void) hideMBProgressHUD:(UIView *)view;

@end
