//
//  KVContact.h
//  contacts
//
//  Created by Kevin on 16/6/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVContact : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *phone;


+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone;


@end
