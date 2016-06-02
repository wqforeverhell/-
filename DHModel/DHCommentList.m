//
//  DHCommentList.m
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DHCommentList.h"


NSString *const kDHCommentListShowTime = @"showTime";
NSString *const kDHCommentListContent = @"content";
NSString *const kDHCommentListCommentUserId = @"commentUserId";
NSString *const kDHCommentListCommentUserHeadImgUrl = @"commentUserHeadImgUrl";
NSString *const kDHCommentListCommentTime = @"commentTime";
NSString *const kDHCommentListCommentUserName = @"commentUserName";
NSString *const kDHCommentListGroupId = @"groupId";
NSString *const kDHCommentListCommentId = @"commentId";


@interface DHCommentList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DHCommentList

@synthesize showTime = _showTime;
@synthesize content = _content;
@synthesize commentUserId = _commentUserId;
@synthesize commentUserHeadImgUrl = _commentUserHeadImgUrl;
@synthesize commentTime = _commentTime;
@synthesize commentUserName = _commentUserName;
@synthesize groupId = _groupId;
@synthesize commentId = _commentId;


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
            self.showTime = [self objectOrNilForKey:kDHCommentListShowTime fromDictionary:dict];
            self.content = [self objectOrNilForKey:kDHCommentListContent fromDictionary:dict];
            self.commentUserId = [[self objectOrNilForKey:kDHCommentListCommentUserId fromDictionary:dict] doubleValue];
            self.commentUserHeadImgUrl = [self objectOrNilForKey:kDHCommentListCommentUserHeadImgUrl fromDictionary:dict];
            self.commentTime = [[self objectOrNilForKey:kDHCommentListCommentTime fromDictionary:dict] doubleValue];
            self.commentUserName = [self objectOrNilForKey:kDHCommentListCommentUserName fromDictionary:dict];
            self.groupId = [[self objectOrNilForKey:kDHCommentListGroupId fromDictionary:dict] doubleValue];
            self.commentId = [[self objectOrNilForKey:kDHCommentListCommentId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.showTime forKey:kDHCommentListShowTime];
    [mutableDict setValue:self.content forKey:kDHCommentListContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentUserId] forKey:kDHCommentListCommentUserId];
    [mutableDict setValue:self.commentUserHeadImgUrl forKey:kDHCommentListCommentUserHeadImgUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentTime] forKey:kDHCommentListCommentTime];
    [mutableDict setValue:self.commentUserName forKey:kDHCommentListCommentUserName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupId] forKey:kDHCommentListGroupId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentId] forKey:kDHCommentListCommentId];

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

    self.showTime = [aDecoder decodeObjectForKey:kDHCommentListShowTime];
    self.content = [aDecoder decodeObjectForKey:kDHCommentListContent];
    self.commentUserId = [aDecoder decodeDoubleForKey:kDHCommentListCommentUserId];
    self.commentUserHeadImgUrl = [aDecoder decodeObjectForKey:kDHCommentListCommentUserHeadImgUrl];
    self.commentTime = [aDecoder decodeDoubleForKey:kDHCommentListCommentTime];
    self.commentUserName = [aDecoder decodeObjectForKey:kDHCommentListCommentUserName];
    self.groupId = [aDecoder decodeDoubleForKey:kDHCommentListGroupId];
    self.commentId = [aDecoder decodeDoubleForKey:kDHCommentListCommentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_showTime forKey:kDHCommentListShowTime];
    [aCoder encodeObject:_content forKey:kDHCommentListContent];
    [aCoder encodeDouble:_commentUserId forKey:kDHCommentListCommentUserId];
    [aCoder encodeObject:_commentUserHeadImgUrl forKey:kDHCommentListCommentUserHeadImgUrl];
    [aCoder encodeDouble:_commentTime forKey:kDHCommentListCommentTime];
    [aCoder encodeObject:_commentUserName forKey:kDHCommentListCommentUserName];
    [aCoder encodeDouble:_groupId forKey:kDHCommentListGroupId];
    [aCoder encodeDouble:_commentId forKey:kDHCommentListCommentId];
}

- (id)copyWithZone:(NSZone *)zone
{
    DHCommentList *copy = [[DHCommentList alloc] init];
    
    if (copy) {

        copy.showTime = [self.showTime copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.commentUserId = self.commentUserId;
        copy.commentUserHeadImgUrl = [self.commentUserHeadImgUrl copyWithZone:zone];
        copy.commentTime = self.commentTime;
        copy.commentUserName = [self.commentUserName copyWithZone:zone];
        copy.groupId = self.groupId;
        copy.commentId = self.commentId;
    }
    
    return copy;
}


@end
