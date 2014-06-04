//
//  Context.m
//  FutureDoor_end
//
//  Created by 席鹏飞 on 14-6-2.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "Context.h"
#import "ASIHTTPRequest.h"
#import "MBProgressHUD.h"
@implementation Context
@synthesize homeWindow;

static Context* shareContext;

+(Context*) shareContext{
    @synchronized(self) {
        if(shareContext == nil){
            shareContext = [[self alloc] init];
        }
    }
    return shareContext;
}

//显示滚动提示框
+ (void)showMBProgressHUD:(NSString *)title withParentView:(UIView *)view
{
    UIView *abc = [Context shareContext].homeWindow;
    
    [MBProgressHUD showHUDAddedTo:abc withTitle:title animated:YES];
    
}


//隐藏滚动提示框
+ (void)hideMBProgressHUD:(UIView *)view
{
    UIView *abc = [Context shareContext].homeWindow;
    
    [MBProgressHUD hideHUDForView:abc animated:YES];
}
@end
