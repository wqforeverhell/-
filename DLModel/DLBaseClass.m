//
//  DLBaseClass.m
//
//  Created by Mac  on 14-11-5
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DLBaseClass.h"
#import "DLImgGroups.h"


NSString *const kDLBaseClassImgGroups = @"imgGroups";


@interface DLBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DLBaseClass

@synthesize imgGroups = _imgGroups;


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
    NSObject *receivedDLImgGroups = [dict objectForKey:kDLBaseClassImgGroups];
    NSMutableArray *parsedDLImgGroups = [NSMutableArray array];
    if ([receivedDLImgGroups isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDLImgGroups) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDLImgGroups addObject:[DLImgGroups modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDLImgGroups isKindOfClass:[NSDictionary class]]) {
       [parsedDLImgGroups addObject:[DLImgGroups modelObjectWithDictionary:(NSDictionary *)receivedDLImgGroups]];
    }

    self.imgGroups = [NSArray arrayWithArray:parsedDLImgGroups];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForImgGroups = [NSMutableArray array];
    for (NSObject *subArrayObject in self.imgGroups) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImgGroups addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImgGroups addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImgGroups] forKey:kDLBaseClassImgGroups];

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

    self.imgGroups = [aDecoder decodeObjectForKey:kDLBaseClassImgGroups];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgGroups forKey:kDLBaseClassImgGroups];
}

- (id)copyWithZone:(NSZone *)zone
{
    DLBaseClass *copy = [[DLBaseClass alloc] init];
    
    if (copy) {

        copy.imgGroups = [self.imgGroups copyWithZone:zone];
    }
    
    return copy;
}


@end
