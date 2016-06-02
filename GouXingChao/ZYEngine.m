//
//  ZYEngine.m
//  GouXingChao
//
//  Created by Mac on 14-11-3.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ZYEngine.h"

@implementation ZYEngine
+(void)getAdMessage:(void(^)(NSMutableArray * array))complete;
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    NSMutableArray * array = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:@"http://service1.taotaosou.com/cms/getBanners.do?type=7" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         AdBaseClass * base = [AdBaseClass modelObjectWithDictionary:responseObject];
         NSArray * banners = base.banners;
         for (int i = 0;i<banners.count;i++)
         {
             AdBanners * banner = banners[i];
            // NSLog(@"====>%@",banner);
             [array addObject:banner];
             
         }
         if (complete)
         {
             //NSLog(@"====%@",array);
             complete(array);
         }
         
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"====++Error: %@", error);
     }];
}
+(void)getTextMessage:(int)page :(void(^)(NSMutableArray *array))complete
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:[NSString stringWithFormat:@"http://service1.taotaosou.com/appItemFallList.do?type=7&userId=6670550&page=%d",page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         BaseClass * base = [BaseClass modelObjectWithDictionary:responseObject];
         
         NSArray * listArray = base.dataList;
         for (int i = 0; i<listArray.count; i++)
         {
             DataList * list = listArray[i];
             
             if (list.imgHeight==0)
             {
                 continue;
             }
             
             [array addObject:list];
            // NSLog(@"====>%@",list);
         }
         if (complete)
         {
             complete(array);
         }
         
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"hahaha");
     }];
}
+(void)getCenterTextMessage:(int)page :(void(^)(NSMutableArray *array))complete
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:[NSString stringWithFormat:@"http://service1.taotaosou.com/appSalesList.do?type=1&userId=6670550&page=%d",page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         DSBaseClass * base = [DSBaseClass modelObjectWithDictionary:responseObject];
         
         NSArray * listArray = base.dataList;
         for (int i = 0; i<listArray.count; i++)
         {
             DSDataList * list = listArray[i];
             [array addObject:list];
             // NSLog(@"====>%@",list);
         }
         if (complete)
         {
             complete(array);
         }
         
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"hahaha");
     }];
}

+(void)getRightTextMessage:(int)page :(void(^)(NSMutableArray *array))complete
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:[NSString stringWithFormat:@"http://service1.taotaosou.com/appSalesList.do?type=2&userId=6670550&page=%d",page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         DWBaseClass * base = [DWBaseClass modelObjectWithDictionary:responseObject];
         
         NSArray * listArray = base.dataList;
         for (int i = 0; i<listArray.count; i++)
         {
             DWDataList * list = listArray[i];
             [array addObject:list];
             // NSLog(@"====>%@",list);
         }
         if (complete)
         {
             complete(array);
         }
         
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"hahaha");
     }];
}
+(void)getDLeftTextMessage:(int)page  withType:(int)type   :(void(^)(NSMutableArray *array))complete
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:[NSString stringWithFormat:@"http://service1.taotaosou.com/dapei.do?type=7&pageLimit=20&userId=6670550&dapeiType=%d&direction=0&requestTime=%d",type,page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         DLBaseClass * base = [DLBaseClass modelObjectWithDictionary:responseObject];
         
         NSArray * listArray = base.imgGroups;
         for (int i = 0; i<listArray.count; i++)
         {
             DLImgGroups * list = listArray[i];
             [array addObject:list];
            // NSLog(@"====>%@",list);
         }
         if (complete)
         {
             complete(array);
         }
         
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"hahaha");
     }];
}

+(void)getBJTextMessage:(float)groupId  withType:(int)type   :(void(^)(NSMutableArray *array))complete
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:[NSString stringWithFormat:@"http://service1.taotaosou.com/cms/25/imgDetail.do?requestType=%d&type=7&pageLimit=20&groupId=%.0f&userId=6670550&direction=1&requestTime=0",type,groupId] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         DHBaseClass * base = [DHBaseClass modelObjectWithDictionary:responseObject];
         
         NSArray * listArray = base.groupImgs.imgs;
         for (int i = 0; i<listArray.count; i++)
         {
             DHGroupImgs * list = listArray[i];
             [array addObject:list];
             // NSLog(@"====>%@",list);
         }
         if (complete)
         {
             complete(array);
         }
         
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"===hahaha");
     }];
}




@end
