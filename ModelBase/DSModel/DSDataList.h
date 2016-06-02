//
//  DSDataList.h
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DSDataList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataListIdentifier;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *title1;
@property (nonatomic, strong) NSString *lastTime;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *promoPrice;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double joinNum;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *overTime;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, assign) double auditStatus;
@property (nonatomic, assign) double imgHeight;
@property (nonatomic, strong) NSString *zhekou;
@property (nonatomic, assign) double imgWidth;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
