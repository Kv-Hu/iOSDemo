//
//  KVLoginViewController.m
//  contacts
//
//  Created by Kevin on 16/6/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//


#import "KVLoginViewController.h"
#import "MBProgressHUD+XMG.h"

@interface KVLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;

@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@end

@implementation KVLoginViewController

// 在执行跳转之前的时候调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    UIViewController *vc = segue.destinationViewController;
    vc.title = [NSString stringWithFormat:@"%@的联系人列表", _accountField.text];
    NSLog(@"%@--%@",segue.sourceViewController,segue.destinationViewController);
}

// 点击了登录按钮的时候调用
// kevin 123
- (IBAction)login:(id)sender {
    
    // 提示用户，正在登录ing...
    [MBProgressHUD showMessage:@"正在登录ing..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 隐藏蒙版
        [MBProgressHUD hideHUD];
        
        // 验证下账号和密码是否正确
        if ([_accountField.text isEqualToString:@"kevin"] && [_pwdField.text isEqualToString:@"123"]) { // 输入正确
            
            // 直接跳转
            // 跳转到联系人界面
            [self performSegueWithIdentifier:@"login2Contact" sender:nil];
            
        }else{ // 账号或者密码错误
            
            // 提示用户账号或者密码错误
            [MBProgressHUD showError:@"账号或者密码错误"];
            
        }
        
    });
    
    
    
}

// 记住密码开关状态改变的时候调用
- (IBAction)rmbPwdChange:(id)sender {
    // 如果取消记住密码，自动登录也需要取消勾选
    
    if (_rmbPwdSwitch.on == NO) { // 取消记住密码
        // 取消自动登录
        [_autoLoginSwitch setOn:NO animated:YES];
    }
    
    
}

// 自动登录开关状态改变的时候调用
- (IBAction)autoLoginChange:(id)sender {
    
    // 如果勾选了自动登录,记住密码也要勾选
    if (_autoLoginSwitch.on == YES) {
        [_rmbPwdSwitch setOn:YES animated:YES];
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 给文本框添加监听器,及时监听文本框内容的改变
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    
    // 判断下登录按钮能否点击
    [self textChange];
    
}

// 任一一个文本框的内容改变都会调用
- (void)textChange
{
    _loginBtn.enabled = _accountField.text.length && _pwdField.text.length;
    NSLog(@"%@--%@",_accountField.text,_pwdField.text);
}


@end
