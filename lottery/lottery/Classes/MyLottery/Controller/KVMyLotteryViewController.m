//
//  KVMyLotteryViewController.m
//  lottery
//
//  Created by Kevin on 16/7/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVMyLotteryViewController.h"

#import "KVTSettingViewController.h"

#import "KVHistoryViewController.h"

@interface KVMyLotteryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation KVMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setUpNav];
    
    UIImage *image = _loginBtn.currentBackgroundImage;
   image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    [_loginBtn setBackgroundImage:image forState:UIControlStateNormal];
 
 
    
    
    
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
    
    KVTSettingViewController *settingVc = [[KVTSettingViewController alloc]initWithStyle:UITableViewStyleGrouped];
    
//     settingVc.hidesBottomBarWhenPushed = YES;
//    
//    UIImage *backImage = [UIImage imageNamed:@"NavBack"];
//    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    settingVc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
    [self.navigationController pushViewController:settingVc animated:YES];
    
    
    }

-(void)back{

    [self.navigationController popViewControllerAnimated:YES];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
