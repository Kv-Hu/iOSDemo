//
//  KVShop.m
//  iOSDemo
//
//  Created by Kevin on 16-5-8.
//
//

#import "KVShop.h"

@implementation KVShop

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (instancetype)shopWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
