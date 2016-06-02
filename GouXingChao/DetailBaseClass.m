//
//  DetailBaseClass.m
//
//  Created by Mac  on 14-11-5
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DetailBaseClass.h"
#import "DetailDataList.h"


NSString *const kDetailBaseClassPageCount = @"pageCount";
NSString *const kDetailBaseClassDataList = @"dataList";
NSString *const kDetailBaseClassPage = @"page";


@interface DetailBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DetailBaseClass

@synthesize pageCount = _pageCount;
@synthesize dataList = _dataList;
@synthesize page = _page;


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
            self.pageCount = [[self objectOrNilForKey:kDetailBaseClassPageCount fromDictionary:dict] doubleValue];
    NSObject *receivedDetailDataList = [dict objectForKey:kDetailBaseClassDataList];
    NSMutableArray *parsedDetailDataList = [NSMutableArray array];
    if ([receivedDetailDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDetailDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDetailDataList addObject:[DetailDataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDetailDataList isKindOfClass:[NSDictionary class]]) {
       [parsedDetailDataList addObject:[DetailDataList modelObjectWithDictionary:(NSDictionary *)receivedDetailDataList]];
    }

    self.dataList = [NSMutableArray arrayWithArray:parsedDetailDataList];
            self.page = [self objectOrNilForKey:kDetailBaseClassPage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:kDetailBaseClassPageCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kDetailBaseClassDataList];
    [mutableDict setValue:self.page forKey:kDetailBaseClassPage];

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

    self.pageCount = [aDecoder decodeDoubleForKey:kDetailBaseClassPageCount];
    self.dataList = [aDecoder decodeObjectForKey:kDetailBaseClassDataList];
    self.page = [aDecoder decodeObjectForKey:kDetailBaseClassPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pageCount forKey:kDetailBaseClassPageCount];
    [aCoder encodeObject:_dataList forKey:kDetailBaseClassDataList];
    [aCoder encodeObject:_page forKey:kDetailBaseClassPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    DetailBaseClass *copy = [[DetailBaseClass alloc] init];
    
    if (copy) {

        copy.pageCount = self.pageCount;
        copy.dataList = [self.dataList copyWithZone:zone];
        copy.page = [self.page copyWithZone:zone];
    }
    
    return copy;
}


@end
