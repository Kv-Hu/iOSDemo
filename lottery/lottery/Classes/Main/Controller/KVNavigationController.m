//
//  KVNavigationController.m
//  lottery
//
//  Created by Kevin on 16/7/16.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVNavigationController.h"

@interface KVNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,strong)id target;

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
//    
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBack"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     _target = self.interactivePopGestureRecognizer.delegate;
    
    //在重新自定义了backButton之后，还原系统自带滑动返回功能
//    self.interactivePopGestureRecognizer.delegate = nil;
    
    self.delegate = self;
    
    //创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:_target action:@selector(handleNavigationTransition:)];
    
    pan.delegate = self;
    
    // 给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:pan];
    // 禁止使用系统自带的滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;
 
    /* <UIScreenEdgePanGestureRecognizer: 0x7ff801460210; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7ff80145d1b0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7ff80145fcf0>)>>
    */
  
}

#pragma mark - 

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    
    if (self.viewControllers.count == 1) {
        return NO;
    }
    
    return YES;

}


#warning TODO  调用[super pushViewController:viewController animated:animated] 放在开始或者放在最后，有什么区别？？？？？？？
//重写push方法，隐藏底部tabBar工具条等
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
  
    
    if (self.viewControllers.count != 0 ) {
        
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIImage *image = [UIImage imageNamed:@"NavBack"];
       image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //设置非根控制器的返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        
        //重写了push方法，还原控制器自带的“滑动返回”功能
         self.interactivePopGestureRecognizer.delegate = nil;
    }
    
    [super pushViewController:viewController animated:animated];
  
}

#pragma mark - <UINavigationControllerDelegate>
//当viewcontroller完全显示时，调用此方法
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (self.viewControllers.count == 1) {
        self.interactivePopGestureRecognizer.delegate = self.target;
           }

//    NSLog(@"%ld",self.viewControllers.count);

}




#warning 注意：在执行pop方法时，只要一按返回，或者滑动返回就会调用，如果，滑到一半丢开之后，pop delegate已经被还原，不能再次滑动返回，所以，需要找一个在viewControll完全展示的时候，才能还原delegate
//重写pop方法
//
//-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
//    
//    //打印：当在跟控制器时，有几个viewController，在跟控制器将delegate还原
//    NSLog(@"%ld",self.viewControllers.count);
//    
//    if (self.viewControllers.count == 2) {
//        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
//    }
//    return [super popViewControllerAnimated:animated];
//}




#pragma mark - 返回
-(void)back{


    [self popViewControllerAnimated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
