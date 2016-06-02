//
//  DHProducts.h
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DHProducts : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double ttsProductId;
@property (nonatomic, strong) NSString *productImgUrl;
@property (nonatomic, assign) double likeStatus;
@property (nonatomic, assign) double sellCount;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, assign) double productId;
@property (nonatomic, strong) NSString *productUrl;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
