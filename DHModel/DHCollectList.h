//
//  DHCollectList.h
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DHCollectList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double updateTime;
@property (nonatomic, strong) NSString *userHeadUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
