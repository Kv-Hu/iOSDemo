//
//  KVMeumItem.h
//  lottery
//
//  Created by Kevin on 16/7/19.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KVMeumItem : NSObject

@property(nonatomic,strong) NSString * title;

@property(nonatomic,strong) UIImage * image;

+(instancetype)meumItemWith:(UIImage *)image title:(NSString *)title;

@end
