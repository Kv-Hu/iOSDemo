//
//  KVMyLotteryViewController.m
//  lottery
//
//  Created by Kevin on 16/7/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVMyLotteryViewController.h"

@interface KVMyLotteryViewController ()

@end

@implementation KVMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setUpNav];
}

//设置导航条
-(void )setUpNav{
    
    //设置左边按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:(UIControlStateNormal)];

    [btn sizeToFit];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barBtn;
    
    //设置右边按钮

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithOrigin:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
}

-(void)setting{

    NSLog(@"点击了设置按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
