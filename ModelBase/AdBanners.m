//
//  AdBanners.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "AdBanners.h"


NSString *const kAdBannersId = @"id";
NSString *const kAdBannersTitle = @"title";
NSString *const kAdBannersBannerUrl = @"bannerUrl";
NSString *const kAdBannersShareUrl = @"shareUrl";
NSString *const kAdBannersType = @"type";
NSString *const kAdBannersBannerImgUrl = @"bannerImgUrl";


@interface AdBanners ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AdBanners

@synthesize bannersIdentifier = _bannersIdentifier;
@synthesize title = _title;
@synthesize bannerUrl = _bannerUrl;
@synthesize shareUrl = _shareUrl;
@synthesize type = _type;
@synthesize bannerImgUrl = _bannerImgUrl;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.bannersIdentifier = [[self objectOrNilForKey:kAdBannersId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kAdBannersTitle fromDictionary:dict];
            self.bannerUrl = [self objectOrNilForKey:kAdBannersBannerUrl fromDictionary:dict];
            self.shareUrl = [self objectOrNilForKey:kAdBannersShareUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kAdBannersType fromDictionary:dict];
            self.bannerImgUrl = [self objectOrNilForKey:kAdBannersBannerImgUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bannersIdentifier] forKey:kAdBannersId];
    [mutableDict setValue:self.title forKey:kAdBannersTitle];
    [mutableDict setValue:self.bannerUrl forKey:kAdBannersBannerUrl];
    [mutableDict setValue:self.shareUrl forKey:kAdBannersShareUrl];
    [mutableDict setValue:self.type forKey:kAdBannersType];
    [mutableDict setValue:self.bannerImgUrl forKey:kAdBannersBannerImgUrl];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.bannersIdentifier = [aDecoder decodeDoubleForKey:kAdBannersId];
    self.title = [aDecoder decodeObjectForKey:kAdBannersTitle];
    self.bannerUrl = [aDecoder decodeObjectForKey:kAdBannersBannerUrl];
    self.shareUrl = [aDecoder decodeObjectForKey:kAdBannersShareUrl];
    self.type = [aDecoder decodeObjectForKey:kAdBannersType];
    self.bannerImgUrl = [aDecoder decodeObjectForKey:kAdBannersBannerImgUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_bannersIdentifier forKey:kAdBannersId];
    [aCoder encodeObject:_title forKey:kAdBannersTitle];
    [aCoder encodeObject:_bannerUrl forKey:kAdBannersBannerUrl];
    [aCoder encodeObject:_shareUrl forKey:kAdBannersShareUrl];
    [aCoder encodeObject:_type forKey:kAdBannersType];
    [aCoder encodeObject:_bannerImgUrl forKey:kAdBannersBannerImgUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    AdBanners *copy = [[AdBanners alloc] init];
    
    if (copy) {

        copy.bannersIdentifier = self.bannersIdentifier;
        copy.title = [self.title copyWithZone:zone];
        copy.bannerUrl = [self.bannerUrl copyWithZone:zone];
        copy.shareUrl = [self.shareUrl copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.bannerImgUrl = [self.bannerImgUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
