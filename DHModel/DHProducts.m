//
//  DHProducts.m
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DHProducts.h"


NSString *const kDHProductsTtsProductId = @"ttsProductId";
NSString *const kDHProductsProductImgUrl = @"productImgUrl";
NSString *const kDHProductsLikeStatus = @"likeStatus";
NSString *const kDHProductsSellCount = @"sellCount";
NSString *const kDHProductsPrice = @"price";
NSString *const kDHProductsProductId = @"productId";
NSString *const kDHProductsProductUrl = @"productUrl";
NSString *const kDHProductsName = @"name";


@interface DHProducts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DHProducts

@synthesize ttsProductId = _ttsProductId;
@synthesize productImgUrl = _productImgUrl;
@synthesize likeStatus = _likeStatus;
@synthesize sellCount = _sellCount;
@synthesize price = _price;
@synthesize productId = _productId;
@synthesize productUrl = _productUrl;
@synthesize name = _name;


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
            self.ttsProductId = [[self objectOrNilForKey:kDHProductsTtsProductId fromDictionary:dict] doubleValue];
            self.productImgUrl = [self objectOrNilForKey:kDHProductsProductImgUrl fromDictionary:dict];
            self.likeStatus = [[self objectOrNilForKey:kDHProductsLikeStatus fromDictionary:dict] doubleValue];
            self.sellCount = [[self objectOrNilForKey:kDHProductsSellCount fromDictionary:dict] doubleValue];
            self.price = [self objectOrNilForKey:kDHProductsPrice fromDictionary:dict];
            self.productId = [[self objectOrNilForKey:kDHProductsProductId fromDictionary:dict] doubleValue];
            self.productUrl = [self objectOrNilForKey:kDHProductsProductUrl fromDictionary:dict];
            self.name = [self objectOrNilForKey:kDHProductsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ttsProductId] forKey:kDHProductsTtsProductId];
    [mutableDict setValue:self.productImgUrl forKey:kDHProductsProductImgUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeStatus] forKey:kDHProductsLikeStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sellCount] forKey:kDHProductsSellCount];
    [mutableDict setValue:self.price forKey:kDHProductsPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.productId] forKey:kDHProductsProductId];
    [mutableDict setValue:self.productUrl forKey:kDHProductsProductUrl];
    [mutableDict setValue:self.name forKey:kDHProductsName];

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

    self.ttsProductId = [aDecoder decodeDoubleForKey:kDHProductsTtsProductId];
    self.productImgUrl = [aDecoder decodeObjectForKey:kDHProductsProductImgUrl];
    self.likeStatus = [aDecoder decodeDoubleForKey:kDHProductsLikeStatus];
    self.sellCount = [aDecoder decodeDoubleForKey:kDHProductsSellCount];
    self.price = [aDecoder decodeObjectForKey:kDHProductsPrice];
    self.productId = [aDecoder decodeDoubleForKey:kDHProductsProductId];
    self.productUrl = [aDecoder decodeObjectForKey:kDHProductsProductUrl];
    self.name = [aDecoder decodeObjectForKey:kDHProductsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ttsProductId forKey:kDHProductsTtsProductId];
    [aCoder encodeObject:_productImgUrl forKey:kDHProductsProductImgUrl];
    [aCoder encodeDouble:_likeStatus forKey:kDHProductsLikeStatus];
    [aCoder encodeDouble:_sellCount forKey:kDHProductsSellCount];
    [aCoder encodeObject:_price forKey:kDHProductsPrice];
    [aCoder encodeDouble:_productId forKey:kDHProductsProductId];
    [aCoder encodeObject:_productUrl forKey:kDHProductsProductUrl];
    [aCoder encodeObject:_name forKey:kDHProductsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    DHProducts *copy = [[DHProducts alloc] init];
    
    if (copy) {

        copy.ttsProductId = self.ttsProductId;
        copy.productImgUrl = [self.productImgUrl copyWithZone:zone];
        copy.likeStatus = self.likeStatus;
        copy.sellCount = self.sellCount;
        copy.price = [self.price copyWithZone:zone];
        copy.productId = self.productId;
        copy.productUrl = [self.productUrl copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
