//
//  ShopModel.m
//  iOSDemo
//
//  Created by Kevin on 16/6/6.
//
//

#import "ShopModel.h"

@implementation ShopModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)shopModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
