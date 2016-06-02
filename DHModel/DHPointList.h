//
//  DHPointList.h
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DHPointList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *pointX;
@property (nonatomic, strong) NSString *pointDesc;
@property (nonatomic, strong) NSString *pointY;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
