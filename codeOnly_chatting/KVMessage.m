//
//  KVMessage.m
//  chattingTableView
//
//  Created by Kevin on 16/5/27.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVMessage.h"
@implementation KVMessage

+(instancetype)messageWithDict:(NSDictionary *)dict{
    KVMessage *message = [[KVMessage alloc]init];
    [message setValuesForKeysWithDictionary:dict];
    return message;
}

@end
