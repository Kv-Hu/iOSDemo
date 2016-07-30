//
//  KVPushViewController.m
//  lottery
//
//  Created by Kevin on 16/7/28.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVPushViewController.h"
#import "KVBasciViewController.h"

#import "KVScoreViewController.h"



@interface KVPushViewController ()

@end

@implementation KVPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];

    [self group1];
}


-(void)group1{

    KVArrowSettingCellItem *arrowItem =[KVArrowSettingCellItem itemWithImage:[UIImage imageNamed:@"sound_Effect"] andTitle:@"音乐"];
    
    KVArrowSettingCellItem *arrowItem1 =[KVArrowSettingCellItem itemWithImage:[UIImage imageNamed:@"sound_Effect"] andTitle:@"比分直播"];
    arrowItem1.destVc = [KVScoreViewController class];
    
    
    KVArrowSettingCellItem *arrowItem2 =[KVArrowSettingCellItem itemWithImage:[UIImage imageNamed:@"sound_Effect"] andTitle:@"音乐"];
   
    KVGroupItem *group = [KVGroupItem itemWithItems:@[arrowItem,arrowItem1,arrowItem2] headerTitle:nil andFootTitle:nil];
    
    
#warning  _groups和self.groups的区别？？？？？？？？？？为什么self.groups就可以？？？！！！！！！！！！！！
  [self.groups addObject:group];
   
}



//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//
//
//}







@end
