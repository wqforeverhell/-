//
//  DHGroupImgs.m
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DHGroupImgs.h"
#import "DHCollectList.h"
#import "DHCommentList.h"
#import "DHImgs.h"


NSString *const kDHGroupImgsFocusId = @"focusId";
NSString *const kDHGroupImgsPraiseCount = @"praiseCount";
NSString *const kDHGroupImgsGroupId = @"groupId";
NSString *const kDHGroupImgsShowTime = @"showTime";
NSString *const kDHGroupImgsFocusHeadImgUrl = @"focusHeadImgUrl";
NSString *const kDHGroupImgsCollectList = @"collectList";
NSString *const kDHGroupImgsCollectCount = @"collectCount";
NSString *const kDHGroupImgsIsFocus = @"isFocus";
NSString *const kDHGroupImgsCommentCount = @"commentCount";
NSString *const kDHGroupImgsCommentList = @"commentList";
NSString *const kDHGroupImgsGroupName = @"groupName";
NSString *const kDHGroupImgsCollectStatus = @"collectStatus";
NSString *const kDHGroupImgsFocusName = @"focusName";
NSString *const kDHGroupImgsImgs = @"imgs";
NSString *const kDHGroupImgsPraiseStatus = @"praiseStatus";


@interface DHGroupImgs ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DHGroupImgs

@synthesize focusId = _focusId;
@synthesize praiseCount = _praiseCount;
@synthesize groupId = _groupId;
@synthesize showTime = _showTime;
@synthesize focusHeadImgUrl = _focusHeadImgUrl;
@synthesize collectList = _collectList;
@synthesize collectCount = _collectCount;
@synthesize isFocus = _isFocus;
@synthesize commentCount = _commentCount;
@synthesize commentList = _commentList;
@synthesize groupName = _groupName;
@synthesize collectStatus = _collectStatus;
@synthesize focusName = _focusName;
@synthesize imgs = _imgs;
@synthesize praiseStatus = _praiseStatus;


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
            self.focusId = [[self objectOrNilForKey:kDHGroupImgsFocusId fromDictionary:dict] doubleValue];
            self.praiseCount = [[self objectOrNilForKey:kDHGroupImgsPraiseCount fromDictionary:dict] doubleValue];
            self.groupId = [[self objectOrNilForKey:kDHGroupImgsGroupId fromDictionary:dict] doubleValue];
            self.showTime = [self objectOrNilForKey:kDHGroupImgsShowTime fromDictionary:dict];
            self.focusHeadImgUrl = [self objectOrNilForKey:kDHGroupImgsFocusHeadImgUrl fromDictionary:dict];
    NSObject *receivedDHCollectList = [dict objectForKey:kDHGroupImgsCollectList];
    NSMutableArray *parsedDHCollectList = [NSMutableArray array];
    if ([receivedDHCollectList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDHCollectList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDHCollectList addObject:[DHCollectList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDHCollectList isKindOfClass:[NSDictionary class]]) {
       [parsedDHCollectList addObject:[DHCollectList modelObjectWithDictionary:(NSDictionary *)receivedDHCollectList]];
    }

    self.collectList = [NSArray arrayWithArray:parsedDHCollectList];
            self.collectCount = [[self objectOrNilForKey:kDHGroupImgsCollectCount fromDictionary:dict] doubleValue];
            self.isFocus = [[self objectOrNilForKey:kDHGroupImgsIsFocus fromDictionary:dict] doubleValue];
            self.commentCount = [[self objectOrNilForKey:kDHGroupImgsCommentCount fromDictionary:dict] doubleValue];
    NSObject *receivedDHCommentList = [dict objectForKey:kDHGroupImgsCommentList];
    NSMutableArray *parsedDHCommentList = [NSMutableArray array];
    if ([receivedDHCommentList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDHCommentList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDHCommentList addObject:[DHCommentList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDHCommentList isKindOfClass:[NSDictionary class]]) {
       [parsedDHCommentList addObject:[DHCommentList modelObjectWithDictionary:(NSDictionary *)receivedDHCommentList]];
    }

    self.commentList = [NSArray arrayWithArray:parsedDHCommentList];
            self.groupName = [self objectOrNilForKey:kDHGroupImgsGroupName fromDictionary:dict];
            self.collectStatus = [[self objectOrNilForKey:kDHGroupImgsCollectStatus fromDictionary:dict] doubleValue];
            self.focusName = [self objectOrNilForKey:kDHGroupImgsFocusName fromDictionary:dict];
    NSObject *receivedDHImgs = [dict objectForKey:kDHGroupImgsImgs];
    NSMutableArray *parsedDHImgs = [NSMutableArray array];
    if ([receivedDHImgs isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDHImgs) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDHImgs addObject:[DHImgs modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDHImgs isKindOfClass:[NSDictionary class]]) {
       [parsedDHImgs addObject:[DHImgs modelObjectWithDictionary:(NSDictionary *)receivedDHImgs]];
    }

    self.imgs = [NSArray arrayWithArray:parsedDHImgs];
            self.praiseStatus = [[self objectOrNilForKey:kDHGroupImgsPraiseStatus fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.focusId] forKey:kDHGroupImgsFocusId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.praiseCount] forKey:kDHGroupImgsPraiseCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupId] forKey:kDHGroupImgsGroupId];
    [mutableDict setValue:self.showTime forKey:kDHGroupImgsShowTime];
    [mutableDict setValue:self.focusHeadImgUrl forKey:kDHGroupImgsFocusHeadImgUrl];
    NSMutableArray *tempArrayForCollectList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.collectList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCollectList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCollectList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCollectList] forKey:kDHGroupImgsCollectList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.collectCount] forKey:kDHGroupImgsCollectCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFocus] forKey:kDHGroupImgsIsFocus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:kDHGroupImgsCommentCount];
    NSMutableArray *tempArrayForCommentList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.commentList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCommentList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCommentList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCommentList] forKey:kDHGroupImgsCommentList];
    [mutableDict setValue:self.groupName forKey:kDHGroupImgsGroupName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.collectStatus] forKey:kDHGroupImgsCollectStatus];
    [mutableDict setValue:self.focusName forKey:kDHGroupImgsFocusName];
    NSMutableArray *tempArrayForImgs = [NSMutableArray array];
    for (NSObject *subArrayObject in self.imgs) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImgs addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImgs addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImgs] forKey:kDHGroupImgsImgs];
    [mutableDict setValue:[NSNumber numberWithDouble:self.praiseStatus] forKey:kDHGroupImgsPraiseStatus];

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

    self.focusId = [aDecoder decodeDoubleForKey:kDHGroupImgsFocusId];
    self.praiseCount = [aDecoder decodeDoubleForKey:kDHGroupImgsPraiseCount];
    self.groupId = [aDecoder decodeDoubleForKey:kDHGroupImgsGroupId];
    self.showTime = [aDecoder decodeObjectForKey:kDHGroupImgsShowTime];
    self.focusHeadImgUrl = [aDecoder decodeObjectForKey:kDHGroupImgsFocusHeadImgUrl];
    self.collectList = [aDecoder decodeObjectForKey:kDHGroupImgsCollectList];
    self.collectCount = [aDecoder decodeDoubleForKey:kDHGroupImgsCollectCount];
    self.isFocus = [aDecoder decodeDoubleForKey:kDHGroupImgsIsFocus];
    self.commentCount = [aDecoder decodeDoubleForKey:kDHGroupImgsCommentCount];
    self.commentList = [aDecoder decodeObjectForKey:kDHGroupImgsCommentList];
    self.groupName = [aDecoder decodeObjectForKey:kDHGroupImgsGroupName];
    self.collectStatus = [aDecoder decodeDoubleForKey:kDHGroupImgsCollectStatus];
    self.focusName = [aDecoder decodeObjectForKey:kDHGroupImgsFocusName];
    self.imgs = [aDecoder decodeObjectForKey:kDHGroupImgsImgs];
    self.praiseStatus = [aDecoder decodeDoubleForKey:kDHGroupImgsPraiseStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_focusId forKey:kDHGroupImgsFocusId];
    [aCoder encodeDouble:_praiseCount forKey:kDHGroupImgsPraiseCount];
    [aCoder encodeDouble:_groupId forKey:kDHGroupImgsGroupId];
    [aCoder encodeObject:_showTime forKey:kDHGroupImgsShowTime];
    [aCoder encodeObject:_focusHeadImgUrl forKey:kDHGroupImgsFocusHeadImgUrl];
    [aCoder encodeObject:_collectList forKey:kDHGroupImgsCollectList];
    [aCoder encodeDouble:_collectCount forKey:kDHGroupImgsCollectCount];
    [aCoder encodeDouble:_isFocus forKey:kDHGroupImgsIsFocus];
    [aCoder encodeDouble:_commentCount forKey:kDHGroupImgsCommentCount];
    [aCoder encodeObject:_commentList forKey:kDHGroupImgsCommentList];
    [aCoder encodeObject:_groupName forKey:kDHGroupImgsGroupName];
    [aCoder encodeDouble:_collectStatus forKey:kDHGroupImgsCollectStatus];
    [aCoder encodeObject:_focusName forKey:kDHGroupImgsFocusName];
    [aCoder encodeObject:_imgs forKey:kDHGroupImgsImgs];
    [aCoder encodeDouble:_praiseStatus forKey:kDHGroupImgsPraiseStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    DHGroupImgs *copy = [[DHGroupImgs alloc] init];
    
    if (copy) {

        copy.focusId = self.focusId;
        copy.praiseCount = self.praiseCount;
        copy.groupId = self.groupId;
        copy.showTime = [self.showTime copyWithZone:zone];
        copy.focusHeadImgUrl = [self.focusHeadImgUrl copyWithZone:zone];
        copy.collectList = [self.collectList copyWithZone:zone];
        copy.collectCount = self.collectCount;
        copy.isFocus = self.isFocus;
        copy.commentCount = self.commentCount;
        copy.commentList = [self.commentList copyWithZone:zone];
        copy.groupName = [self.groupName copyWithZone:zone];
        copy.collectStatus = self.collectStatus;
        copy.focusName = [self.focusName copyWithZone:zone];
        copy.imgs = [self.imgs copyWithZone:zone];
        copy.praiseStatus = self.praiseStatus;
    }
    
    return copy;
}


@end
