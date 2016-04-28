//
//  KVShop.m
//  03_控件的综合使用
//
//  Created by Kevin on 16-4-28.
//  Copyright (c) 2016年 KV. All rights reserved.
//

#import "KVShop.h"

@implementation KVShop

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;

}

+(id)shopWithDict:(NSDictionary *)dict
{
    
    return [[self alloc] initWithDict:dict];


}

@end
