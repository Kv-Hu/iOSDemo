//
//  KVAddViewController.m
//  contacts
//
//  Created by Kevin on 16/6/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVAddViewController.h"
#import "KVContact.h"


@interface KVAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation KVAddViewController

// 点击添加的时候调用
- (IBAction)add:(id)sender {
    // 0.把文本框的值包装成联系人模型
    KVContact *c = [KVContact contactWithName:_nameField.text phone:_phoneField.text];
    
    // 1.通知代理做事情
    // _delegate = _contactVc
    if ([_delegate respondsToSelector:@selector(addViewController:didClickAddBtnWithContact:)]) {
        [_delegate addViewController:self didClickAddBtnWithContact:c];
    }
    
    
    // 2.回到联系人控制器
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 给文本框添加监听器,及时监听文本框内容的改变
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 主动弹出姓名文本框
    [_nameField becomeFirstResponder];
}

// 任一一个文本框的内容改变都会调用
- (void)textChange
{
    _addBtn.enabled = _nameField.text.length && _phoneField.text.length;
    
}

@end
