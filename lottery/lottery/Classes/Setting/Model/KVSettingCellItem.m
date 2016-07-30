//
//  KVSettingCellItem.m
//  lottery
//
//  Created by Kevin on 16/7/25.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVSettingCellItem.h"

@implementation KVSettingCellItem

+(instancetype)itemWithImage:(UIImage *)image andTitle:(NSString *)title{

    KVSettingCellItem *item = [[self alloc]init];
    item.image = image;
    item.title = title;
    
    return item;

}

@end
