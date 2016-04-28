//
//  KVShop.h
//  03_控件的综合使用
//
//  Created by Kevin on 16-4-28.
//  Copyright (c) 2016年 KV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVShop : NSObject
/** 商品名称 */
@property (nonatomic, strong) NSString *name;
/** 图标 */
@property (nonatomic, strong) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)shopWithDict:(NSDictionary *)dict;

@end
