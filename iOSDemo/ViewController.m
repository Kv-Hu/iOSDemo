//
//  ViewController.m
//  iOSDemo
//
//  Created by amoblin on 16/3/14.
//  Copyright © 2016年 amoblin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)creatButton:(UIButton *)sender {
    
    // 创建UIbutton
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    
    //  设置文字
    [btn setTitle:@"dianwoshishi" forState:UIControlStateNormal];
    
    
    // 设置图片
    UIImage *image = [UIImage imageNamed:@"btn_01"];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    
    
    
    // 设置frame
    btn.frame = CGRectMake(100, 0, 100, 100);
    
    
    
    // 修改按钮的文字颜色
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    
    
    // 添加到控制器的View上面
    [self.view addSubview:btn];
    
    
    
    // 为按钮添加事件
    [btn addTarget:self action:@selector(doSomeThing) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)doSomeThing{
    
    NSLog(@"点我干啥呢");

}

- (void)compute
{
    
    NSString *str1 = self.num1.text;
    NSString *str2 = self.num2.text;
    int result = str1.intValue + str2.intValue;
    self.sumLabel.text = [NSString stringWithFormat:@"%d",result];
    
    [self.view endEditing:YES];
    
 
    
    
    
}
@end
