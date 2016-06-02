//
//  DSDataList.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DSDataList.h"


NSString *const kDSDataListId = @"id";
NSString *const kDSDataListStartTime = @"startTime";
NSString *const kDSDataListTitle1 = @"title1";
NSString *const kDSDataListLastTime = @"lastTime";
NSString *const kDSDataListPicUrl = @"picUrl";
NSString *const kDSDataListPromoPrice = @"promoPrice";
NSString *const kDSDataListUrl = @"url";
NSString *const kDSDataListJoinNum = @"joinNum";
NSString *const kDSDataListDesc = @"desc";
NSString *const kDSDataListOverTime = @"overTime";
NSString *const kDSDataListPrice = @"price";
NSString *const kDSDataListAuditStatus = @"auditStatus";
NSString *const kDSDataListImgHeight = @"imgHeight";
NSString *const kDSDataListZhekou = @"zhekou";
NSString *const kDSDataListImgWidth = @"imgWidth";


@interface DSDataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DSDataList

@synthesize dataListIdentifier = _dataListIdentifier;
@synthesize startTime = _startTime;
@synthesize title1 = _title1;
@synthesize lastTime = _lastTime;
@synthesize picUrl = _picUrl;
@synthesize promoPrice = _promoPrice;
@synthesize url = _url;
@synthesize joinNum = _joinNum;
@synthesize desc = _desc;
@synthesize overTime = _overTime;
@synthesize price = _price;
@synthesize auditStatus = _auditStatus;
@synthesize imgHeight = _imgHeight;
@synthesize zhekou = _zhekou;
@synthesize imgWidth = _imgWidth;


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
            self.dataListIdentifier = [[self objectOrNilForKey:kDSDataListId fromDictionary:dict] doubleValue];
            self.startTime = [self objectOrNilForKey:kDSDataListStartTime fromDictionary:dict];
            self.title1 = [self objectOrNilForKey:kDSDataListTitle1 fromDictionary:dict];
            self.lastTime = [self objectOrNilForKey:kDSDataListLastTime fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kDSDataListPicUrl fromDictionary:dict];
            self.promoPrice = [self objectOrNilForKey:kDSDataListPromoPrice fromDictionary:dict];
            self.url = [self objectOrNilForKey:kDSDataListUrl fromDictionary:dict];
            self.joinNum = [[self objectOrNilForKey:kDSDataListJoinNum fromDictionary:dict] doubleValue];
            self.desc = [self objectOrNilForKey:kDSDataListDesc fromDictionary:dict];
            self.overTime = [self objectOrNilForKey:kDSDataListOverTime fromDictionary:dict];
            self.price = [self objectOrNilForKey:kDSDataListPrice fromDictionary:dict];
            self.auditStatus = [[self objectOrNilForKey:kDSDataListAuditStatus fromDictionary:dict] doubleValue];
            self.imgHeight = [[self objectOrNilForKey:kDSDataListImgHeight fromDictionary:dict] doubleValue];
            self.zhekou = [self objectOrNilForKey:kDSDataListZhekou fromDictionary:dict];
            self.imgWidth = [[self objectOrNilForKey:kDSDataListImgWidth fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataListIdentifier] forKey:kDSDataListId];
    [mutableDict setValue:self.startTime forKey:kDSDataListStartTime];
    [mutableDict setValue:self.title1 forKey:kDSDataListTitle1];
    [mutableDict setValue:self.lastTime forKey:kDSDataListLastTime];
    [mutableDict setValue:self.picUrl forKey:kDSDataListPicUrl];
    [mutableDict setValue:self.promoPrice forKey:kDSDataListPromoPrice];
    [mutableDict setValue:self.url forKey:kDSDataListUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.joinNum] forKey:kDSDataListJoinNum];
    [mutableDict setValue:self.desc forKey:kDSDataListDesc];
    [mutableDict setValue:self.overTime forKey:kDSDataListOverTime];
    [mutableDict setValue:self.price forKey:kDSDataListPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.auditStatus] forKey:kDSDataListAuditStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgHeight] forKey:kDSDataListImgHeight];
    [mutableDict setValue:self.zhekou forKey:kDSDataListZhekou];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgWidth] forKey:kDSDataListImgWidth];

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

    self.dataListIdentifier = [aDecoder decodeDoubleForKey:kDSDataListId];
    self.startTime = [aDecoder decodeObjectForKey:kDSDataListStartTime];
    self.title1 = [aDecoder decodeObjectForKey:kDSDataListTitle1];
    self.lastTime = [aDecoder decodeObjectForKey:kDSDataListLastTime];
    self.picUrl = [aDecoder decodeObjectForKey:kDSDataListPicUrl];
    self.promoPrice = [aDecoder decodeObjectForKey:kDSDataListPromoPrice];
    self.url = [aDecoder decodeObjectForKey:kDSDataListUrl];
    self.joinNum = [aDecoder decodeDoubleForKey:kDSDataListJoinNum];
    self.desc = [aDecoder decodeObjectForKey:kDSDataListDesc];
    self.overTime = [aDecoder decodeObjectForKey:kDSDataListOverTime];
    self.price = [aDecoder decodeObjectForKey:kDSDataListPrice];
    self.auditStatus = [aDecoder decodeDoubleForKey:kDSDataListAuditStatus];
    self.imgHeight = [aDecoder decodeDoubleForKey:kDSDataListImgHeight];
    self.zhekou = [aDecoder decodeObjectForKey:kDSDataListZhekou];
    self.imgWidth = [aDecoder decodeDoubleForKey:kDSDataListImgWidth];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataListIdentifier forKey:kDSDataListId];
    [aCoder encodeObject:_startTime forKey:kDSDataListStartTime];
    [aCoder encodeObject:_title1 forKey:kDSDataListTitle1];
    [aCoder encodeObject:_lastTime forKey:kDSDataListLastTime];
    [aCoder encodeObject:_picUrl forKey:kDSDataListPicUrl];
    [aCoder encodeObject:_promoPrice forKey:kDSDataListPromoPrice];
    [aCoder encodeObject:_url forKey:kDSDataListUrl];
    [aCoder encodeDouble:_joinNum forKey:kDSDataListJoinNum];
    [aCoder encodeObject:_desc forKey:kDSDataListDesc];
    [aCoder encodeObject:_overTime forKey:kDSDataListOverTime];
    [aCoder encodeObject:_price forKey:kDSDataListPrice];
    [aCoder encodeDouble:_auditStatus forKey:kDSDataListAuditStatus];
    [aCoder encodeDouble:_imgHeight forKey:kDSDataListImgHeight];
    [aCoder encodeObject:_zhekou forKey:kDSDataListZhekou];
    [aCoder encodeDouble:_imgWidth forKey:kDSDataListImgWidth];
}

- (id)copyWithZone:(NSZone *)zone
{
    DSDataList *copy = [[DSDataList alloc] init];
    
    if (copy) {

        copy.dataListIdentifier = self.dataListIdentifier;
        copy.startTime = [self.startTime copyWithZone:zone];
        copy.title1 = [self.title1 copyWithZone:zone];
        copy.lastTime = [self.lastTime copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.promoPrice = [self.promoPrice copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.joinNum = self.joinNum;
        copy.desc = [self.desc copyWithZone:zone];
        copy.overTime = [self.overTime copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.auditStatus = self.auditStatus;
        copy.imgHeight = self.imgHeight;
        copy.zhekou = [self.zhekou copyWithZone:zone];
        copy.imgWidth = self.imgWidth;
    }
    
    return copy;
}


@end
