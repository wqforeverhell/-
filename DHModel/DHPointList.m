//
//  DHPointList.m
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DHPointList.h"


NSString *const kDHPointListPointX = @"pointX";
NSString *const kDHPointListPointDesc = @"pointDesc";
NSString *const kDHPointListPointY = @"pointY";


@interface DHPointList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DHPointList

@synthesize pointX = _pointX;
@synthesize pointDesc = _pointDesc;
@synthesize pointY = _pointY;


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
            self.pointX = [self objectOrNilForKey:kDHPointListPointX fromDictionary:dict];
            self.pointDesc = [self objectOrNilForKey:kDHPointListPointDesc fromDictionary:dict];
            self.pointY = [self objectOrNilForKey:kDHPointListPointY fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pointX forKey:kDHPointListPointX];
    [mutableDict setValue:self.pointDesc forKey:kDHPointListPointDesc];
    [mutableDict setValue:self.pointY forKey:kDHPointListPointY];

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

    self.pointX = [aDecoder decodeObjectForKey:kDHPointListPointX];
    self.pointDesc = [aDecoder decodeObjectForKey:kDHPointListPointDesc];
    self.pointY = [aDecoder decodeObjectForKey:kDHPointListPointY];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pointX forKey:kDHPointListPointX];
    [aCoder encodeObject:_pointDesc forKey:kDHPointListPointDesc];
    [aCoder encodeObject:_pointY forKey:kDHPointListPointY];
}

- (id)copyWithZone:(NSZone *)zone
{
    DHPointList *copy = [[DHPointList alloc] init];
    
    if (copy) {

        copy.pointX = [self.pointX copyWithZone:zone];
        copy.pointDesc = [self.pointDesc copyWithZone:zone];
        copy.pointY = [self.pointY copyWithZone:zone];
    }
    
    return copy;
}


@end
