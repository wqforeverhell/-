//
//  TGDataList.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "TGDataList.h"


NSString *const kTGDataListId = @"id";
NSString *const kTGDataListImgHeight = @"imgHeight";
NSString *const kTGDataListTitle1 = @"title1";
NSString *const kTGDataListLastTime = @"lastTime";
NSString *const kTGDataListPicUrl = @"picUrl";
NSString *const kTGDataListPromoPrice = @"promoPrice";
NSString *const kTGDataListUrl = @"url";
NSString *const kTGDataListJoinNum = @"joinNum";
NSString *const kTGDataListDesc = @"desc";
NSString *const kTGDataListOverTime = @"overTime";
NSString *const kTGDataListPrice = @"price";
NSString *const kTGDataListAuditStatus = @"auditStatus";
NSString *const kTGDataListImgWidth = @"imgWidth";
NSString *const kTGDataListZhekou = @"zhekou";
NSString *const kTGDataListStartTime = @"startTime";


@interface TGDataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TGDataList

@synthesize dataListIdentifier = _dataListIdentifier;
@synthesize imgHeight = _imgHeight;
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
@synthesize imgWidth = _imgWidth;
@synthesize zhekou = _zhekou;
@synthesize startTime = _startTime;


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
            self.dataListIdentifier = [[self objectOrNilForKey:kTGDataListId fromDictionary:dict] doubleValue];
            self.imgHeight = [[self objectOrNilForKey:kTGDataListImgHeight fromDictionary:dict] doubleValue];
            self.title1 = [self objectOrNilForKey:kTGDataListTitle1 fromDictionary:dict];
            self.lastTime = [self objectOrNilForKey:kTGDataListLastTime fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kTGDataListPicUrl fromDictionary:dict];
            self.promoPrice = [self objectOrNilForKey:kTGDataListPromoPrice fromDictionary:dict];
            self.url = [self objectOrNilForKey:kTGDataListUrl fromDictionary:dict];
            self.joinNum = [[self objectOrNilForKey:kTGDataListJoinNum fromDictionary:dict] doubleValue];
            self.desc = [self objectOrNilForKey:kTGDataListDesc fromDictionary:dict];
            self.overTime = [self objectOrNilForKey:kTGDataListOverTime fromDictionary:dict];
            self.price = [self objectOrNilForKey:kTGDataListPrice fromDictionary:dict];
            self.auditStatus = [[self objectOrNilForKey:kTGDataListAuditStatus fromDictionary:dict] doubleValue];
            self.imgWidth = [[self objectOrNilForKey:kTGDataListImgWidth fromDictionary:dict] doubleValue];
            self.zhekou = [self objectOrNilForKey:kTGDataListZhekou fromDictionary:dict];
            self.startTime = [self objectOrNilForKey:kTGDataListStartTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataListIdentifier] forKey:kTGDataListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgHeight] forKey:kTGDataListImgHeight];
    [mutableDict setValue:self.title1 forKey:kTGDataListTitle1];
    [mutableDict setValue:self.lastTime forKey:kTGDataListLastTime];
    [mutableDict setValue:self.picUrl forKey:kTGDataListPicUrl];
    [mutableDict setValue:self.promoPrice forKey:kTGDataListPromoPrice];
    [mutableDict setValue:self.url forKey:kTGDataListUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.joinNum] forKey:kTGDataListJoinNum];
    [mutableDict setValue:self.desc forKey:kTGDataListDesc];
    [mutableDict setValue:self.overTime forKey:kTGDataListOverTime];
    [mutableDict setValue:self.price forKey:kTGDataListPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.auditStatus] forKey:kTGDataListAuditStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgWidth] forKey:kTGDataListImgWidth];
    [mutableDict setValue:self.zhekou forKey:kTGDataListZhekou];
    [mutableDict setValue:self.startTime forKey:kTGDataListStartTime];

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

    self.dataListIdentifier = [aDecoder decodeDoubleForKey:kTGDataListId];
    self.imgHeight = [aDecoder decodeDoubleForKey:kTGDataListImgHeight];
    self.title1 = [aDecoder decodeObjectForKey:kTGDataListTitle1];
    self.lastTime = [aDecoder decodeObjectForKey:kTGDataListLastTime];
    self.picUrl = [aDecoder decodeObjectForKey:kTGDataListPicUrl];
    self.promoPrice = [aDecoder decodeObjectForKey:kTGDataListPromoPrice];
    self.url = [aDecoder decodeObjectForKey:kTGDataListUrl];
    self.joinNum = [aDecoder decodeDoubleForKey:kTGDataListJoinNum];
    self.desc = [aDecoder decodeObjectForKey:kTGDataListDesc];
    self.overTime = [aDecoder decodeObjectForKey:kTGDataListOverTime];
    self.price = [aDecoder decodeObjectForKey:kTGDataListPrice];
    self.auditStatus = [aDecoder decodeDoubleForKey:kTGDataListAuditStatus];
    self.imgWidth = [aDecoder decodeDoubleForKey:kTGDataListImgWidth];
    self.zhekou = [aDecoder decodeObjectForKey:kTGDataListZhekou];
    self.startTime = [aDecoder decodeObjectForKey:kTGDataListStartTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataListIdentifier forKey:kTGDataListId];
    [aCoder encodeDouble:_imgHeight forKey:kTGDataListImgHeight];
    [aCoder encodeObject:_title1 forKey:kTGDataListTitle1];
    [aCoder encodeObject:_lastTime forKey:kTGDataListLastTime];
    [aCoder encodeObject:_picUrl forKey:kTGDataListPicUrl];
    [aCoder encodeObject:_promoPrice forKey:kTGDataListPromoPrice];
    [aCoder encodeObject:_url forKey:kTGDataListUrl];
    [aCoder encodeDouble:_joinNum forKey:kTGDataListJoinNum];
    [aCoder encodeObject:_desc forKey:kTGDataListDesc];
    [aCoder encodeObject:_overTime forKey:kTGDataListOverTime];
    [aCoder encodeObject:_price forKey:kTGDataListPrice];
    [aCoder encodeDouble:_auditStatus forKey:kTGDataListAuditStatus];
    [aCoder encodeDouble:_imgWidth forKey:kTGDataListImgWidth];
    [aCoder encodeObject:_zhekou forKey:kTGDataListZhekou];
    [aCoder encodeObject:_startTime forKey:kTGDataListStartTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    TGDataList *copy = [[TGDataList alloc] init];
    
    if (copy) {

        copy.dataListIdentifier = self.dataListIdentifier;
        copy.imgHeight = self.imgHeight;
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
        copy.imgWidth = self.imgWidth;
        copy.zhekou = [self.zhekou copyWithZone:zone];
        copy.startTime = [self.startTime copyWithZone:zone];
    }
    
    return copy;
}


@end
