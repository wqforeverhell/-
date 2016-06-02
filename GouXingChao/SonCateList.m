//
//  SonCateList.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "SonCateList.h"


NSString *const kSonCateListId = @"id";
NSString *const kSonCateListParentId = @"parentId";
NSString *const kSonCateListCateName = @"cateName";
NSString *const kSonCateListType = @"type";
NSString *const kSonCateListPicUrl = @"picUrl";


@interface SonCateList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SonCateList

@synthesize sonCateListIdentifier = _sonCateListIdentifier;
@synthesize parentId = _parentId;
@synthesize cateName = _cateName;
@synthesize type = _type;
@synthesize picUrl = _picUrl;


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
            self.sonCateListIdentifier = [[self objectOrNilForKey:kSonCateListId fromDictionary:dict] doubleValue];
            self.parentId = [[self objectOrNilForKey:kSonCateListParentId fromDictionary:dict] doubleValue];
            self.cateName = [self objectOrNilForKey:kSonCateListCateName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kSonCateListType fromDictionary:dict] doubleValue];
            self.picUrl = [self objectOrNilForKey:kSonCateListPicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sonCateListIdentifier] forKey:kSonCateListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:kSonCateListParentId];
    [mutableDict setValue:self.cateName forKey:kSonCateListCateName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kSonCateListType];
    [mutableDict setValue:self.picUrl forKey:kSonCateListPicUrl];

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

    self.sonCateListIdentifier = [aDecoder decodeDoubleForKey:kSonCateListId];
    self.parentId = [aDecoder decodeDoubleForKey:kSonCateListParentId];
    self.cateName = [aDecoder decodeObjectForKey:kSonCateListCateName];
    self.type = [aDecoder decodeDoubleForKey:kSonCateListType];
    self.picUrl = [aDecoder decodeObjectForKey:kSonCateListPicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_sonCateListIdentifier forKey:kSonCateListId];
    [aCoder encodeDouble:_parentId forKey:kSonCateListParentId];
    [aCoder encodeObject:_cateName forKey:kSonCateListCateName];
    [aCoder encodeDouble:_type forKey:kSonCateListType];
    [aCoder encodeObject:_picUrl forKey:kSonCateListPicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    SonCateList *copy = [[SonCateList alloc] init];
    
    if (copy) {

        copy.sonCateListIdentifier = self.sonCateListIdentifier;
        copy.parentId = self.parentId;
        copy.cateName = [self.cateName copyWithZone:zone];
        copy.type = self.type;
        copy.picUrl = [self.picUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
