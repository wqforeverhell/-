//
//  DHBaseClass.h
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DHGroupImgs;

@interface DHBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) DHGroupImgs *groupImgs;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
