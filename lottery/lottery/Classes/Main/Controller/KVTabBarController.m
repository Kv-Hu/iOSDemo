//
//  KVTabBarController.m
//  lottery
//
//  Created by Kevin on 16/7/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVTabBarController.h"
#import "KVHallViewController.h"
#import "KVArenaViewController.h"
#import "KVDiscoverViewController.h"
#import "KVHistoryViewController.h"
#import "KVMyLotteryViewController.h"

#import "KVTabBar.h"
#import "KVNavigationController.h"

#import "KVArenaNavController.h"
@interface KVTabBarController ()<KVTabBarDelegate>

@property(nonatomic,strong)NSMutableArray *items;

@end

@implementation KVTabBarController

-(NSMutableArray *)items{
    
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //添加自控制器
    [self setUpAllChildViewController];
   
    [self setUpTabBar];
}



#pragma mark - 重写tabbar
-(void)setUpTabBar{
    
   
    
    //创建自定义的tabBar
    KVTabBar *tabBar = [[KVTabBar alloc]init];
    
    //    tabBar.tabBarItemCount = (int)self.childViewControllers.count;
    tabBar.items = _items;
    
    
    
    tabBar.delegate = self;
    
    tabBar.backgroundColor = [UIColor redColor];
    
    
#warning TODO  tabBar.frame = self.tabBar.bounds;和tabBar.frame = self.tabBar.frame的区别？？？？？？？？？？
    tabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabBar];

}


//在viewWillAppear方法中，删除掉某些view
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[KVTabBar class]]) {
            [childView removeFromSuperview];
        }
    }

}

#pragma mark - <KVTabBarDelegate>

-(void)tabBar:(KVTabBar *)tabBar didClickButton:(NSInteger)index{

    self.selectedIndex = index;

}




#pragma mark - 添加所有子控制器
-(void)setUpAllChildViewController{

    //购彩大厅
    KVHallViewController *hallVc = [[KVHallViewController alloc]init];
    
    [self setUpOneChildViewController:hallVc withImage:[UIImage imageNamed:@"TabBar_LotteryHall_new"] andSelectImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] andTitle:@"购彩大厅"];
    
    //竞技场
    KVArenaViewController *arenaVc = [[KVArenaViewController alloc] init];
    [self setUpOneChildViewController:arenaVc withImage:[UIImage imageNamed:@"TabBar_Arena_new"] andSelectImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] andTitle:nil];
    
#warning TODO 为什么将storyBoard的class设置成KVDiscoverController就不行？？？？？？？？？？？？？？？
    //发现
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"KVDiscoverViewController" bundle:nil];
//    
//    KVDiscoverViewController *discoverVc = [storyBoard instantiateInitialViewController];
     KVDiscoverViewController *discoverVc = [[KVDiscoverViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self setUpOneChildViewController:discoverVc withImage:[UIImage imageNamed:@"TabBar_Discovery_new"] andSelectImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] andTitle:@"发现"];
    
    //开奖信息
    
    KVHistoryViewController *historyVc = [[KVHistoryViewController alloc]init];
    [self setUpOneChildViewController:historyVc withImage:[UIImage imageNamed:@"TabBar_History_new"] andSelectImage:[UIImage imageNamed:@"TabBar_History_selected_new"] andTitle:@"开奖信息"];
    //我的彩票
    KVMyLotteryViewController *myLotteryVc = [[KVMyLotteryViewController alloc]init];
    [self setUpOneChildViewController:myLotteryVc withImage:[UIImage imageNamed:@"TabBar_MyLottery_new"] andSelectImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] andTitle:@"我的彩票"];
    
}

#pragma  mark - 添加一个子控制器
-(void)setUpOneChildViewController:(UIViewController *)viewController withImage:(UIImage *)image andSelectImage:(UIImage *)selectImage andTitle:(NSString *)title
{
   
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = selectImage;
    [self.items addObject:viewController.tabBarItem];
    
   
//    viewController.view.backgroundColor = [self randomColor];
    
    UINavigationController *nav = [[KVNavigationController alloc] init];
    
    if ([viewController isKindOfClass:[KVArenaViewController class]]) {
        
       nav = [[KVArenaNavController alloc]initWithRootViewController:viewController];
        
    }else{
    
    nav = [[KVNavigationController alloc] initWithRootViewController:viewController];
    
    }
    
    //设置导航条背景图片，一定要在导航条显示之前设置
//     [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];

    [self addChildViewController:nav];
    
     viewController.navigationItem.title = title;
}
#pragma  mark - 随机颜色（rgb）
-(UIColor *)randomColor{
    
    //r
    CGFloat r = arc4random_uniform(256)/255.0;
    //g
    CGFloat g = arc4random_uniform(256)/255.0;
    //b
    CGFloat b = arc4random_uniform(256)/255.0;

    return [UIColor colorWithRed:r green:g blue:b alpha:1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
