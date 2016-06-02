//
//  DLBaseClass.h
//
//  Created by Mac  on 14-11-5
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DLBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *imgGroups;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
