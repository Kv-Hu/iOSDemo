//
//  ViewController.m
//  chattingTableView
//
//  Created by Kevin on 16/5/27.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "KVMessageCell.h"
#import "KVMessage.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic) UITableView *tableView;
@property(strong,nonatomic) UIView *bottomView;
@property (strong,nonatomic) NSArray *messages;
@property(strong,nonatomic) UIButton *vocieButton;
@property(strong,nonatomic) UIButton *addButton;
@property(strong,nonatomic) UIButton *smileButton;
@property(strong,nonatomic) UITextField *contentField;
@end
@implementation ViewController

//懒加载 重写getter方法
-(NSArray *)messages{
    if (_messages == nil) {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *messagesArray = [NSMutableArray array];
        
        KVMessage *lastMessage = nil;
        for (NSDictionary *dict in dictArray) {
            KVMessage *message = [KVMessage messageWithDict:dict];
            message.timeHide = [message.time isEqualToString:lastMessage.time];
            [messagesArray addObject:message];
            lastMessage = message;
        }
        _messages = messagesArray;
    }
    return _messages;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    //创建tableView
    UITableView *tableView = [[UITableView alloc] init];
    tableView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:tableView];
     _tableView = tableView;
    //创建底部工具条bottomView
    UIView *bottomView = [[UIView alloc] init];
    //bottomView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bottomView];
    _bottomView = bottomView;
    //创建底部工具条的最左边的button
    UIButton *vocieButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [vocieButton setBackgroundImage:[UIImage imageNamed:@"chat_bottom_voice_nor"] forState:UIControlStateNormal];
    [vocieButton setBackgroundImage:[UIImage imageNamed:@"chat_bottom_voice_press"] forState:UIControlStateHighlighted];
    [self.bottomView addSubview:vocieButton];
    _vocieButton = vocieButton;
    //创建底部工具条最右边的addbutton
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setBackgroundImage:[UIImage imageNamed:@"chat_bottom_up_nor"] forState:UIControlStateNormal];
    [addButton setBackgroundImage:[UIImage imageNamed:@"chat_bottom_up_press"] forState:UIControlStateHighlighted];
    [self.bottomView addSubview:addButton];
    _addButton = addButton;
    //创建smileButton
    UIButton *smileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [smileButton setBackgroundImage:[UIImage imageNamed:@"chat_bottom_smile_nor"] forState:UIControlStateNormal];
    [smileButton setBackgroundImage:[UIImage imageNamed:@"chat_bottom_smile_press"] forState:UIControlStateHighlighted];
    [self.bottomView addSubview:smileButton];
    _smileButton = smileButton;
    //创建contentFelid
    UITextField *contentField = [[UITextField alloc]init];
    contentField.background = [UIImage imageNamed:@"chat_bottom_bg"];
   
    [self.bottomView addSubview:contentField];
    _contentField = contentField;
    
    UIView *leftView = [[UIView alloc]init];
    leftView.frame = CGRectMake(0, 0,10, 0);
    self.contentField.leftView = leftView;
    self.contentField.leftViewMode = UITextFieldViewModeAlways;
    
 
    //添加tableview约束
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(0);
        make.right.equalTo(self.view.right).offset(0);
        make.bottom.equalTo(bottomView.top).offset(0);
       // make.top.equalTo(self.view.top).offset(0);
        make.height.equalTo(self.view.height).offset(-44);
    }];
    
    //添加bottomview的约束
    [bottomView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(0);
        make.right.equalTo(self.view.right).offset(0);
        make.height.equalTo(44);
        make.bottom.equalTo(self.view.bottom).offset(0);
    }];
    //添加vocieButton的约束
    [self.vocieButton makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(44);
        make.width.equalTo(44);
        make.left.equalTo(self.bottomView.left).offset(0);
        make.top.equalTo(self.bottomView.top).offset(0);
    }];
    //添加addButton的约束
    [self.addButton makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(44);
        make.width.equalTo(44);
        make.top.equalTo(self.bottomView.top).offset(0);
        make.right.equalTo(self.bottomView.right).offset(0);
    }];
    //添加smileButton的约束
    [self.smileButton makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(44);
        make.width.equalTo(44);
        make.right.equalTo(self.addButton.left).offset(0);
        make.top.equalTo(self.bottomView).offset(0);
    }];
    //添加contentField的约束
    [self.contentField makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomView.bottom).offset(-5);
        make.left.equalTo(self.vocieButton.right).offset(0);
        make.right.equalTo(self.smileButton.left).offset(0);
        make.top.equalTo(self.bottomView.top).offset(5);
    }];

    //设置控制器为tableview的数据源代理
    self.tableView.dataSource = self;
    self.tableView.delegate =self;
    
    //接受键盘弹出的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //接收键盘退出的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

//键盘弹出
-(void) keyboardWillShow:(NSNotification *)note{

   
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardH =   rect.size.height;
    [self.bottomView updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.bottom).offset(-keyboardH);
    }];
    
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(void) keyboardWillHide:(NSNotification *)note{
    [self.bottomView updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.bottom).offset(0);
    }];

}


#pragma mark   <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KVMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (cell == nil) {
        cell = [[KVMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"a"];
    }
    cell.message = self.messages[indexPath.row];
    return cell;
}


#pragma mark  <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    KVMessage *message = self.messages[indexPath.row];
   return  message.cellHeight;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];

}
@end




