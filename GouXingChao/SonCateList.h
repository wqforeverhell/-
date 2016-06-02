//
//  SonCateList.h
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SonCateList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double sonCateListIdentifier;
@property (nonatomic, assign) double parentId;
@property (nonatomic, strong) NSString *cateName;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *picUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
