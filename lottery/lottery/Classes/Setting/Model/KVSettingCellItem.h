//
//  KVSettingCellItem.h
//  lottery
//
//  Created by Kevin on 16/7/25.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVSettingCellItem : NSObject

@property (nonatomic,strong) UIImage *image;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *subTitle;

//用来保存每一行cell的功能
@property(nonatomic,strong) void(^itemOpreation)();

+(instancetype)itemWithImage:(UIImage *)image andTitle:(NSString *)title ;

@end
