//
//  KVTabBar.h
//  lottery
//
//  Created by Kevin on 16/7/16.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KVTabBar;

@protocol KVTabBarDelegate <NSObject>

@optional

-(void)tabBar:(KVTabBar *)tabBar didClickButton:(NSInteger)index;

@end



@interface KVTabBar : UIView

@property(nonatomic,strong) NSArray *items;

@property(nonatomic,weak) id <KVTabBarDelegate> delegate;
@end

