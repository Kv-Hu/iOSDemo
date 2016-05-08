//
//  ViewController.m
//  iOSDemo
//
//  Created by amoblin on 16/3/14.
//  Copyright © 2016年 amoblin. All rights reserved.
//

#import "ViewController.h"
#import "KVAddCaculater.h"
#import "KVShopView.h"
#import "KVShop.h"
@interface ViewController ()
@property (strong, nonatomic) NSArray *shops;
@end

@implementation ViewController
- (NSArray *)shops
{
    if (_shops == nil) {
        // 加载一个字典数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shops" ofType:@"plist"]];
        
        NSMutableArray *shopArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
           KVShop *shop = [KVShop shopWithDict:dict];
            [shopArray addObject:shop];
        }
        _shops = shopArray;
    }
    return _shops;
}
-(void)viewDidLoad{
    //caculater功能
    /*
    KVAddCaculater *caculater = [KVAddCaculater addCaculater];
    CGFloat caculaterW = self.view.frame.size.width;
    caculater.frame = CGRectMake(0 , 20, caculaterW, 200);
    [self.view addSubview:caculater];
    */
    
    self.addBtn = [self buttonWithImage:@"add" highImge:@"add_highlighted" disabledImage:@"add_disabled" andFrame:CGRectMake(40, 20, 50, 50) action:@selector(add)];
    
    self.removeBtn = [self buttonWithImage:@"remove" highImge:@"remove_highlighted" disabledImage:@"remove_disabled" andFrame:CGRectMake(220, 20, 50, 50) action:@selector(remove)];
}

-(UIButton *)buttonWithImage:(NSString *)image highImge:(NSString *)highImage disabledImage:(NSString *)disabledImage andFrame:(CGRect)frame action:(SEL)action
{
    
    // 创建按钮
    UIButton *btn = [[UIButton alloc] init];
    // 设置背景图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:disabledImage] forState:UIControlStateDisabled];
    // 设置位置和尺寸
    btn.frame = frame;
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    return btn;
    

}
#pragma mark 添加
- (void)add
{
    // 每一个商品的尺寸
    CGFloat shopW = 80;
    CGFloat shopH = 90;
    
    // 一行的列数
    int cols = 3;
    
    // 每一列之间的间距
    CGFloat colMargin = (self.shopsView.frame.size.width - cols * shopW) / (cols - 1);
    // 每一行之间的间距
    CGFloat rowMargin = 10;
    
    // 商品的索引
    NSUInteger index = self.shopsView.subviews.count;
    
    // 创建一个父控件（整体：存放图片和文字）
KVShopView *shopView = [KVShopView shopViewWithShop:self.shops[index]];
    
    // 商品的x值
    NSUInteger col = index % cols;
    CGFloat shopX = col * (shopW + colMargin);
    
    // 商品的y值
    NSUInteger row = index / cols;
    CGFloat shopY = row * (shopH + rowMargin);
    
    shopView.frame = CGRectMake(shopX, shopY, shopW, shopH);
    
    // 添加控件
    [self.shopsView addSubview:shopView];
    [self checkState];
}

#pragma mark 删除
- (void)remove
{
    [[self.shopsView.subviews lastObject] removeFromSuperview];
    
    [self checkState];
}

- (void)checkState
{
    // 删除按钮什么时候可以点击：商品个数 > 0
    self.removeBtn.enabled = (self.shopsView.subviews.count > 0);
    // 添加按钮什么时候可以点击：商品个数 < 总数
    self.addBtn.enabled = (self.shopsView.subviews.count < 6);
}
@end
