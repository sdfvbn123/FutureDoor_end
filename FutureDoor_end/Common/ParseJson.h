//
//  ParseJson.h
//  FutureDoor_end
//
//  Created by 席鹏飞 on 14-6-2.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseJson : NSObject

#pragma mark - 首页
//首页解析
-(NSArray*) homePageResultsParseFromJson:(NSString*) jsonString;

@end
