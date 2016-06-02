//
//  DWBaseClass.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DWBaseClass.h"
#import "DWDataList.h"


NSString *const kDWBaseClassPage = @"page";
NSString *const kDWBaseClassDataList = @"dataList";
NSString *const kDWBaseClassPageCount = @"pageCount";


@interface DWBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DWBaseClass

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
            self.page = [[self objectOrNilForKey:kDWBaseClassPage fromDictionary:dict] doubleValue];
    NSObject *receivedDWDataList = [dict objectForKey:kDWBaseClassDataList];
    NSMutableArray *parsedDWDataList = [NSMutableArray array];
    if ([receivedDWDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDWDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDWDataList addObject:[DWDataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDWDataList isKindOfClass:[NSDictionary class]]) {
       [parsedDWDataList addObject:[DWDataList modelObjectWithDictionary:(NSDictionary *)receivedDWDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedDWDataList];
            self.pageCount = [[self objectOrNilForKey:kDWBaseClassPageCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kDWBaseClassPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kDWBaseClassDataList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:kDWBaseClassPageCount];

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

    self.page = [aDecoder decodeDoubleForKey:kDWBaseClassPage];
    self.dataList = [aDecoder decodeObjectForKey:kDWBaseClassDataList];
    self.pageCount = [aDecoder decodeDoubleForKey:kDWBaseClassPageCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_page forKey:kDWBaseClassPage];
    [aCoder encodeObject:_dataList forKey:kDWBaseClassDataList];
    [aCoder encodeDouble:_pageCount forKey:kDWBaseClassPageCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    DWBaseClass *copy = [[DWBaseClass alloc] init];
    
    if (copy) {

        copy.page = self.page;
        copy.dataList = [self.dataList copyWithZone:zone];
        copy.pageCount = self.pageCount;
    }
    
    return copy;
}


@end
