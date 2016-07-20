//
//  KVMeumItem.m
//  lottery
//
//  Created by Kevin on 16/7/19.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVMeumItem.h"

@implementation KVMeumItem

+(instancetype)meumItemWith:(UIImage *)image title:(NSString *)title{

    KVMeumItem *meumItem = [[KVMeumItem alloc]init];
    meumItem.title = title;
    meumItem.image = image;
    
    return meumItem;


}

@end
