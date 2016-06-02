//
//  DSBaseClass.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DSBaseClass.h"
#import "DSDataList.h"


NSString *const kDSBaseClassPage = @"page";
NSString *const kDSBaseClassDataList = @"dataList";
NSString *const kDSBaseClassPageCount = @"pageCount";


@interface DSBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DSBaseClass

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
            self.page = [[self objectOrNilForKey:kDSBaseClassPage fromDictionary:dict] doubleValue];
    NSObject *receivedDSDataList = [dict objectForKey:kDSBaseClassDataList];
    NSMutableArray *parsedDSDataList = [NSMutableArray array];
    if ([receivedDSDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDSDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDSDataList addObject:[DSDataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDSDataList isKindOfClass:[NSDictionary class]]) {
       [parsedDSDataList addObject:[DSDataList modelObjectWithDictionary:(NSDictionary *)receivedDSDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedDSDataList];
            self.pageCount = [[self objectOrNilForKey:kDSBaseClassPageCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kDSBaseClassPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kDSBaseClassDataList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:kDSBaseClassPageCount];

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

    self.page = [aDecoder decodeDoubleForKey:kDSBaseClassPage];
    self.dataList = [aDecoder decodeObjectForKey:kDSBaseClassDataList];
    self.pageCount = [aDecoder decodeDoubleForKey:kDSBaseClassPageCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_page forKey:kDSBaseClassPage];
    [aCoder encodeObject:_dataList forKey:kDSBaseClassDataList];
    [aCoder encodeDouble:_pageCount forKey:kDSBaseClassPageCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    DSBaseClass *copy = [[DSBaseClass alloc] init];
    
    if (copy) {

        copy.page = self.page;
        copy.dataList = [self.dataList copyWithZone:zone];
        copy.pageCount = self.pageCount;
    }
    
    return copy;
}


@end
