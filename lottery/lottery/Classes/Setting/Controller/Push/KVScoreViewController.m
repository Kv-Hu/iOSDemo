//
//  KVScoreViewController.m
//  lottery
//
//  Created by Kevin on 16/7/29.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVScoreViewController.h"
#import "KVSettingCellItem.h"
#import "KVBasciViewController.h"


@interface KVScoreViewController ()

@end

@implementation KVScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup1];
    
    [self setUpGroup2];
}



-(void)setUpGroup1{

    KVSettingCellItem *item = [KVSwitchSettingCellItem itemWithImage:nil andTitle:@"推送我关注的比赛"];
    

    
    KVGroupItem *group = [KVGroupItem itemWithItems:@[item] headerTitle:nil andFootTitle:@"**************************"];
    [self.groups addObject:group];

}

-(void)setUpGroup2{
    
    KVSettingCellItem *item= [KVSettingCellItem itemWithImage:nil andTitle:@"起始时间"];
    item.subTitle = @"00:00";
    
    
#warning block会把代码里所有的强指针全部强引用
    
    item.itemOpreation = ^()
    {
        //弹出键盘
        UITextField *textField = [[UITextField alloc]init];
        
        [textField becomeFirstResponder];
        
        [self.view addSubview:textField];
        
        
    };
    
    KVGroupItem *group = [KVGroupItem itemWithItems:@[item] headerTitle:nil andFootTitle:nil];

    [self.groups addObject:group];


}


@end
