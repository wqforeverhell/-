//
//  DHCommentList.h
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DHCommentList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *showTime;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) double commentUserId;
@property (nonatomic, strong) NSString *commentUserHeadImgUrl;
@property (nonatomic, assign) double commentTime;
@property (nonatomic, strong) NSString *commentUserName;
@property (nonatomic, assign) double groupId;
@property (nonatomic, assign) double commentId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
