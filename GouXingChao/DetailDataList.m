//
//  DetailDataList.m
//
//  Created by Mac  on 14-11-5
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DetailDataList.h"


NSString *const kDetailDataListImgHeight = @"imgHeight";
NSString *const kDetailDataListSalesNum = @"salesNum";
NSString *const kDetailDataListPicUrl = @"picUrl";
NSString *const kDetailDataListPromoPrice = @"promoPrice";
NSString *const kDetailDataListTtsId = @"ttsId";
NSString *const kDetailDataListUrl = @"url";
NSString *const kDetailDataListLikeCount = @"likeCount";
NSString *const kDetailDataListTitle = @"title";
NSString *const kDetailDataListPrice = @"price";
NSString *const kDetailDataListSourceId = @"sourceId";
NSString *const kDetailDataListIsTop = @"isTop";
NSString *const kDetailDataListRandomId = @"randomId";
NSString *const kDetailDataListImgWidth = @"imgWidth";
NSString *const kDetailDataListLikeType = @"likeType";


@interface DetailDataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DetailDataList

@synthesize imgHeight = _imgHeight;
@synthesize salesNum = _salesNum;
@synthesize picUrl = _picUrl;
@synthesize promoPrice = _promoPrice;
@synthesize ttsId = _ttsId;
@synthesize url = _url;
@synthesize likeCount = _likeCount;
@synthesize title = _title;
@synthesize price = _price;
@synthesize sourceId = _sourceId;
@synthesize isTop = _isTop;
@synthesize randomId = _randomId;
@synthesize imgWidth = _imgWidth;
@synthesize likeType = _likeType;


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
            self.imgHeight = [[self objectOrNilForKey:kDetailDataListImgHeight fromDictionary:dict] doubleValue];
            self.salesNum = [[self objectOrNilForKey:kDetailDataListSalesNum fromDictionary:dict] doubleValue];
            self.picUrl = [self objectOrNilForKey:kDetailDataListPicUrl fromDictionary:dict];
            self.promoPrice = [self objectOrNilForKey:kDetailDataListPromoPrice fromDictionary:dict];
            self.ttsId = [[self objectOrNilForKey:kDetailDataListTtsId fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kDetailDataListUrl fromDictionary:dict];
            self.likeCount = [[self objectOrNilForKey:kDetailDataListLikeCount fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kDetailDataListTitle fromDictionary:dict];
            self.price = [self objectOrNilForKey:kDetailDataListPrice fromDictionary:dict];
            self.sourceId = [[self objectOrNilForKey:kDetailDataListSourceId fromDictionary:dict] doubleValue];
            self.isTop = [[self objectOrNilForKey:kDetailDataListIsTop fromDictionary:dict] doubleValue];
            self.randomId = [[self objectOrNilForKey:kDetailDataListRandomId fromDictionary:dict] doubleValue];
            self.imgWidth = [[self objectOrNilForKey:kDetailDataListImgWidth fromDictionary:dict] doubleValue];
            self.likeType = [[self objectOrNilForKey:kDetailDataListLikeType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgHeight] forKey:kDetailDataListImgHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.salesNum] forKey:kDetailDataListSalesNum];
    [mutableDict setValue:self.picUrl forKey:kDetailDataListPicUrl];
    [mutableDict setValue:self.promoPrice forKey:kDetailDataListPromoPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ttsId] forKey:kDetailDataListTtsId];
    [mutableDict setValue:self.url forKey:kDetailDataListUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeCount] forKey:kDetailDataListLikeCount];
    [mutableDict setValue:self.title forKey:kDetailDataListTitle];
    [mutableDict setValue:self.price forKey:kDetailDataListPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceId] forKey:kDetailDataListSourceId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isTop] forKey:kDetailDataListIsTop];
    [mutableDict setValue:[NSNumber numberWithDouble:self.randomId] forKey:kDetailDataListRandomId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgWidth] forKey:kDetailDataListImgWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeType] forKey:kDetailDataListLikeType];

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

    self.imgHeight = [aDecoder decodeDoubleForKey:kDetailDataListImgHeight];
    self.salesNum = [aDecoder decodeDoubleForKey:kDetailDataListSalesNum];
    self.picUrl = [aDecoder decodeObjectForKey:kDetailDataListPicUrl];
    self.promoPrice = [aDecoder decodeObjectForKey:kDetailDataListPromoPrice];
    self.ttsId = [aDecoder decodeDoubleForKey:kDetailDataListTtsId];
    self.url = [aDecoder decodeObjectForKey:kDetailDataListUrl];
    self.likeCount = [aDecoder decodeDoubleForKey:kDetailDataListLikeCount];
    self.title = [aDecoder decodeObjectForKey:kDetailDataListTitle];
    self.price = [aDecoder decodeObjectForKey:kDetailDataListPrice];
    self.sourceId = [aDecoder decodeDoubleForKey:kDetailDataListSourceId];
    self.isTop = [aDecoder decodeDoubleForKey:kDetailDataListIsTop];
    self.randomId = [aDecoder decodeDoubleForKey:kDetailDataListRandomId];
    self.imgWidth = [aDecoder decodeDoubleForKey:kDetailDataListImgWidth];
    self.likeType = [aDecoder decodeDoubleForKey:kDetailDataListLikeType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_imgHeight forKey:kDetailDataListImgHeight];
    [aCoder encodeDouble:_salesNum forKey:kDetailDataListSalesNum];
    [aCoder encodeObject:_picUrl forKey:kDetailDataListPicUrl];
    [aCoder encodeObject:_promoPrice forKey:kDetailDataListPromoPrice];
    [aCoder encodeDouble:_ttsId forKey:kDetailDataListTtsId];
    [aCoder encodeObject:_url forKey:kDetailDataListUrl];
    [aCoder encodeDouble:_likeCount forKey:kDetailDataListLikeCount];
    [aCoder encodeObject:_title forKey:kDetailDataListTitle];
    [aCoder encodeObject:_price forKey:kDetailDataListPrice];
    [aCoder encodeDouble:_sourceId forKey:kDetailDataListSourceId];
    [aCoder encodeDouble:_isTop forKey:kDetailDataListIsTop];
    [aCoder encodeDouble:_randomId forKey:kDetailDataListRandomId];
    [aCoder encodeDouble:_imgWidth forKey:kDetailDataListImgWidth];
    [aCoder encodeDouble:_likeType forKey:kDetailDataListLikeType];
}

- (id)copyWithZone:(NSZone *)zone
{
    DetailDataList *copy = [[DetailDataList alloc] init];
    
    if (copy) {

        copy.imgHeight = self.imgHeight;
        copy.salesNum = self.salesNum;
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.promoPrice = [self.promoPrice copyWithZone:zone];
        copy.ttsId = self.ttsId;
        copy.url = [self.url copyWithZone:zone];
        copy.likeCount = self.likeCount;
        copy.title = [self.title copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.sourceId = self.sourceId;
        copy.isTop = self.isTop;
        copy.randomId = self.randomId;
        copy.imgWidth = self.imgWidth;
        copy.likeType = self.likeType;
    }
    
    return copy;
}


@end
