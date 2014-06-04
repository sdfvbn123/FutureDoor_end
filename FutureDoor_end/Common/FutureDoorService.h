//
//  FutureDoorService.h
//  FutureDoor_end
//
//  Created by 席鹏飞 on 14-6-2.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FutureDoorServiceDelegate <NSObject>
@optional
//得到首页数据
- (void)getHomePageDataResult:(NSArray*) homeArray;

@end

@interface FutureDoorService : NSObject<UIAlertViewDelegate>

@property (nonatomic,weak) id<FutureDoorServiceDelegate> delegate;

+ (FutureDoorService *)sharedFutureDoorService;

/* 首页 */
- (void)getHomePageData;  // 首页请求

@end
