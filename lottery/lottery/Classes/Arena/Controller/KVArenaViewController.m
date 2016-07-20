//
//  KVArenaViewController.m
//  lottery
//
//  Created by Kevin on 16/7/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVArenaViewController.h"



@interface KVArenaViewController ()

@end

@implementation KVArenaViewController

//重写控制器View
-(void)loadView{

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:KVScreenBounds];
    
    imageView.userInteractionEnabled = YES;
    
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    
    self.view = imageView;

}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    [self setSegment];
}


-(void)setSegment{

    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"足球",@"篮球"]];
    
    //给seg添加背景图片，barMetrics只能选中UIBarMetricsDefault好用
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    seg.tintColor = KVColor(0, 142, 143);
    
#warning 这个为什么不行？？？   seg.frame.size.width = 120;
    //    seg.frame.size.width = 120;
    
    seg.frame = CGRectMake(0, 0, 141, 30);
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [seg setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    //默认选中第0个
    seg.selectedSegmentIndex = 0;
    
    self.navigationItem.titleView = seg;

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
