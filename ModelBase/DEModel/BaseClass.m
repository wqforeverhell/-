//
//  BaseClass.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "DataList.h"


NSString *const kBaseClassPage = @"page";
NSString *const kBaseClassDataList = @"dataList";
NSString *const kBaseClassPageCount = @"pageCount";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize page = _page;
@synthesize dataList = _dataList;
@synthesize pageCount = _pageCount;


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
            self.page = [[self objectOrNilForKey:kBaseClassPage fromDictionary:dict] doubleValue];
    NSObject *receivedDataList = [dict objectForKey:kBaseClassDataList];
    NSMutableArray *parsedDataList = [NSMutableArray array];
    if ([receivedDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDataList addObject:[DataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDataList isKindOfClass:[NSDictionary class]]) {
       [parsedDataList addObject:[DataList modelObjectWithDictionary:(NSDictionary *)receivedDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedDataList];
            self.pageCount = [[self objectOrNilForKey:kBaseClassPageCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kBaseClassPage];
    NSMutableArray *tempArrayForDataList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.dataList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDataList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDataList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kBaseClassDataList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:kBaseClassPageCount];

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

    self.page = [aDecoder decodeDoubleForKey:kBaseClassPage];
    self.dataList = [aDecoder decodeObjectForKey:kBaseClassDataList];
    self.pageCount = [aDecoder decodeDoubleForKey:kBaseClassPageCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_page forKey:kBaseClassPage];
    [aCoder encodeObject:_dataList forKey:kBaseClassDataList];
    [aCoder encodeDouble:_pageCount forKey:kBaseClassPageCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.page = self.page;
        copy.dataList = [self.dataList copyWithZone:zone];
        copy.pageCount = self.pageCount;
    }
    
    return copy;
}


@end
