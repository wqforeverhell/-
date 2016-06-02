//
//  ZYEngine.h
//  GouXingChao
//
//  Created by Mac on 14-11-3.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModels.h"
#import "AFNetworking.h"
@interface ZYEngine : NSObject
+(void)getAdMessage:(void(^)(NSMutableArray * array))complete;
+(void)getTextMessage:(int)page :(void(^)(NSMutableArray *array))complete;
+(void)getCenterTextMessage:(int)page :(void(^)(NSMutableArray *array))complete;
+(void)getRightTextMessage:(int)page :(void(^)(NSMutableArray *array))complete;
//+(void)getDLeftTextMessage:(int)page :(void(^)(NSMutableArray *array))complete;
+(void)getDLeftTextMessage:(int)page  withType:(int)type   :(void(^)(NSMutableArray *array))complete;
+(void)getDCenterTextMessage:(int)page :(void(^)(NSMutableArray *array))complete;
+(void)getDRightTextMessage:(int)page :(void(^)(NSMutableArray *array))complete;
+(void)getBJTextMessage:(float)groupId  withType:(int)type   :(void(^)(NSMutableArray *array))complete;
@end
