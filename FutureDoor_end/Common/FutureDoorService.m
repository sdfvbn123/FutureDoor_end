//
//  FutureDoorService.m
//  FutureDoor_end
//
//  Created by 席鹏飞 on 14-6-2.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "FutureDoorService.h"
#import "NetworkRequest.h"
#import "NetWorkConstants.h"
#import "ParseJson.h"
#import "JSON.h"
#import "ASIHTTPRequest.h"
#import "Context.h"

@interface FutureDoorService ()
{
    NSInteger _errorType;
}

- (void)sendRequestWithUrl:(NSString *)urlStr withType:(FDRequest)fdType;  // 发送请求及请求方式

@property (nonatomic,strong) NSString *errorUrl;

@end

@implementation FutureDoorService
@synthesize delegate;

static FutureDoorService *sharedFutureDoorService = nil;

+ (FutureDoorService *)sharedFutureDoorService
{
    @synchronized(self) {
        if(sharedFutureDoorService == nil){
            sharedFutureDoorService = [[FutureDoorService alloc] init];
        }
    }
    return sharedFutureDoorService;
}

// 首页请求
-(void)getHomePageData
{
    NSString *url = [URL_SERVICE_ADDRESS stringByAppendingString:@"/app/index.php"];
    [self sendRequestWithUrl:url withType:REQUEST_TYPE_JSON_HOME_PAGE];
}

//发送请求及请求方式
- (void)sendRequestWithUrl:(NSString *)urlStr withType:(FDRequest)fdType
{
    ASINetworkQueue *networkQueue = [NetworkRequest sharedNetworkRequest].networkQueue;
    [networkQueue cancelAllOperations];
    
    NSURL *url = [[NSURL alloc] initWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.tag = fdType;
    request.delegate = self;
    [request setTimeOutSeconds:CONNECTION_TIMEOUT_SEC];
    [request setShouldAttemptPersistentConnection:NO];
    [request setValidatesSecureCertificate:NO];
    [networkQueue addOperation:request];
    [networkQueue go];
    
    if (fdType  == REQUEST_TYPE_JSON_HOME_PAGE) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    }else{
        [Context showMBProgressHUD:@"加载中..." withParentView:nil];
    }
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    [Context hideMBProgressHUD:nil];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSString *aString = [request responseString];
    
    switch (request.tag) {
        case REQUEST_TYPE_JSON_HOME_PAGE://首页查询
        {
            ParseJson* paser = [[ParseJson alloc] init];
            NSArray* resultArray = [paser homePageResultsParseFromJson:aString];
            
            if(self.delegate&& [self.delegate respondsToSelector:@selector(getHomePageDataResult:)])
            {
                [self.delegate getHomePageDataResult:resultArray];
            }
        }
            break;
        default:
            break;
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"requestFailed:%@",[request error]);
    
    self.errorUrl = [request.url absoluteString];
    _errorType = request.tag;
    [Context hideMBProgressHUD:nil];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    switch (request.tag) {

        default:
            break;
    }
    
    NSString *netErr = @"请求失败";
    switch ([[request error] code]) {
        case ASIConnectionFailureErrorType:
            netErr = @"网络连接失败";
            break;
        case ASIRequestTimedOutErrorType:
            netErr = @"请求超时";
            break;
            //        case ASIRequestCancelledErrorType:
            //            netErr = @"网络取消";
            //            break;
        default:
            break;
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:netErr delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"重试", nil];
    [alertView show];
}

#pragma mark - UIAlertViewDelegate method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
    }else{
        // 发送数据请求
        [self sendRequestWithUrl:self.errorUrl withType:_errorType];
    }
}

@end
