//
//  TGBaseClass.m
//
//  Created by Mac  on 14-11-4
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "TGBaseClass.h"
#import "TGDataList.h"


NSString *const kTGBaseClassPage = @"page";
NSString *const kTGBaseClassDataList = @"dataList";
NSString *const kTGBaseClassPageCount = @"pageCount";


@interface TGBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TGBaseClass

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
            self.page = [[self objectOrNilForKey:kTGBaseClassPage fromDictionary:dict] doubleValue];
    NSObject *receivedTGDataList = [dict objectForKey:kTGBaseClassDataList];
    NSMutableArray *parsedTGDataList = [NSMutableArray array];
    if ([receivedTGDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTGDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTGDataList addObject:[TGDataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTGDataList isKindOfClass:[NSDictionary class]]) {
       [parsedTGDataList addObject:[TGDataList modelObjectWithDictionary:(NSDictionary *)receivedTGDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedTGDataList];
            self.pageCount = [[self objectOrNilForKey:kTGBaseClassPageCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kTGBaseClassPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kTGBaseClassDataList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:kTGBaseClassPageCount];

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

    self.page = [aDecoder decodeDoubleForKey:kTGBaseClassPage];
    self.dataList = [aDecoder decodeObjectForKey:kTGBaseClassDataList];
    self.pageCount = [aDecoder decodeDoubleForKey:kTGBaseClassPageCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_page forKey:kTGBaseClassPage];
    [aCoder encodeObject:_dataList forKey:kTGBaseClassDataList];
    [aCoder encodeDouble:_pageCount forKey:kTGBaseClassPageCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    TGBaseClass *copy = [[TGBaseClass alloc] init];
    
    if (copy) {

        copy.page = self.page;
        copy.dataList = [self.dataList copyWithZone:zone];
        copy.pageCount = self.pageCount;
    }
    
    return copy;
}


@end
