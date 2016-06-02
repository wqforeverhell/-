//
//  MobileCategory.h
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MobileCategory : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double mobileCategoryIdentifier;
@property (nonatomic, strong) NSString *cateName;
@property (nonatomic, strong) NSArray *sonCateList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
