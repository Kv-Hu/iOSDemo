//
//  KVContact.m
//  contacts
//
//  Created by Kevin on 16/6/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVContact.h"
@implementation KVContact


+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone
{
    KVContact *c = [[self alloc] init];
    
    c.name = name;
    c.phone = phone;
    
    return c;
}
@end
