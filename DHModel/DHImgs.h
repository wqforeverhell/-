//
//  DHImgs.h
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DHImgs : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, assign) double imgHeight;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) NSArray *pointList;
@property (nonatomic, assign) double imgWidth;
@property (nonatomic, strong) NSArray *requestUsers;
@property (nonatomic, assign) double imgId;
@property (nonatomic, strong) NSString *imgDesc;
@property (nonatomic, assign) double jobId;
@property (nonatomic, assign) double isValid;
@property (nonatomic, strong) NSArray *thumImgs;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
