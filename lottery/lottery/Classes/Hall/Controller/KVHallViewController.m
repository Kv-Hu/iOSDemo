//
//  KVHallViewController.m
//  lottery
//
//  Created by Kevin on 16/7/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVHallViewController.h"
#import "KVCover.h"
#import "KVActiveMeum.h"
#import "KVDownMeum.h"
#import "KVMeumItem.h"



@interface KVHallViewController ()

@property(nonatomic,weak)KVDownMeum *downMeum;

@property(nonatomic,assign)BOOL isPopMeum;

@end


@implementation KVHallViewController

-(KVDownMeum *)downMeum{

    if (_downMeum == nil) {
        
        KVMeumItem *item = [KVMeumItem meumItemWith:[UIImage imageNamed:@"Development"] title:nil];
        KVMeumItem *item1 = [KVMeumItem meumItemWith:[UIImage imageNamed:@"Development"] title:nil];
        KVMeumItem *item2= [KVMeumItem meumItemWith:[UIImage imageNamed:@"Development"] title:nil];
        KVMeumItem *item3 = [KVMeumItem meumItemWith:[UIImage imageNamed:@"Development"] title:nil];
        KVMeumItem *item4 = [KVMeumItem meumItemWith:[UIImage imageNamed:@"Development"] title:nil];
        KVMeumItem *item5 = [KVMeumItem meumItemWith:[UIImage imageNamed:@"Development"] title:nil];
        NSArray *array = @[item,item1,item2,item3,item4,item5];
        
        _downMeum = [KVDownMeum showInView:self.view items:array andOriginY:0];
  
    }

    return _downMeum;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNav];

}

#pragma mark - 设置导航条左右按钮
-(void)setUpNav{
    
//设置导航条左边按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithOrigin:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(active)];
    
    //设置导航条右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithOrigin:@"Development"] style:UIBarButtonItemStylePlain target:self action:@selector(popMeum)];
}

#pragma mark - 点击下拉按钮
-(void)popMeum{
    
    if (_isPopMeum == NO) {
        //懒加载，调用downMeum的getter方法
        [self downMeum];
    }else{
        [_downMeum hide];
        
    }
        
    _isPopMeum = !_isPopMeum;
    
    
}



-(void)active{

    NSLog(@"点击了活动按钮");
    [KVCover show];
    [KVActiveMeum show];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
