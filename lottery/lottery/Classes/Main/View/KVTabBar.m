//
//  KVTabBar.m
//  lottery
//
//  Created by Kevin on 16/7/16.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVTabBar.h"

@interface KVTabBar ()

@property(nonatomic,strong) UIButton *selectdBtton;


@end

@implementation KVTabBar


-(void)setItems:(NSArray *)items{
    _items = items;
    
    for (UITabBarItem *item in items) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        btn.tag = self.subviews.count;
        //监听tabBarButton的点击
        [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
 
        [self addSubview:btn];
        
        
        //默认选中第0个
        if (self.subviews.count == 1) {
            [self  clickButton:btn];
        }
    }
}


#pragma mark - 监听tabBarButton的点击
-(void)clickButton:(UIButton *)btn
{
    _selectdBtton.selected = NO;
    
    btn.selected = YES;
    
    _selectdBtton = btn;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didClickButton:)]){
 
        [_delegate tabBar:self didClickButton:btn.tag];
     }
        
        
 

}


-(void)layoutSubviews{

    [super layoutSubviews];
    int count = (int)self.subviews.count;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = self.bounds.size.width/count;
    CGFloat h = self.bounds.size.height;
    
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        
        x = i*w;
        
        btn.frame = CGRectMake(x, y, w, h);
    }

}

//
//-(void)setTabBarItemCount:(int)tabBarItemCount{
//
//    _tabBarItemCount = tabBarItemCount;
//    
//    for (int i = 0; i < self.tabBarItemCount; i++) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        
////        btn setBackgroundImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#>
//        
//        [self addSubview:btn];
//    }
//
//}



@end
