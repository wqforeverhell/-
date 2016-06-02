//
//  AdBaseClass.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "AdBaseClass.h"
#import "AdBanners.h"


NSString *const kAdBaseClassBanners = @"banners";


@interface AdBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AdBaseClass

@synthesize banners = _banners;


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
    NSObject *receivedAdBanners = [dict objectForKey:kAdBaseClassBanners];
    NSMutableArray *parsedAdBanners = [NSMutableArray array];
    if ([receivedAdBanners isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAdBanners) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAdBanners addObject:[AdBanners modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAdBanners isKindOfClass:[NSDictionary class]]) {
       [parsedAdBanners addObject:[AdBanners modelObjectWithDictionary:(NSDictionary *)receivedAdBanners]];
    }

    self.banners = [NSArray arrayWithArray:parsedAdBanners];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForBanners = [NSMutableArray array];
    for (NSObject *subArrayObject in self.banners) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBanners addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBanners addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBanners] forKey:kAdBaseClassBanners];

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

    self.banners = [aDecoder decodeObjectForKey:kAdBaseClassBanners];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_banners forKey:kAdBaseClassBanners];
}

- (id)copyWithZone:(NSZone *)zone
{
    AdBaseClass *copy = [[AdBaseClass alloc] init];
    
    if (copy) {

        copy.banners = [self.banners copyWithZone:zone];
    }
    
    return copy;
}


@end
