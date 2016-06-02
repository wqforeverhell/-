//
//  DHThumImgs.m
//
//  Created by Mac  on 14-11-6
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DHThumImgs.h"
#import "DHProducts.h"


NSString *const kDHThumImgsThumImgUrl = @"thumImgUrl";
NSString *const kDHThumImgsProducts = @"products";


@interface DHThumImgs ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DHThumImgs

@synthesize thumImgUrl = _thumImgUrl;
@synthesize products = _products;


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
            self.thumImgUrl = [self objectOrNilForKey:kDHThumImgsThumImgUrl fromDictionary:dict];
    NSObject *receivedDHProducts = [dict objectForKey:kDHThumImgsProducts];
    NSMutableArray *parsedDHProducts = [NSMutableArray array];
    if ([receivedDHProducts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDHProducts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDHProducts addObject:[DHProducts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDHProducts isKindOfClass:[NSDictionary class]]) {
       [parsedDHProducts addObject:[DHProducts modelObjectWithDictionary:(NSDictionary *)receivedDHProducts]];
    }

    self.products = [NSArray arrayWithArray:parsedDHProducts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.thumImgUrl forKey:kDHThumImgsThumImgUrl];
    NSMutableArray *tempArrayForProducts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.products) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProducts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProducts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProducts] forKey:kDHThumImgsProducts];

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

    self.thumImgUrl = [aDecoder decodeObjectForKey:kDHThumImgsThumImgUrl];
    self.products = [aDecoder decodeObjectForKey:kDHThumImgsProducts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_thumImgUrl forKey:kDHThumImgsThumImgUrl];
    [aCoder encodeObject:_products forKey:kDHThumImgsProducts];
}

- (id)copyWithZone:(NSZone *)zone
{
    DHThumImgs *copy = [[DHThumImgs alloc] init];
    
    if (copy) {

        copy.thumImgUrl = [self.thumImgUrl copyWithZone:zone];
        copy.products = [self.products copyWithZone:zone];
    }
    
    return copy;
}


@end
