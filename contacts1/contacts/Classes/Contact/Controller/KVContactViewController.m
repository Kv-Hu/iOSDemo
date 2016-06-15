//
//  KVContactViewController.m
//  contacts
//
//  Created by Kevin on 16/6/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVContactViewController.h"
#import "KVAddViewController.h"
#import "KVContact.h"
@interface KVContactViewController ()<UIActionSheetDelegate,KVAddViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *contacts;

@end

@implementation KVContactViewController

- (NSMutableArray *)contacts
{
    if (_contacts == nil) {
        
        _contacts = [NSMutableArray array];
        
    }
    return _contacts;
}

// 跳转之前的时候调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    // 给添加控制器传递联系人控制器属性
    KVAddViewController *addVc = segue.destinationViewController;
    
    addVc.delegate = self;
}

- (void)addViewController:(KVAddViewController *)addVc didClickAddBtnWithContact:(KVContact *)contact
{
    // 把添加界面的联系人模型传递到联系人界面
    
    // 把联系人模型保存到数组
    [self.contacts addObject:contact];
    
    
    // 刷新表格
    [self.tableView reloadData];
    
}

// 点击注销的时候调用
- (IBAction)logout:(id)sender {
    
    // 弹出actionSheet
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"是否注销?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
    
}
#pragma mark - UIActionSheetDelegate
// 点击UIActionSheet控件上的按钮调用
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) { // 点击了注销
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    // 取消分割线
 
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 创建标示符
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    // 获取模型
   KVContact *c = self.contacts[indexPath.row];
    
    cell.textLabel.text = c.name;
    cell.detailTextLabel.text = c.phone;
    
    
    return cell;
}


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
