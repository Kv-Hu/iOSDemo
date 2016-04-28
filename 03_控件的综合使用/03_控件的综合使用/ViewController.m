//
//  ViewController.m
//  03_控件的综合使用
//
//  Created by Kevin on 16-4-28.
//  Copyright (c) 2016年 KV. All rights reserved.
//

#import "ViewController.h"
#import "KVShop.h"

@interface ViewController ()
@property (nonatomic,strong)UIImageView *shopsView;
@property (nonatomic,strong)NSArray *shops;
@property (nonatomic,strong)UIButton *addBtn;
@property (nonatomic,strong)UIButton *deleteBtn;
@end



@implementation ViewController

/**重写getter方法*/
-(NSArray *)shops
{
    //创建一个字典数组,懒加载，模型的使用
    if (_shops == nil) {
      NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shops" ofType:@"plist"]];
    
    NSMutableArray *shopArray = [NSMutableArray array];
    for (NSDictionary *dict in dictArray){
    
        KVShop *shop = [KVShop shopWithDict:dict];
        [shopArray addObject:shop];
    }
        _shops = shopArray;
    }

    return _shops;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    /**创建一个shopsView*/
    UIImageView *sView = [[UIImageView alloc]init];
    sView.backgroundColor = [UIColor whiteColor];
    sView.frame = CGRectMake(50, 100, self.view.frame.size.width-100, self.view.frame.size.height-200);
    self.shopsView = sView;
    [self.view addSubview:sView];

    /**添加“添加按钮”*/
   self.addBtn = [self addButtonWithImage:@"add" highImage:@"add_highlighted" disabledImage:@"add_disabled" action:@selector(addShops) frame:CGRectMake(50, 50, 50, 50)];
    /**添加“删除按钮”*/
   self.deleteBtn = [self addButtonWithImage:@"remove" highImage:@"remove_highlighted" disabledImage:@"remove_disabled" action:@selector(deleteShop) frame:CGRectMake(220, 50, 50, 50)];
 
}

# pragma mark 添加按钮
-(UIButton *)addButtonWithImage:(NSString *)image highImage:(NSString *)highImage disabledImage:(NSString *)disabledImage action:(SEL)action frame:(CGRect)frame
{
    UIButton *btn = [[UIButton alloc]init];
    //给按钮设置背景图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage ] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:disabledImage] forState:UIControlStateDisabled];
    
    //设置按钮尺寸
    btn.frame = frame;
    
    //设置监听
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    return btn;
}

# pragma mark 增加商品方法
-(void)addShops{

    //在shopsView上创建子shopView
    UIImageView *shopView = [[UIImageView alloc]init];
    shopView.backgroundColor = [UIColor whiteColor];
    
    //确定每个shopView的尺寸
    CGFloat shopW = 50;
    CGFloat shopH = 70;
    
    //确定列数和行数
    int cols = 3;
    int rows = 2;
    
    //确定列间距和行间距
    CGFloat colMargin = (self.shopsView.frame.size.width - cols *shopW)/(cols-1);
    CGFloat rowMargin = (self.shopsView.frame.size.height - rows *shopH)/(rows-1);
    
    //确定每个商品的索引
    int index = self.shopsView.subviews.count;
    
    //确定每个商品的X坐标
    int col = index % cols;
    CGFloat shopX = col *(shopW + colMargin);
    
    //确定每个商品的Y坐标
   int row = index/cols;
    CGFloat shopY = row*(shopH + rowMargin);
    
    //确定shopView的坐标及尺寸
    shopView.frame = CGRectMake(shopX, shopY, shopW, shopH);
    
    [self.shopsView addSubview:shopView];
   
   KVShop *shop = self.shops[index];
    // 添加图片
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:shop.icon];
    iconView.frame = CGRectMake(0, 0, shopW, shopW);
    iconView.backgroundColor = [UIColor whiteColor];
    [shopView addSubview:iconView];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.text = shop.name;
    label.frame = CGRectMake(0, shopW, shopW, shopH - shopW);
    label.font = [UIFont systemFontOfSize:11];
    label.textAlignment = NSTextAlignmentCenter;
    [shopView addSubview:label];
    
    [self checkState];
 
}
# pragma mark 删除商品方法
-(void)deleteShop
{
    [[self.shopsView.subviews lastObject] removeFromSuperview];
    [self checkState];
}


- (void)checkState
{
    // 删除按钮什么时候可以点击：商品个数 > 0
    self.deleteBtn.enabled= (self.shopsView.subviews.count > 0);
    // 添加按钮什么时候可以点击：商品个数 < 总数
    self.addBtn.enabled = (self.shopsView.subviews.count < self.shops.count);


}

@end










