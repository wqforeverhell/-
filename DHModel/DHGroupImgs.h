//
//  DHGroupImgs.h
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DHGroupImgs : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double focusId;
@property (nonatomic, assign) double praiseCount;
@property (nonatomic, assign) double groupId;
@property (nonatomic, strong) NSString *showTime;
@property (nonatomic, strong) NSString *focusHeadImgUrl;
@property (nonatomic, strong) NSArray *collectList;
@property (nonatomic, assign) double collectCount;
@property (nonatomic, assign) double isFocus;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, strong) NSArray *commentList;
@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, assign) double collectStatus;
@property (nonatomic, strong) NSString *focusName;
@property (nonatomic, strong) NSArray *imgs;
@property (nonatomic, assign) double praiseStatus;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
