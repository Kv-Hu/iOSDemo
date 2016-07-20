//
//  KVNavigationController.m
//  lottery
//
//  Created by Kevin on 16/7/16.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVNavigationController.h"

@interface KVNavigationController ()

@end

@implementation KVNavigationController

+(void)initialize{
    
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    //设置导航条字体颜色
    NSMutableDictionary *titleArr = [NSMutableDictionary dictionary];
    titleArr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleArr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    [bar setTitleTextAttributes:titleArr];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
