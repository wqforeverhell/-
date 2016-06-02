//
//  DWDataList.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DWDataList.h"


NSString *const kDWDataListId = @"id";
NSString *const kDWDataListTitle1 = @"title1";
NSString *const kDWDataListStartTime = @"startTime";
NSString *const kDWDataListPicUrl = @"picUrl";
NSString *const kDWDataListPromoPrice = @"promoPrice";
NSString *const kDWDataListUrl = @"url";
NSString *const kDWDataListJoinNum = @"joinNum";
NSString *const kDWDataListPrice = @"price";
NSString *const kDWDataListAuditStatus = @"auditStatus";
NSString *const kDWDataListImgHeight = @"imgHeight";
NSString *const kDWDataListZhekou = @"zhekou";
NSString *const kDWDataListImgWidth = @"imgWidth";


@interface DWDataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DWDataList

@synthesize dataListIdentifier = _dataListIdentifier;
@synthesize title1 = _title1;
@synthesize startTime = _startTime;
@synthesize picUrl = _picUrl;
@synthesize promoPrice = _promoPrice;
@synthesize url = _url;
@synthesize joinNum = _joinNum;
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
            self.dataListIdentifier = [[self objectOrNilForKey:kDWDataListId fromDictionary:dict] doubleValue];
            self.title1 = [self objectOrNilForKey:kDWDataListTitle1 fromDictionary:dict];
            self.startTime = [self objectOrNilForKey:kDWDataListStartTime fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kDWDataListPicUrl fromDictionary:dict];
            self.promoPrice = [self objectOrNilForKey:kDWDataListPromoPrice fromDictionary:dict];
            self.url = [self objectOrNilForKey:kDWDataListUrl fromDictionary:dict];
            self.joinNum = [[self objectOrNilForKey:kDWDataListJoinNum fromDictionary:dict] doubleValue];
            self.price = [self objectOrNilForKey:kDWDataListPrice fromDictionary:dict];
            self.auditStatus = [[self objectOrNilForKey:kDWDataListAuditStatus fromDictionary:dict] doubleValue];
            self.imgHeight = [[self objectOrNilForKey:kDWDataListImgHeight fromDictionary:dict] doubleValue];
            self.zhekou = [self objectOrNilForKey:kDWDataListZhekou fromDictionary:dict];
            self.imgWidth = [[self objectOrNilForKey:kDWDataListImgWidth fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataListIdentifier] forKey:kDWDataListId];
    [mutableDict setValue:self.title1 forKey:kDWDataListTitle1];
    [mutableDict setValue:self.startTime forKey:kDWDataListStartTime];
    [mutableDict setValue:self.picUrl forKey:kDWDataListPicUrl];
    [mutableDict setValue:self.promoPrice forKey:kDWDataListPromoPrice];
    [mutableDict setValue:self.url forKey:kDWDataListUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.joinNum] forKey:kDWDataListJoinNum];
    [mutableDict setValue:self.price forKey:kDWDataListPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.auditStatus] forKey:kDWDataListAuditStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgHeight] forKey:kDWDataListImgHeight];
    [mutableDict setValue:self.zhekou forKey:kDWDataListZhekou];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgWidth] forKey:kDWDataListImgWidth];

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

    self.dataListIdentifier = [aDecoder decodeDoubleForKey:kDWDataListId];
    self.title1 = [aDecoder decodeObjectForKey:kDWDataListTitle1];
    self.startTime = [aDecoder decodeObjectForKey:kDWDataListStartTime];
    self.picUrl = [aDecoder decodeObjectForKey:kDWDataListPicUrl];
    self.promoPrice = [aDecoder decodeObjectForKey:kDWDataListPromoPrice];
    self.url = [aDecoder decodeObjectForKey:kDWDataListUrl];
    self.joinNum = [aDecoder decodeDoubleForKey:kDWDataListJoinNum];
    self.price = [aDecoder decodeObjectForKey:kDWDataListPrice];
    self.auditStatus = [aDecoder decodeDoubleForKey:kDWDataListAuditStatus];
    self.imgHeight = [aDecoder decodeDoubleForKey:kDWDataListImgHeight];
    self.zhekou = [aDecoder decodeObjectForKey:kDWDataListZhekou];
    self.imgWidth = [aDecoder decodeDoubleForKey:kDWDataListImgWidth];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataListIdentifier forKey:kDWDataListId];
    [aCoder encodeObject:_title1 forKey:kDWDataListTitle1];
    [aCoder encodeObject:_startTime forKey:kDWDataListStartTime];
    [aCoder encodeObject:_picUrl forKey:kDWDataListPicUrl];
    [aCoder encodeObject:_promoPrice forKey:kDWDataListPromoPrice];
    [aCoder encodeObject:_url forKey:kDWDataListUrl];
    [aCoder encodeDouble:_joinNum forKey:kDWDataListJoinNum];
    [aCoder encodeObject:_price forKey:kDWDataListPrice];
    [aCoder encodeDouble:_auditStatus forKey:kDWDataListAuditStatus];
    [aCoder encodeDouble:_imgHeight forKey:kDWDataListImgHeight];
    [aCoder encodeObject:_zhekou forKey:kDWDataListZhekou];
    [aCoder encodeDouble:_imgWidth forKey:kDWDataListImgWidth];
}

- (id)copyWithZone:(NSZone *)zone
{
    DWDataList *copy = [[DWDataList alloc] init];
    
    if (copy) {

        copy.dataListIdentifier = self.dataListIdentifier;
        copy.title1 = [self.title1 copyWithZone:zone];
        copy.startTime = [self.startTime copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.promoPrice = [self.promoPrice copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.joinNum = self.joinNum;
        copy.price = [self.price copyWithZone:zone];
        copy.auditStatus = self.auditStatus;
        copy.imgHeight = self.imgHeight;
        copy.zhekou = [self.zhekou copyWithZone:zone];
        copy.imgWidth = self.imgWidth;
    }
    
    return copy;
}


@end
