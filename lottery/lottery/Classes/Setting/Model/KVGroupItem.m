
//
//  KVGroupItem.m
//  lottery
//
//  Created by Kevin on 16/7/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVGroupItem.h"

@implementation KVGroupItem

+(instancetype)itemWithItems:(NSArray *)items headerTitle:(NSString *)headerTitle andFootTitle:(NSString *)footTitle{

    KVGroupItem *group = [[KVGroupItem alloc]init];
    
    group.headTitle = headerTitle;
    group.footTitle = footTitle;
   
    group.items = items;
    
    return group;

}

@end
