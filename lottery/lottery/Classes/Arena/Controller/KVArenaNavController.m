//
//  KVArenaNavController.m
//  lottery
//
//  Created by Kevin on 16/7/20.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVArenaNavController.h"

@interface KVArenaNavController ()

@end

@implementation KVArenaNavController

+(void)initialize{
 
  UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    [bar setBackgroundImage:[UIImage imageWithStrechWithImage:[UIImage imageNamed:@"NLArenaNavBar64"]] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
