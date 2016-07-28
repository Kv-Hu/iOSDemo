//
//  KVTSettingViewController.m
//  lottery
//
//  Created by Kevin on 16/7/22.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVTSettingViewController.h"

#import "KVSettingCellItem.h"

#import "KVGroupItem.h"
#import "KVArrowSettingCellItem.h"
#import "KVSwitchSettingCellItem.h"

#import "KVSettingCell.h"

#import "KVBlurView.h"
#import "MBProgressHUD+XMG.h"

#import "KVPushViewController.h"
#import "KVBasciViewController.h"

@interface KVTSettingViewController ()


@end

@implementation KVTSettingViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    
    [self setUpGroup0];
    [self setUpGroup1];
    [self setUpGroup2];
}

- (void)setUpGroup0{
    
    KVArrowSettingCellItem *RedeemCode = [KVArrowSettingCellItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] andTitle:@"推送"];
//    RedeemCode.itemOpreation = ^{
//    
//        UIViewController *view = [[UIViewController alloc]init];
//        
//        view.view.backgroundColor = [UIColor redColor];
//        
//        [self.navigationController pushViewController:view animated:YES];
//
//    };
    
   //给RedeemCode.destVc 赋值
    RedeemCode.destVc = [KVPushViewController class];
    
    KVGroupItem *group = [KVGroupItem itemWithItems:@[RedeemCode] headerTitle:nil andFootTitle:nil];
    
    [self.groups addObject:group];
}

- (void)setUpGroup1{
    
    KVArrowSettingCellItem *RedeemCode = [KVArrowSettingCellItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] andTitle:@"使用兑换码"];
    
     KVSwitchSettingCellItem *RedeemCode1 = [KVSwitchSettingCellItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] andTitle:@"使用兑换码"];
    
    KVSwitchSettingCellItem *RedeemCode2 = [KVSwitchSettingCellItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] andTitle:@"使用兑换码"];
    
    KVSwitchSettingCellItem *RedeemCode3 = [KVSwitchSettingCellItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] andTitle:@"使用兑换码"];
    
    KVGroupItem *group = [KVGroupItem itemWithItems:@[RedeemCode,RedeemCode1,RedeemCode2,RedeemCode3] headerTitle:nil andFootTitle:nil];
    
    [self.groups addObject:group];
}

- (void)setUpGroup2{
    
    KVArrowSettingCellItem *RedeemCode = [KVArrowSettingCellItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] andTitle:@"检查版本"];
    
    RedeemCode.itemOpreation = ^{
    
        KVBlurView *blurView = [[KVBlurView alloc]initWithFrame:KVScreenBounds];
        
        [KVKeyWindow addSubview:blurView];
      
        [MBProgressHUD showSuccess:@"当前已是最新版本"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [blurView removeFromSuperview];
        });
        
    
    };
    
    
    
    KVArrowSettingCellItem *RedeemCode1 = [KVArrowSettingCellItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] andTitle:@"使用兑换码"];
    
    KVArrowSettingCellItem *RedeemCode2 = [KVArrowSettingCellItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] andTitle:@"使用兑换码"];
    
    KVArrowSettingCellItem *RedeemCode3 = [KVArrowSettingCellItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] andTitle:@"使用兑换码"];
    
    KVGroupItem *group = [KVGroupItem itemWithItems:@[RedeemCode,RedeemCode1,RedeemCode2,RedeemCode3] headerTitle:nil andFootTitle:nil];
    
    
    [self.groups addObject:group];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    KVGroupItem *group = self.groups[indexPath.section];
    KVSettingCellItem *item = group.items[indexPath.row];
    
    //判断block块有没有值，如果有，执行block
    if (item.itemOpreation) {
        item.itemOpreation();
    }
    
    //判断所点击的这一行 是不是KVArrowSettingCellItem类，如果是，判断arrowItem.className有没有值，如果有值 则执行跳转
    if ([item isKindOfClass:[KVArrowSettingCellItem class]]) {
        KVArrowSettingCellItem *arrowItem = (KVArrowSettingCellItem *)item;
        if (arrowItem.destVc) {
            
     UIViewController *vc = [[arrowItem.destVc alloc]init];
            
            [self.navigationController pushViewController:vc animated:YES];
      
        }
    }
}




@end
