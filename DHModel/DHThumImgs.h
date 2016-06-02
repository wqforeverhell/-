//
//  DHThumImgs.h
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DHThumImgs : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *thumImgUrl;
@property (nonatomic, strong) NSArray *products;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
