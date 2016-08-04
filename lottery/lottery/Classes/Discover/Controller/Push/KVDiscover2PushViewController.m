//
//  KVDiscover2PushViewController.m
//  lottery
//
//  Created by Kevin on 16/7/30.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVDiscover2PushViewController.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"


#import "KVLuckyBackGroundView.h"

@interface KVDiscover2PushViewController ()

@end

@implementation KVDiscover2PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    KVLuckyBackGroundView *backGroundView = [[KVLuckyBackGroundView alloc]
                                             init];

    [self.view addSubview:backGroundView];
    
    [backGroundView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(KVScreenWith);
        make.height.equalTo(KVScreenHeight);
       
    }];
    
    
    //添加按钮
   UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    [btn setImage:[UIImage imageNamed:@"luck_entry_birthday_button_normal"] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    [btn makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.left).offset(0);
        make.top.equalTo(self.view.top).offset(110);
        make.width.equalTo(191);
        make.height.equalTo(140);
        
    }];
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"luck_entry_roulette_button_normal"] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [btn1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(0);
        make.top.equalTo(btn.bottom).offset(100);
        make.width.equalTo(191);
        make.height.equalTo(140);
    }
     ];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"luck_entry_number_button_normal"] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.right).offset(0);
        make.top.equalTo(self.view.top).offset(160);
        make.width.equalTo(191);
        make.height.equalTo(140);
    }
     ];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setImage:[UIImage imageNamed:@"luck_entry_number_button_normal"] forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    [btn3 makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.right).offset(0);
        make.top.equalTo(btn2.bottom).offset(100);
        make.width.equalTo(191);
        make.height.equalTo(140);
    }
     ];
   
    
    //添加闪烁灯
    UIImage *image = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image1 = [UIImage imageNamed:@"lucky_entry_light1"];
    
    UIImageView *luckyLight = [[UIImageView alloc]init];
    luckyLight.image = image;
    
        luckyLight.animationImages = @[image,image1];
        luckyLight.animationDuration = 1;
        [luckyLight startAnimating];
    
    
    [self.view addSubview:luckyLight];
    
    [luckyLight makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(20);
        make.top.equalTo(self.view.top).offset(42);
        make.width.equalTo(335);
        make.height.equalTo(39);
    }
     ];
    

    
    
}




@end
