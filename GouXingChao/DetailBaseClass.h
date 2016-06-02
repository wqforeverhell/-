//
//  DetailBaseClass.h
//
//  Created by Mac  on 14-11-5
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DetailBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double pageCount;
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) NSString *page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
