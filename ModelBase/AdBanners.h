//
//  AdBanners.h
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AdBanners : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double bannersIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *bannerUrl;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *bannerImgUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
