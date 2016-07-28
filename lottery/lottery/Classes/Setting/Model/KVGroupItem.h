//
//  KVGroupItem.h
//  lottery
//
//  Created by Kevin on 16/7/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVGroupItem : NSObject

@property(nonatomic,strong)NSArray *items;

@property(nonatomic,strong)NSString *headTitle;

@property(nonatomic,strong)NSString *footTitle;

+(instancetype)itemWithItems:(NSArray *)items headerTitle:(NSString *)headerTitle andFootTitle:(NSString *)footTitle;

@end
