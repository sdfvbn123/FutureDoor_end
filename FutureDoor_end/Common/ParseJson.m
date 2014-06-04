//
//  ParseJson.m
//  FutureDoor_end
//
//  Created by 席鹏飞 on 14-6-2.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "ParseJson.h"
#import "JSON.h"

@implementation ParseJson

#pragma mark - 首页
//首页解析
-(NSArray*) homePageResultsParseFromJson:(NSString*) jsonString
{
    NSDictionary *jsonValue = [jsonString JSONValue];
    
    if (jsonValue == nil) {
        return nil;
    }else{
        if ([[jsonValue objectForKey:@"code"] intValue] != 1) {
            return nil;
        }
    }
    
    NSArray *dataArray = [jsonValue objectForKey:@"list"];
    
    return dataArray;
}

@end
