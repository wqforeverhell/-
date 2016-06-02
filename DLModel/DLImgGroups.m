//
//  DLImgGroups.m
//
//  Created by Mac  on 14-11-5
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DLImgGroups.h"


NSString *const kDLImgGroupsFocusId = @"focusId";
NSString *const kDLImgGroupsImgWidth = @"imgWidth";
NSString *const kDLImgGroupsLikeType = @"likeType";
NSString *const kDLImgGroupsDapeiCount = @"dapeiCount";
NSString *const kDLImgGroupsImgUrl = @"imgUrl";
NSString *const kDLImgGroupsFocusHeadImgUrl = @"focusHeadImgUrl";
NSString *const kDLImgGroupsLikeCount = @"likeCount";
NSString *const kDLImgGroupsDesc = @"desc";
NSString *const kDLImgGroupsImgId = @"imgId";
NSString *const kDLImgGroupsGroupId = @"groupId";
NSString *const kDLImgGroupsImgHeight = @"imgHeight";
NSString *const kDLImgGroupsFocusName = @"focusName";
NSString *const kDLImgGroupsUpdateTime = @"updateTime";


@interface DLImgGroups ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DLImgGroups

@synthesize focusId = _focusId;
@synthesize imgWidth = _imgWidth;
@synthesize likeType = _likeType;
@synthesize dapeiCount = _dapeiCount;
@synthesize imgUrl = _imgUrl;
@synthesize focusHeadImgUrl = _focusHeadImgUrl;
@synthesize likeCount = _likeCount;
@synthesize desc = _desc;
@synthesize imgId = _imgId;
@synthesize groupId = _groupId;
@synthesize imgHeight = _imgHeight;
@synthesize focusName = _focusName;
@synthesize updateTime = _updateTime;


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
            self.focusId = [[self objectOrNilForKey:kDLImgGroupsFocusId fromDictionary:dict] doubleValue];
            self.imgWidth = [[self objectOrNilForKey:kDLImgGroupsImgWidth fromDictionary:dict] doubleValue];
            self.likeType = [[self objectOrNilForKey:kDLImgGroupsLikeType fromDictionary:dict] doubleValue];
            self.dapeiCount = [[self objectOrNilForKey:kDLImgGroupsDapeiCount fromDictionary:dict] doubleValue];
            self.imgUrl = [self objectOrNilForKey:kDLImgGroupsImgUrl fromDictionary:dict];
            self.focusHeadImgUrl = [self objectOrNilForKey:kDLImgGroupsFocusHeadImgUrl fromDictionary:dict];
            self.likeCount = [[self objectOrNilForKey:kDLImgGroupsLikeCount fromDictionary:dict] doubleValue];
            self.desc = [self objectOrNilForKey:kDLImgGroupsDesc fromDictionary:dict];
            self.imgId = [[self objectOrNilForKey:kDLImgGroupsImgId fromDictionary:dict] doubleValue];
            self.groupId = [[self objectOrNilForKey:kDLImgGroupsGroupId fromDictionary:dict] doubleValue];
            self.imgHeight = [[self objectOrNilForKey:kDLImgGroupsImgHeight fromDictionary:dict] doubleValue];
            self.focusName = [self objectOrNilForKey:kDLImgGroupsFocusName fromDictionary:dict];
            self.updateTime = [[self objectOrNilForKey:kDLImgGroupsUpdateTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.focusId] forKey:kDLImgGroupsFocusId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgWidth] forKey:kDLImgGroupsImgWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeType] forKey:kDLImgGroupsLikeType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dapeiCount] forKey:kDLImgGroupsDapeiCount];
    [mutableDict setValue:self.imgUrl forKey:kDLImgGroupsImgUrl];
    [mutableDict setValue:self.focusHeadImgUrl forKey:kDLImgGroupsFocusHeadImgUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeCount] forKey:kDLImgGroupsLikeCount];
    [mutableDict setValue:self.desc forKey:kDLImgGroupsDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgId] forKey:kDLImgGroupsImgId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupId] forKey:kDLImgGroupsGroupId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgHeight] forKey:kDLImgGroupsImgHeight];
    [mutableDict setValue:self.focusName forKey:kDLImgGroupsFocusName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updateTime] forKey:kDLImgGroupsUpdateTime];

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

    self.focusId = [aDecoder decodeDoubleForKey:kDLImgGroupsFocusId];
    self.imgWidth = [aDecoder decodeDoubleForKey:kDLImgGroupsImgWidth];
    self.likeType = [aDecoder decodeDoubleForKey:kDLImgGroupsLikeType];
    self.dapeiCount = [aDecoder decodeDoubleForKey:kDLImgGroupsDapeiCount];
    self.imgUrl = [aDecoder decodeObjectForKey:kDLImgGroupsImgUrl];
    self.focusHeadImgUrl = [aDecoder decodeObjectForKey:kDLImgGroupsFocusHeadImgUrl];
    self.likeCount = [aDecoder decodeDoubleForKey:kDLImgGroupsLikeCount];
    self.desc = [aDecoder decodeObjectForKey:kDLImgGroupsDesc];
    self.imgId = [aDecoder decodeDoubleForKey:kDLImgGroupsImgId];
    self.groupId = [aDecoder decodeDoubleForKey:kDLImgGroupsGroupId];
    self.imgHeight = [aDecoder decodeDoubleForKey:kDLImgGroupsImgHeight];
    self.focusName = [aDecoder decodeObjectForKey:kDLImgGroupsFocusName];
    self.updateTime = [aDecoder decodeDoubleForKey:kDLImgGroupsUpdateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_focusId forKey:kDLImgGroupsFocusId];
    [aCoder encodeDouble:_imgWidth forKey:kDLImgGroupsImgWidth];
    [aCoder encodeDouble:_likeType forKey:kDLImgGroupsLikeType];
    [aCoder encodeDouble:_dapeiCount forKey:kDLImgGroupsDapeiCount];
    [aCoder encodeObject:_imgUrl forKey:kDLImgGroupsImgUrl];
    [aCoder encodeObject:_focusHeadImgUrl forKey:kDLImgGroupsFocusHeadImgUrl];
    [aCoder encodeDouble:_likeCount forKey:kDLImgGroupsLikeCount];
    [aCoder encodeObject:_desc forKey:kDLImgGroupsDesc];
    [aCoder encodeDouble:_imgId forKey:kDLImgGroupsImgId];
    [aCoder encodeDouble:_groupId forKey:kDLImgGroupsGroupId];
    [aCoder encodeDouble:_imgHeight forKey:kDLImgGroupsImgHeight];
    [aCoder encodeObject:_focusName forKey:kDLImgGroupsFocusName];
    [aCoder encodeDouble:_updateTime forKey:kDLImgGroupsUpdateTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    DLImgGroups *copy = [[DLImgGroups alloc] init];
    
    if (copy) {

        copy.focusId = self.focusId;
        copy.imgWidth = self.imgWidth;
        copy.likeType = self.likeType;
        copy.dapeiCount = self.dapeiCount;
        copy.imgUrl = [self.imgUrl copyWithZone:zone];
        copy.focusHeadImgUrl = [self.focusHeadImgUrl copyWithZone:zone];
        copy.likeCount = self.likeCount;
        copy.desc = [self.desc copyWithZone:zone];
        copy.imgId = self.imgId;
        copy.groupId = self.groupId;
        copy.imgHeight = self.imgHeight;
        copy.focusName = [self.focusName copyWithZone:zone];
        copy.updateTime = self.updateTime;
    }
    
    return copy;
}


@end
