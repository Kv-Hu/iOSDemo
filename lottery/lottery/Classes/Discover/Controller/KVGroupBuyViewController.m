//
//  KVGroupBuyViewController.m
//  lottery
//
//  Created by Kevin on 16/7/20.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVGroupBuyViewController.h"
#import "KVButton.h"

@interface KVGroupBuyViewController ()

@property(nonatomic,strong)KVButton *titleView;

@end

@implementation KVGroupBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KVButton *titleView = [KVButton buttonWithType:UIButtonTypeCustom];
    
    [titleView setTitle:@"全部彩种" forState:UIControlStateNormal];
    [titleView setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    
    [titleView sizeToFit];
    _titleView = titleView;
    
    self.navigationItem.titleView = _titleView;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"帮助" style:UIBarButtonItemStylePlain target:self action:@selector(help)];
}


-(void)help{
    
    if ([_titleView.titleLabel.text isEqualToString:@"全部彩种"]) {
        [_titleView setTitle:@"帮助中心为您服务" forState:UIControlStateNormal];
    }else{
    
        [_titleView setTitle:@"全部彩种" forState:UIControlStateNormal];
    }

    

}




@end