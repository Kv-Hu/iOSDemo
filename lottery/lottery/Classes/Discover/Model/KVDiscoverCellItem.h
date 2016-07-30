//
//  KVDiscoverCellItem.h
//  lottery
//
//  Created by Kevin on 16/7/30.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVDiscoverCellItem : NSObject


@property(nonatomic,strong)UIImage *titleImage;

@property(nonatomic,strong)UIImage *iconImage;

@property(nonatomic,strong)NSString *text;


+(instancetype)itemWithTitleImage:(UIImage *)image iconImage:(UIImage *)iconImage andText:(NSString *)text;
@end
