//
//  DataList.h
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DataList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double imgWidth;
@property (nonatomic, assign) double likeType;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, assign) double ttsId;
@property (nonatomic, assign) double cId;
@property (nonatomic, strong) NSString *onlineTime;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, assign) double salesNum;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double isTop;
@property (nonatomic, assign) double randomId;
@property (nonatomic, assign) double cType;
@property (nonatomic, assign) double ztId;
@property (nonatomic, assign) double sourceId;
@property (nonatomic, strong) NSString *promoPrice;
@property (nonatomic, strong) NSString *adTitle;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, assign) double imgHeight;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
