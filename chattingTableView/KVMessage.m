//
//  KVMessage.m
//  iOSDemo
//
//  Created by Kevin on 16/5/26.
//
//

#import "KVMessage.h"

@implementation KVMessage

+(instancetype)messageWithDict:(NSDictionary *)dict{

    KVMessage *message = [[KVMessage alloc]init];
    [message setValuesForKeysWithDictionary:dict];
    return message;

}



@end
