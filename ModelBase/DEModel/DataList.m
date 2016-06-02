//
//  DataList.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DataList.h"


NSString *const kDataListImgWidth = @"imgWidth";
NSString *const kDataListLikeType = @"likeType";
NSString *const kDataListTitle = @"title";
NSString *const kDataListUrl = @"url";
NSString *const kDataListPicUrl = @"picUrl";
NSString *const kDataListTtsId = @"ttsId";
NSString *const kDataListCId = @"cId";
NSString *const kDataListOnlineTime = @"onlineTime";
NSString *const kDataListShareUrl = @"shareUrl";
NSString *const kDataListSalesNum = @"salesNum";
NSString *const kDataListType = @"type";
NSString *const kDataListIsTop = @"isTop";
NSString *const kDataListRandomId = @"randomId";
NSString *const kDataListCType = @"cType";
NSString *const kDataListZtId = @"ztId";
NSString *const kDataListSourceId = @"sourceId";
NSString *const kDataListPromoPrice = @"promoPrice";
NSString *const kDataListAdTitle = @"adTitle";
NSString *const kDataListLikeCount = @"likeCount";
NSString *const kDataListPrice = @"price";
NSString *const kDataListImgHeight = @"imgHeight";


@interface DataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DataList

@synthesize imgWidth = _imgWidth;
@synthesize likeType = _likeType;
@synthesize title = _title;
@synthesize url = _url;
@synthesize picUrl = _picUrl;
@synthesize ttsId = _ttsId;
@synthesize cId = _cId;
@synthesize onlineTime = _onlineTime;
@synthesize shareUrl = _shareUrl;
@synthesize salesNum = _salesNum;
@synthesize type = _type;
@synthesize isTop = _isTop;
@synthesize randomId = _randomId;
@synthesize cType = _cType;
@synthesize ztId = _ztId;
@synthesize sourceId = _sourceId;
@synthesize promoPrice = _promoPrice;
@synthesize adTitle = _adTitle;
@synthesize likeCount = _likeCount;
@synthesize price = _price;
@synthesize imgHeight = _imgHeight;


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
            self.imgWidth = [[self objectOrNilForKey:kDataListImgWidth fromDictionary:dict] doubleValue];
            self.likeType = [[self objectOrNilForKey:kDataListLikeType fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kDataListTitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kDataListUrl fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kDataListPicUrl fromDictionary:dict];
            self.ttsId = [[self objectOrNilForKey:kDataListTtsId fromDictionary:dict] doubleValue];
            self.cId = [[self objectOrNilForKey:kDataListCId fromDictionary:dict] doubleValue];
            self.onlineTime = [self objectOrNilForKey:kDataListOnlineTime fromDictionary:dict];
            self.shareUrl = [self objectOrNilForKey:kDataListShareUrl fromDictionary:dict];
            self.salesNum = [[self objectOrNilForKey:kDataListSalesNum fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kDataListType fromDictionary:dict] doubleValue];
            self.isTop = [[self objectOrNilForKey:kDataListIsTop fromDictionary:dict] doubleValue];
            self.randomId = [[self objectOrNilForKey:kDataListRandomId fromDictionary:dict] doubleValue];
            self.cType = [[self objectOrNilForKey:kDataListCType fromDictionary:dict] doubleValue];
            self.ztId = [[self objectOrNilForKey:kDataListZtId fromDictionary:dict] doubleValue];
            self.sourceId = [[self objectOrNilForKey:kDataListSourceId fromDictionary:dict] doubleValue];
            self.promoPrice = [self objectOrNilForKey:kDataListPromoPrice fromDictionary:dict];
            self.adTitle = [self objectOrNilForKey:kDataListAdTitle fromDictionary:dict];
            self.likeCount = [[self objectOrNilForKey:kDataListLikeCount fromDictionary:dict] doubleValue];
            self.price = [self objectOrNilForKey:kDataListPrice fromDictionary:dict];
            self.imgHeight = [[self objectOrNilForKey:kDataListImgHeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgWidth] forKey:kDataListImgWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeType] forKey:kDataListLikeType];
    [mutableDict setValue:self.title forKey:kDataListTitle];
    [mutableDict setValue:self.url forKey:kDataListUrl];
    [mutableDict setValue:self.picUrl forKey:kDataListPicUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ttsId] forKey:kDataListTtsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cId] forKey:kDataListCId];
    [mutableDict setValue:self.onlineTime forKey:kDataListOnlineTime];
    [mutableDict setValue:self.shareUrl forKey:kDataListShareUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.salesNum] forKey:kDataListSalesNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kDataListType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isTop] forKey:kDataListIsTop];
    [mutableDict setValue:[NSNumber numberWithDouble:self.randomId] forKey:kDataListRandomId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cType] forKey:kDataListCType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ztId] forKey:kDataListZtId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceId] forKey:kDataListSourceId];
    [mutableDict setValue:self.promoPrice forKey:kDataListPromoPrice];
    [mutableDict setValue:self.adTitle forKey:kDataListAdTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeCount] forKey:kDataListLikeCount];
    [mutableDict setValue:self.price forKey:kDataListPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgHeight] forKey:kDataListImgHeight];

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

    self.imgWidth = [aDecoder decodeDoubleForKey:kDataListImgWidth];
    self.likeType = [aDecoder decodeDoubleForKey:kDataListLikeType];
    self.title = [aDecoder decodeObjectForKey:kDataListTitle];
    self.url = [aDecoder decodeObjectForKey:kDataListUrl];
    self.picUrl = [aDecoder decodeObjectForKey:kDataListPicUrl];
    self.ttsId = [aDecoder decodeDoubleForKey:kDataListTtsId];
    self.cId = [aDecoder decodeDoubleForKey:kDataListCId];
    self.onlineTime = [aDecoder decodeObjectForKey:kDataListOnlineTime];
    self.shareUrl = [aDecoder decodeObjectForKey:kDataListShareUrl];
    self.salesNum = [aDecoder decodeDoubleForKey:kDataListSalesNum];
    self.type = [aDecoder decodeDoubleForKey:kDataListType];
    self.isTop = [aDecoder decodeDoubleForKey:kDataListIsTop];
    self.randomId = [aDecoder decodeDoubleForKey:kDataListRandomId];
    self.cType = [aDecoder decodeDoubleForKey:kDataListCType];
    self.ztId = [aDecoder decodeDoubleForKey:kDataListZtId];
    self.sourceId = [aDecoder decodeDoubleForKey:kDataListSourceId];
    self.promoPrice = [aDecoder decodeObjectForKey:kDataListPromoPrice];
    self.adTitle = [aDecoder decodeObjectForKey:kDataListAdTitle];
    self.likeCount = [aDecoder decodeDoubleForKey:kDataListLikeCount];
    self.price = [aDecoder decodeObjectForKey:kDataListPrice];
    self.imgHeight = [aDecoder decodeDoubleForKey:kDataListImgHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_imgWidth forKey:kDataListImgWidth];
    [aCoder encodeDouble:_likeType forKey:kDataListLikeType];
    [aCoder encodeObject:_title forKey:kDataListTitle];
    [aCoder encodeObject:_url forKey:kDataListUrl];
    [aCoder encodeObject:_picUrl forKey:kDataListPicUrl];
    [aCoder encodeDouble:_ttsId forKey:kDataListTtsId];
    [aCoder encodeDouble:_cId forKey:kDataListCId];
    [aCoder encodeObject:_onlineTime forKey:kDataListOnlineTime];
    [aCoder encodeObject:_shareUrl forKey:kDataListShareUrl];
    [aCoder encodeDouble:_salesNum forKey:kDataListSalesNum];
    [aCoder encodeDouble:_type forKey:kDataListType];
    [aCoder encodeDouble:_isTop forKey:kDataListIsTop];
    [aCoder encodeDouble:_randomId forKey:kDataListRandomId];
    [aCoder encodeDouble:_cType forKey:kDataListCType];
    [aCoder encodeDouble:_ztId forKey:kDataListZtId];
    [aCoder encodeDouble:_sourceId forKey:kDataListSourceId];
    [aCoder encodeObject:_promoPrice forKey:kDataListPromoPrice];
    [aCoder encodeObject:_adTitle forKey:kDataListAdTitle];
    [aCoder encodeDouble:_likeCount forKey:kDataListLikeCount];
    [aCoder encodeObject:_price forKey:kDataListPrice];
    [aCoder encodeDouble:_imgHeight forKey:kDataListImgHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    DataList *copy = [[DataList alloc] init];
    
    if (copy) {

        copy.imgWidth = self.imgWidth;
        copy.likeType = self.likeType;
        copy.title = [self.title copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.ttsId = self.ttsId;
        copy.cId = self.cId;
        copy.onlineTime = [self.onlineTime copyWithZone:zone];
        copy.shareUrl = [self.shareUrl copyWithZone:zone];
        copy.salesNum = self.salesNum;
        copy.type = self.type;
        copy.isTop = self.isTop;
        copy.randomId = self.randomId;
        copy.cType = self.cType;
        copy.ztId = self.ztId;
        copy.sourceId = self.sourceId;
        copy.promoPrice = [self.promoPrice copyWithZone:zone];
        copy.adTitle = [self.adTitle copyWithZone:zone];
        copy.likeCount = self.likeCount;
        copy.price = [self.price copyWithZone:zone];
        copy.imgHeight = self.imgHeight;
    }
    
    return copy;
}




@end
