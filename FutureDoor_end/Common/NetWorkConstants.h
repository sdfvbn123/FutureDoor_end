//
//  NetWorkConstants.h
//  FutureDoor_end
//
//  Created by 席鹏飞 on 14-6-2.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#ifndef FutureDoor_end_NetWorkConstants_h
#define FutureDoor_end_NetWorkConstants_h

#import <Foundation/Foundation.h>

typedef enum {
    REQUEST_TYPE_JSON_HOME_PAGE = 100,//首页查询
    
}FDRequest;

#define NOTIFICATION_TYPE_PROGRESS_STOPNETWORKREQUEST @"cancelNetworkRequest" //取消网络请求

#define CONNECTION_TIMEOUT_SEC 20.0  // 网络超时时间


#endif

