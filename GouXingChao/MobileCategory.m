//
//  MobileCategory.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "MobileCategory.h"
#import "SonCateList.h"


NSString *const kMobileCategoryId = @"id";
NSString *const kMobileCategoryCateName = @"cateName";
NSString *const kMobileCategorySonCateList = @"sonCateList";


@interface MobileCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MobileCategory

@synthesize mobileCategoryIdentifier = _mobileCategoryIdentifier;
@synthesize cateName = _cateName;
@synthesize sonCateList = _sonCateList;


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
            self.mobileCategoryIdentifier = [[self objectOrNilForKey:kMobileCategoryId fromDictionary:dict] doubleValue];
            self.cateName = [self objectOrNilForKey:kMobileCategoryCateName fromDictionary:dict];
    NSObject *receivedSonCateList = [dict objectForKey:kMobileCategorySonCateList];
    NSMutableArray *parsedSonCateList = [NSMutableArray array];
    if ([receivedSonCateList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSonCateList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSonCateList addObject:[SonCateList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSonCateList isKindOfClass:[NSDictionary class]]) {
       [parsedSonCateList addObject:[SonCateList modelObjectWithDictionary:(NSDictionary *)receivedSonCateList]];
    }

    self.sonCateList = [NSArray arrayWithArray:parsedSonCateList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mobileCategoryIdentifier] forKey:kMobileCategoryId];
    [mutableDict setValue:self.cateName forKey:kMobileCategoryCateName];
    NSMutableArray *tempArrayForSonCateList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.sonCateList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSonCateList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSonCateList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSonCateList] forKey:kMobileCategorySonCateList];

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

    self.mobileCategoryIdentifier = [aDecoder decodeDoubleForKey:kMobileCategoryId];
    self.cateName = [aDecoder decodeObjectForKey:kMobileCategoryCateName];
    self.sonCateList = [aDecoder decodeObjectForKey:kMobileCategorySonCateList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_mobileCategoryIdentifier forKey:kMobileCategoryId];
    [aCoder encodeObject:_cateName forKey:kMobileCategoryCateName];
    [aCoder encodeObject:_sonCateList forKey:kMobileCategorySonCateList];
}

- (id)copyWithZone:(NSZone *)zone
{
    MobileCategory *copy = [[MobileCategory alloc] init];
    
    if (copy) {

        copy.mobileCategoryIdentifier = self.mobileCategoryIdentifier;
        copy.cateName = [self.cateName copyWithZone:zone];
        copy.sonCateList = [self.sonCateList copyWithZone:zone];
    }
    
    return copy;
}


@end
