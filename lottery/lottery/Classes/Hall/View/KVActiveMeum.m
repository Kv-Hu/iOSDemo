//
//  KVActiveMeum.m
//  lottery
//
//  Created by Kevin on 16/7/18.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVActiveMeum.h"
#import "KVCover.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "KVHallViewController.h"

@interface KVActiveMeum ()

@property(nonatomic,strong)UIButton *btn;

@end

@implementation KVActiveMeum


+(instancetype)activeMeum{
    
    KVActiveMeum *view = [[KVActiveMeum alloc]init];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xiaopingguo"]];
    
    view.width = 200;
    view.height = 200;
    
    
    [view addSubview:imageView];
    
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.left).offset(0);
        make.right.equalTo(view.right).offset(0);
        make.top.equalTo(view.top).offset(0);
        make.bottom.equalTo(view.bottom).offset(0);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    
#warning 点击关闭按钮 出现错误！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！？？？？
    [btn addTarget:[KVHallViewController class] action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
    
    view.btn = btn;

    [view addSubview:btn];
    [btn makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view.right).offset(0);
        make.top.equalTo(view.top).offset(0);
        make.width.equalTo(25);
        make.height.equalTo(25);
    }];
    
    
    
//    return [[NSBundle mainBundle] loadNibNamed:@"KVActiveMeum" owner:nil options:nil][0];
    return view;
    
}

-(void)clickBtn:(UIButton *)btn{
    
    NSLog(@"000");
    
//    [UIView animateWithDuration:1 animations:^{
//        self.center = CGPointMake(44, 44);
//        self.transform = CGAffineTransformMakeScale(0.001, 0.001);
//    } completion:^(BOOL finished) {
//        
//        [KVCover hide];
//        [self removeFromSuperview];
//        
//        
//    }
//     ];

}




+(void)show{

    //创建窗口
   KVActiveMeum *activeMeum = [KVActiveMeum activeMeum];
   activeMeum.center = KVKeyWindow.center;

    //添加到主窗口
    [KVKeyWindow addSubview:activeMeum];

}

@end
