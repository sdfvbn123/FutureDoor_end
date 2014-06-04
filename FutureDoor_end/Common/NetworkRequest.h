//
//  NetworkRequest.h
//  FutureDoor_end
//
//  Created by 席鹏飞 on 14-6-2.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASINetworkQueue.h"

@interface NetworkRequest : NSObject

+ (NetworkRequest *)sharedNetworkRequest;

@property (nonatomic,strong,readonly) ASINetworkQueue *networkQueue;

@end
