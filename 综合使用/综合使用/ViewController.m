//
//  ViewController.m
//  综合使用
//
//  Created by Kevin on 16-4-26.
//  Copyright (c) 2016年 KV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopView;

@end

@implementation ViewController
-(void)clickButtonWithImage:(NSString *)image highImage:(NSString *)highImage disabledImage:(NSString *)disabledImage  frame:(CGRect)frame action:(SEL)action{

    //创建clickButton
    UIButton *btn = [[UIButton alloc]init];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:disabledImage] forState:UIControlStateDisabled];
   
    btn.frame = frame;
    
    //监听
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    //在view上添加btn
    [self.view addSubview:btn];
}



- (void)viewDidLoad
{
        [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
   
    [self clickButtonWithImage:@"add" highImage:@"add_highlighted" disabledImage:@"add_disabled"  frame:CGRectMake(40, 20, 20, 20) action:@selector(add)];
    [self clickButtonWithImage:@"remove" highImage:@"remove_highlighted" disabledImage:@"remove_disabled"  frame:CGRectMake(250, 20, 20, 20) action:@selector(delete)];
  /*
    //添加add按钮
    UIButton *addBtn = [[UIButton alloc]init];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"add_highlighted"] forState:UIControlStateHighlighted];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"add_disabled"] forState:UIControlStateDisabled];
    addBtn.frame = CGRectMake(20, 20, 20, 20);
    [addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
   addBtn.tag = 10;
    [self.view addSubview:addBtn];
    
    
    
    //添加删除按钮
    UIButton *deleteBtn = [[UIButton alloc]init];
    [deleteBtn setBackgroundImage:[UIImage imageNamed:@"remove"] forState:UIControlStateNormal];
    [deleteBtn setBackgroundImage:[UIImage imageNamed:@"remove_highlighted"] forState:UIControlStateHighlighted];
    [deleteBtn setBackgroundImage:[UIImage imageNamed:@"remove_disabled"] forState:UIControlStateDisabled];
    deleteBtn.frame = CGRectMake(100, 20, 20, 20);
    [deleteBtn addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
   addBtn.tag = 20;
    [self.view addSubview:deleteBtn];
    */
}

-(void)add{
    
    //添加图片
    UIImageView *iconImage = [[UIImageView alloc] init];
    iconImage.image = [UIImage imageNamed:@"danjianbao"];
    iconImage.frame = CGRectMake(20, 20, 50, 50);
    [self.shopView addSubview:iconImage];
    
    //添加文字
    UILabel *label = [[UILabel alloc] init];
    //label.backgroundColor = [UIColor redColor];
    label.frame = CGRectMake(20, 70, 50, 30);
    label.text = @"单肩包";
    label.font = [UIFont systemFontOfSize:11];
    label.textAlignment = NSTextAlignmentCenter;
    [self.shopView addSubview:label];
    
    
}



-(void)delete
{
    NSLog(@"删除");

}


@end








