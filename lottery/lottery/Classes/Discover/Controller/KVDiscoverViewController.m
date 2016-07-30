
//
//  KVDiscoverViewController.m
//  lottery
//
//  Created by Kevin on 16/7/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVDiscoverViewController.h"
#import "KVDiscoverCellItem.h"
#import "KVDiscoverCell.h"

@interface KVDiscoverViewController ()

@property(nonatomic,strong)NSMutableArray *groups;

@end

@implementation KVDiscoverViewController



-(NSMutableArray *)groups{

    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }

    return _groups;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    
    [self setUpGroup1];
    [self setUpGroup2];
    [self setUpGroup3];
    [self setUpGroup4];
}


-(void)setUpGroup1{

    KVDiscoverCellItem *item = [KVDiscoverCellItem itemWithTitleImage:[UIImage imageNamed:@"discovery_groupBuy_title"] iconImage:[UIImage imageNamed:@"discovery_groupBuy_icon"] andText:@"跟着高手买，奖金一起分"];
    

    NSArray *group = @[item];
    
    [self.groups addObject:group];


}

-(void)setUpGroup2{
    
    KVDiscoverCellItem *item = [KVDiscoverCellItem itemWithTitleImage:[UIImage imageNamed:@"discovery_groupBuy_title"] iconImage:[UIImage imageNamed:@"discovery_groupBuy_icon"] andText:@"跟着高手买，奖金一起分"];
    
    
    NSArray *group = @[item];
    
    [self.groups addObject:group];
    
    
}

-(void)setUpGroup3{
    
    KVDiscoverCellItem *item = [KVDiscoverCellItem itemWithTitleImage:[UIImage imageNamed:@"discovery_groupBuy_title"] iconImage:[UIImage imageNamed:@"discovery_groupBuy_icon"] andText:@"跟着高手买，奖金一起分"];
    
    
    NSArray *group = @[item];
    
    [self.groups addObject:group];
    
    
}

-(void)setUpGroup4{
    
    KVDiscoverCellItem *item = [KVDiscoverCellItem itemWithTitleImage:[UIImage imageNamed:@"discovery_groupBuy_title"] iconImage:[UIImage imageNamed:@"discovery_groupBuy_icon"] andText:@"跟着高手买，奖金一起分"];
    
    
    NSArray *group = @[item];
    
    [self.groups addObject:group];
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    KVDiscoverCell *cell = [KVDiscoverCell cellWithTableView:tableView];
    
    //取出哪一组
    NSArray *group = self.groups[indexPath.section];
    //取出哪一行
    KVDiscoverCellItem *item = group[0];
    
    
    //给cell传递模型
    cell.item = item;
    
    return cell;


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;


}




@end
