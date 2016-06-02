//
//  DHCollectList.m
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DHCollectList.h"


NSString *const kDHCollectListUserName = @"userName";
NSString *const kDHCollectListUserId = @"userId";
NSString *const kDHCollectListUpdateTime = @"updateTime";
NSString *const kDHCollectListUserHeadUrl = @"userHeadUrl";


@interface DHCollectList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DHCollectList

@synthesize userName = _userName;
@synthesize userId = _userId;
@synthesize updateTime = _updateTime;
@synthesize userHeadUrl = _userHeadUrl;


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
            self.userName = [self objectOrNilForKey:kDHCollectListUserName fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kDHCollectListUserId fromDictionary:dict] doubleValue];
            self.updateTime = [[self objectOrNilForKey:kDHCollectListUpdateTime fromDictionary:dict] doubleValue];
            self.userHeadUrl = [self objectOrNilForKey:kDHCollectListUserHeadUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userName forKey:kDHCollectListUserName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kDHCollectListUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updateTime] forKey:kDHCollectListUpdateTime];
    [mutableDict setValue:self.userHeadUrl forKey:kDHCollectListUserHeadUrl];

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

    self.userName = [aDecoder decodeObjectForKey:kDHCollectListUserName];
    self.userId = [aDecoder decodeDoubleForKey:kDHCollectListUserId];
    self.updateTime = [aDecoder decodeDoubleForKey:kDHCollectListUpdateTime];
    self.userHeadUrl = [aDecoder decodeObjectForKey:kDHCollectListUserHeadUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userName forKey:kDHCollectListUserName];
    [aCoder encodeDouble:_userId forKey:kDHCollectListUserId];
    [aCoder encodeDouble:_updateTime forKey:kDHCollectListUpdateTime];
    [aCoder encodeObject:_userHeadUrl forKey:kDHCollectListUserHeadUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    DHCollectList *copy = [[DHCollectList alloc] init];
    
    if (copy) {

        copy.userName = [self.userName copyWithZone:zone];
        copy.userId = self.userId;
        copy.updateTime = self.updateTime;
        copy.userHeadUrl = [self.userHeadUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
