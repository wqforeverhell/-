//
//  DLImgGroups.h
//
//  Created by Mac  on 14-11-5
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DLImgGroups : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double focusId;
@property (nonatomic, assign) double imgWidth;
@property (nonatomic, assign) double likeType;
@property (nonatomic, assign) double dapeiCount;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *focusHeadImgUrl;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, assign) double imgId;
@property (nonatomic, assign) double groupId;
@property (nonatomic, assign) double imgHeight;
@property (nonatomic, strong) NSString *focusName;
@property (nonatomic, assign) double updateTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
