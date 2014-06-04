//
//  NetworkRequest.m
//  FutureDoor_end
//
//  Created by 席鹏飞 on 14-6-2.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "NetworkRequest.h"
#import "Context.h"
#import "NetWorkConstants.h"

static NetworkRequest *networkRequest = nil;

@interface NetworkRequest ()

@property (nonatomic,strong,readwrite) ASINetworkQueue *networkQueue;

@end


@implementation NetworkRequest

+ (NetworkRequest *)sharedNetworkRequest
{
    if (!networkRequest) {
        networkRequest = [[NetworkRequest alloc] init];
    }
    return networkRequest;
}

- (id)init
{
	if (self = [super init]) {
        _networkQueue = [[ASINetworkQueue alloc] init];
        [_networkQueue setShouldCancelAllRequestsOnFailure:NO];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancelProgressNetworkRequest) name:NOTIFICATION_TYPE_PROGRESS_STOPNETWORKREQUEST object:nil];
    }
	return self;
}

- (void)cancelProgressNetworkRequest
{
    [Context hideMBProgressHUD:nil];
    [_networkQueue cancelAllOperations];
}

@end
