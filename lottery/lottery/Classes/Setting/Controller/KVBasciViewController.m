//
//  KVBasciViewController.m
//  lottery
//
//  Created by Kevin on 16/7/28.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVBasciViewController.h"
@class KVArrowSettingCellItem;
@class KVGroupItem;
@class KVSettingCell;


@interface KVBasciViewController ()

@end



@implementation KVBasciViewController

-(NSMutableArray *)groups{
    
    
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}


-(instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return self.groups.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    KVGroupItem *group = self.groups[section];
    
    return group.items.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //创建一个cell
    KVSettingCell *cell = [KVSettingCell cellWithTableView:tableView];
    
    //取出哪一组
    KVGroupItem *group = self.groups[indexPath.section];
    //取出哪一行
    KVSettingCellItem *item = group.items[indexPath.row];
    
    
    //给cell传递模型
    cell.item = item;
    
    return cell;
    
}


//头部标题

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    KVGroupItem *group = self.groups[section];
    
    return group.headTitle;
    
}

//尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    KVGroupItem *group = self.groups[section];
    
    return group.footTitle;
}





@end
