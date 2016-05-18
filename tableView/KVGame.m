//
//  KVGame.m
//  iOSDemo
//
//  Created by Kevin on 16-5-18.
//
//

#import "KVGame.h"

@implementation KVGame
+(instancetype)gameWithDict:(NSDictionary *)dict{

    KVGame *game = [[KVGame alloc] init];
    
    [game setValuesForKeysWithDictionary:dict];

    return game;
}
@end
