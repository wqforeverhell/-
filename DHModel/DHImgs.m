//
//  DHImgs.m
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DHImgs.h"
#import "DHPointList.h"
#import "DHThumImgs.h"


NSString *const kDHImgsImgUrl = @"imgUrl";
NSString *const kDHImgsImgHeight = @"imgHeight";
NSString *const kDHImgsShareUrl = @"shareUrl";
NSString *const kDHImgsPointList = @"pointList";
NSString *const kDHImgsImgWidth = @"imgWidth";
NSString *const kDHImgsRequestUsers = @"requestUsers";
NSString *const kDHImgsImgId = @"imgId";
NSString *const kDHImgsImgDesc = @"imgDesc";
NSString *const kDHImgsJobId = @"jobId";
NSString *const kDHImgsIsValid = @"isValid";
NSString *const kDHImgsThumImgs = @"thumImgs";


@interface DHImgs ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DHImgs

@synthesize imgUrl = _imgUrl;
@synthesize imgHeight = _imgHeight;
@synthesize shareUrl = _shareUrl;
@synthesize pointList = _pointList;
@synthesize imgWidth = _imgWidth;
@synthesize requestUsers = _requestUsers;
@synthesize imgId = _imgId;
@synthesize imgDesc = _imgDesc;
@synthesize jobId = _jobId;
@synthesize isValid = _isValid;
@synthesize thumImgs = _thumImgs;


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
            self.imgUrl = [self objectOrNilForKey:kDHImgsImgUrl fromDictionary:dict];
            self.imgHeight = [[self objectOrNilForKey:kDHImgsImgHeight fromDictionary:dict] doubleValue];
            self.shareUrl = [self objectOrNilForKey:kDHImgsShareUrl fromDictionary:dict];
    NSObject *receivedDHPointList = [dict objectForKey:kDHImgsPointList];
    NSMutableArray *parsedDHPointList = [NSMutableArray array];
    if ([receivedDHPointList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDHPointList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDHPointList addObject:[DHPointList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDHPointList isKindOfClass:[NSDictionary class]]) {
       [parsedDHPointList addObject:[DHPointList modelObjectWithDictionary:(NSDictionary *)receivedDHPointList]];
    }

    self.pointList = [NSArray arrayWithArray:parsedDHPointList];
            self.imgWidth = [[self objectOrNilForKey:kDHImgsImgWidth fromDictionary:dict] doubleValue];
            self.requestUsers = [self objectOrNilForKey:kDHImgsRequestUsers fromDictionary:dict];
            self.imgId = [[self objectOrNilForKey:kDHImgsImgId fromDictionary:dict] doubleValue];
            self.imgDesc = [self objectOrNilForKey:kDHImgsImgDesc fromDictionary:dict];
            self.jobId = [[self objectOrNilForKey:kDHImgsJobId fromDictionary:dict] doubleValue];
            self.isValid = [[self objectOrNilForKey:kDHImgsIsValid fromDictionary:dict] doubleValue];
    NSObject *receivedDHThumImgs = [dict objectForKey:kDHImgsThumImgs];
    NSMutableArray *parsedDHThumImgs = [NSMutableArray array];
    if ([receivedDHThumImgs isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDHThumImgs) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDHThumImgs addObject:[DHThumImgs modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDHThumImgs isKindOfClass:[NSDictionary class]]) {
       [parsedDHThumImgs addObject:[DHThumImgs modelObjectWithDictionary:(NSDictionary *)receivedDHThumImgs]];
    }

    self.thumImgs = [NSArray arrayWithArray:parsedDHThumImgs];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgUrl forKey:kDHImgsImgUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgHeight] forKey:kDHImgsImgHeight];
    [mutableDict setValue:self.shareUrl forKey:kDHImgsShareUrl];
    NSMutableArray *tempArrayForPointList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.pointList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPointList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPointList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPointList] forKey:kDHImgsPointList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgWidth] forKey:kDHImgsImgWidth];
    NSMutableArray *tempArrayForRequestUsers = [NSMutableArray array];
    for (NSObject *subArrayObject in self.requestUsers) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRequestUsers addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRequestUsers addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRequestUsers] forKey:kDHImgsRequestUsers];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgId] forKey:kDHImgsImgId];
    [mutableDict setValue:self.imgDesc forKey:kDHImgsImgDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.jobId] forKey:kDHImgsJobId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isValid] forKey:kDHImgsIsValid];
    NSMutableArray *tempArrayForThumImgs = [NSMutableArray array];
    for (NSObject *subArrayObject in self.thumImgs) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForThumImgs addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForThumImgs addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForThumImgs] forKey:kDHImgsThumImgs];

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

    self.imgUrl = [aDecoder decodeObjectForKey:kDHImgsImgUrl];
    self.imgHeight = [aDecoder decodeDoubleForKey:kDHImgsImgHeight];
    self.shareUrl = [aDecoder decodeObjectForKey:kDHImgsShareUrl];
    self.pointList = [aDecoder decodeObjectForKey:kDHImgsPointList];
    self.imgWidth = [aDecoder decodeDoubleForKey:kDHImgsImgWidth];
    self.requestUsers = [aDecoder decodeObjectForKey:kDHImgsRequestUsers];
    self.imgId = [aDecoder decodeDoubleForKey:kDHImgsImgId];
    self.imgDesc = [aDecoder decodeObjectForKey:kDHImgsImgDesc];
    self.jobId = [aDecoder decodeDoubleForKey:kDHImgsJobId];
    self.isValid = [aDecoder decodeDoubleForKey:kDHImgsIsValid];
    self.thumImgs = [aDecoder decodeObjectForKey:kDHImgsThumImgs];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgUrl forKey:kDHImgsImgUrl];
    [aCoder encodeDouble:_imgHeight forKey:kDHImgsImgHeight];
    [aCoder encodeObject:_shareUrl forKey:kDHImgsShareUrl];
    [aCoder encodeObject:_pointList forKey:kDHImgsPointList];
    [aCoder encodeDouble:_imgWidth forKey:kDHImgsImgWidth];
    [aCoder encodeObject:_requestUsers forKey:kDHImgsRequestUsers];
    [aCoder encodeDouble:_imgId forKey:kDHImgsImgId];
    [aCoder encodeObject:_imgDesc forKey:kDHImgsImgDesc];
    [aCoder encodeDouble:_jobId forKey:kDHImgsJobId];
    [aCoder encodeDouble:_isValid forKey:kDHImgsIsValid];
    [aCoder encodeObject:_thumImgs forKey:kDHImgsThumImgs];
}

- (id)copyWithZone:(NSZone *)zone
{
    DHImgs *copy = [[DHImgs alloc] init];
    
    if (copy) {

        copy.imgUrl = [self.imgUrl copyWithZone:zone];
        copy.imgHeight = self.imgHeight;
        copy.shareUrl = [self.shareUrl copyWithZone:zone];
        copy.pointList = [self.pointList copyWithZone:zone];
        copy.imgWidth = self.imgWidth;
        copy.requestUsers = [self.requestUsers copyWithZone:zone];
        copy.imgId = self.imgId;
        copy.imgDesc = [self.imgDesc copyWithZone:zone];
        copy.jobId = self.jobId;
        copy.isValid = self.isValid;
        copy.thumImgs = [self.thumImgs copyWithZone:zone];
    }
    
    return copy;
}


@end
