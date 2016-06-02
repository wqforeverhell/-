//
//  DHBaseClass.m
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DHBaseClass.h"
#import "DHGroupImgs.h"


NSString *const kDHBaseClassGroupImgs = @"groupImgs";


@interface DHBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DHBaseClass

@synthesize groupImgs = _groupImgs;


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
            self.groupImgs = [DHGroupImgs modelObjectWithDictionary:[dict objectForKey:kDHBaseClassGroupImgs]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.groupImgs dictionaryRepresentation] forKey:kDHBaseClassGroupImgs];

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

    self.groupImgs = [aDecoder decodeObjectForKey:kDHBaseClassGroupImgs];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_groupImgs forKey:kDHBaseClassGroupImgs];
}

- (id)copyWithZone:(NSZone *)zone
{
    DHBaseClass *copy = [[DHBaseClass alloc] init];
    
    if (copy) {

        copy.groupImgs = [self.groupImgs copyWithZone:zone];
    }
    
    return copy;
}


@end
