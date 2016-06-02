//
//  DWBaseClass.h
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DWBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double page;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, assign) double pageCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
