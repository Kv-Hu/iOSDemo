//
//  KVDiscoverCellItem.m
//  lottery
//
//  Created by Kevin on 16/7/30.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVDiscoverCellItem.h"


@implementation KVDiscoverCellItem

+(instancetype)itemWithTitleImage:(UIImage *)titleImage iconImage:(UIImage *)iconImage andText:(NSString *)text{



    KVDiscoverCellItem *item = [[KVDiscoverCellItem alloc]init];
    item.titleImage = titleImage;
    item.iconImage = iconImage;
    item.text = text;
    


    return item;
}

@end
