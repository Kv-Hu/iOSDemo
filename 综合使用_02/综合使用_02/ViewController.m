//
//  ViewController.m
//  综合使用_02
//
//  Created by Kevin on 16-4-27.
//  Copyright (c) 2016年 KV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopsView;
@property (weak,nonatomic) UIButton *addBtn;
@property (weak,nonatomic) UIButton *deleteBtn;
@property (strong,nonatomic) NSArray *shops;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
	
    
    /**add“添加按钮”*/
   self.addBtn =  [self addClickButtonWithImage:@"add" highImage:@"add_hightlighted" disabledImage:@"add_disabled" frame:CGRectMake(40, 20, 50, 50) action:@selector(addShop)];
 
    /**add“删除按钮”*/
   self.deleteBtn = [self addClickButtonWithImage:@"remove" highImage:@"remove_highlighted" disabledImage:@"remove_disabled" frame:CGRectMake(140, 20, 50, 50) action:@selector(deleteShop)];
    
}

/**增加按钮的方法*/
- (UIButton *)addClickButtonWithImage:(NSString *)image highImage:(NSString *)highImage disabledImage:(NSString *)disabledImage frame:(CGRect)frame action:(SEL)action
{
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = frame;
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:disabledImage] forState:UIControlStateDisabled];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    return btn;

}

- (void)addShop
{
    
    //创建一个shopsView
   /* UIView *shopsView = [[UIView alloc]init];
    shopsView.backgroundColor = [UIColor whiteColor];
    shopsView.frame = CGRectMake(20, 100, self.view.frame.size.width-40, self.view.frame.size.height-200);
    [self.view addSubview:shopsView];
    
*/

 
    //确定shopView的尺寸
    CGFloat shopW = 50;
    CGFloat shopH = 70;
    
    //确定列数
    int cols = 3;
    //确定行数
    int rows = 3;
    
    //确定每列之间的列间距
    CGFloat colMargin = (self.shopsView.frame.size.width - cols*shopW)/(cols-1);
    //确定每行之间的行间距
    CGFloat rowMargin = (self.shopsView.frame.size.height - rows*shopH)/(rows-1);
    
    //获取shopsView子控件（shopView）的索引
    NSUInteger index = self.shopsView.subviews.count;
    NSLog(@"index = %i",index);
    
    //确定每个shopView的X坐标
    NSInteger col = index % cols;
    CGFloat shopX = col *(shopW + colMargin);
    //确定每个shopView的Y坐标
    NSInteger row = index/cols;
    CGFloat shopY = row *(shopH +rowMargin);
   
    /**创建一个商品shopView*/
    UIView *shopView = [[UIView alloc]init];
    shopView.backgroundColor = [UIColor whiteColor];
    
    shopView.frame = CGRectMake(shopX, shopY, shopW, shopH);
    [self.shopsView addSubview:shopView];
    
    //数据处理
    self.shops = @[
                   @{
                       @"icon" : @"danjianbao",
                       @"name" : @"单肩包"
                       },
                   @{
                       @"icon" : @"liantiaobao",
                       @"name" : @"链条包"
                       },
                   @{
                       @"icon" : @"qianbao",
                       @"name" : @"钱包"
                       },
                   @{
                       @"name" : @"手提包",
                       @"icon" : @"shoutibao.png"
                       },
                   @{
                       @"name" : @"双肩包",
                       @"icon" : @"shuangjianbao.png"
                       },
                   @{
                       @"name" : @"斜挎包",
                       @"icon" : @"xiekuabao.png"
                       },
                   @{
                       @"name" : @"手提包",
                       @"icon" : @"shoutibao.png"
                       },
                   @{
                       @"name" : @"双肩包",
                       @"icon" : @"shuangjianbao.png"
                       },
                   @{
                       @"name" : @"斜挎包",
                       @"icon" : @"xiekuabao.png"
                       }
                   ];
    NSDictionary *shop = self.shops[index];

    /**在shopView上添加图片*/
    
    UIImageView *iconView = [[UIImageView alloc]init];
    iconView.image = [UIImage imageNamed:shop[@"icon"]];
    iconView.frame = CGRectMake(0, 0, shopW, shopW);
    [shopView addSubview:iconView];
    
    /**在shopView上添加文字*/
    
    UILabel *shopLabel = [[UILabel alloc]init];
    shopLabel.text = shop[@"name"];
    shopLabel.frame = CGRectMake(0, shopW, shopW, shopH-shopW);
    shopLabel.font = [UIFont systemFontOfSize:12];
    shopLabel.textAlignment = NSTextAlignmentCenter;
    shopLabel.backgroundColor = [UIColor whiteColor];
    [shopView addSubview:shopLabel];
 
    [self checkState];
}

/**删除shopView*/
- (void)deleteShop
{
    
    [[self.shopsView.subviews lastObject] removeFromSuperview];
    [self checkState];
}

- (void)checkState
{
    self.deleteBtn.enabled = (self.shopsView.subviews.count > 0);
    self.addBtn.enabled = (self.shopsView.subviews.count < 9);
}

@end












