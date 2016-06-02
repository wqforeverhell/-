//
//  BaseClass.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "FenLeiBaseClass.h"
#import "MobileCategory.h"


NSString *const kBaseClassMobileCategory = @"mobileCategory";


@interface FenLeiBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FenLeiBaseClass

@synthesize mobileCategory = _mobileCategory;


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
    NSObject *receivedMobileCategory = [dict objectForKey:kBaseClassMobileCategory];
    NSMutableArray *parsedMobileCategory = [NSMutableArray array];
    if ([receivedMobileCategory isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMobileCategory) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMobileCategory addObject:[MobileCategory modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMobileCategory isKindOfClass:[NSDictionary class]]) {
       [parsedMobileCategory addObject:[MobileCategory modelObjectWithDictionary:(NSDictionary *)receivedMobileCategory]];
    }

    self.mobileCategory = [NSArray arrayWithArray:parsedMobileCategory];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForMobileCategory = [NSMutableArray array];
    for (NSObject *subArrayObject in self.mobileCategory) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMobileCategory addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMobileCategory addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMobileCategory] forKey:kBaseClassMobileCategory];

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

    self.mobileCategory = [aDecoder decodeObjectForKey:kBaseClassMobileCategory];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_mobileCategory forKey:kBaseClassMobileCategory];
}

- (id)copyWithZone:(NSZone *)zone
{
    FenLeiBaseClass *copy = [[FenLeiBaseClass alloc] init];
    
    if (copy) {

        copy.mobileCategory = [self.mobileCategory copyWithZone:zone];
    }
    
    return copy;
}


@end
