//
//  DetailDataList.h
//
//  Created by Mac  on 14-11-5
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DetailDataList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double imgHeight;
@property (nonatomic, assign) double salesNum;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *promoPrice;
@property (nonatomic, assign) double ttsId;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, assign) double sourceId;
@property (nonatomic, assign) double isTop;
@property (nonatomic, assign) double randomId;
@property (nonatomic, assign) double imgWidth;
@property (nonatomic, assign) double likeType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
