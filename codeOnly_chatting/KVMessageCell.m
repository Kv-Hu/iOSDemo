//
//  KVMessageCell.m
//  chattingTableView
//
//  Created by Kevin on 16/5/27.
//  Copyright © 2016年 Kevin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "KVMessageCell.h"
#import "KVMessage.h"
@interface KVMessageCell()

@property(nonatomic,strong) UIImageView *iconView;
@property(strong,nonatomic) UIButton *contentButton;
@property(strong,nonatomic) UILabel *timeLabel;

@property(strong,nonatomic) UIImageView *otherIconView;
@property(strong,nonatomic) UIButton *otherContentButton;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier;
@end

@implementation KVMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        //创建cell的子控件：iconView
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"me"];
        [self.contentView addSubview:iconView];
         _iconView = iconView;
        
        //创建cell的子控件：timeLabel
        UILabel *timeLabel = [[UILabel alloc] init];
       // timeLabel.backgroundColor = [UIColor blueColor];
        timeLabel.font = [UIFont systemFontOfSize:9];
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:timeLabel];
        _timeLabel = timeLabel;
        
        
        //创建cell的子控件：contentButton
        UIButton *contentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //给contentButton设置保护的区域
        contentButton.contentEdgeInsets = UIEdgeInsetsMake(15, 12,15,12);
        //拉伸图片sendImage
        UIImage *sendImage = [UIImage imageNamed:@"chat_send_nor"];
        sendImage = [sendImage resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)resizingMode:UIImageResizingModeStretch];
        //设置背景图片
        [contentButton setBackgroundImage:sendImage forState:UIControlStateNormal];
        
        //[contentButton setBackgroundColor:[UIColor blueColor]];
        [contentButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
        //设置titlelabel的颜色
         //这个方法设置titlelabel的颜色是错误的：：[contentButton.titleLabel setTextColor:[UIColor redColor]];
        //应该用如下方法：
        [contentButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
         [self.contentView addSubview:contentButton];
        _contentButton = contentButton;
        
        //创建cell的子控件：otherIconView
        UIImageView *otherIconView = [[UIImageView alloc]init];
        otherIconView.image = [UIImage imageNamed:@"other"];
        [self.contentView addSubview:otherIconView];
        _otherIconView = otherIconView;
        
        //创建cell的子控件：otherContentButton
        UIButton *otherContentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //[otherContentButton setBackgroundColor:[UIColor blueColor]];
        otherContentButton.contentEdgeInsets = UIEdgeInsetsMake(15, 12, 15, 12);
        UIImage *receiveImage = [UIImage imageNamed:@"chat_recive_nor"];
        receiveImage = [receiveImage resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20) resizingMode:UIImageResizingModeStretch];
        [otherContentButton setBackgroundImage:receiveImage forState:UIControlStateNormal];
        
        
        
        [otherContentButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [otherContentButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.contentView addSubview:otherContentButton];
        _otherContentButton = otherContentButton;
    
        //timeLabel的约束
        [timeLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(5);
            make.height.equalTo(21);
            make.width.equalTo(100);
            make.centerX.offset(0);
        }];
        //iconView的约束
        [iconView makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.width.equalTo(50);
            make.height.equalTo(50);
            make.top.equalTo(self.timeLabel.bottom).offset(10);
        }];
        //contentButton的约束
        [contentButton makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.iconView.left).offset(-10);
            make.top.equalTo(self.iconView.top).offset(0);
            make.width.lessThanOrEqualTo(150);
            make.width.greaterThanOrEqualTo(60);
        }];
        //otherIconView的约束
        [otherIconView makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(50);
            make.height.equalTo(50);
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self.iconView.top).offset(0);
        }];
         //otherContentButton的约束
        [otherContentButton makeConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo(150);
            make.width.greaterThanOrEqualTo(60);
            make.left.equalTo(self.otherIconView.right).offset(10);
            make.top.equalTo(self.otherIconView).offset(0);
        }];
            }
    return self;
}

//重写setter方法
-(void)setMessage:(KVMessage *)message{
    _message = message;
    if (message.timeHide) { // 隐藏时间
        self.timeLabel.hidden = YES;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(0);
        }];
    } else { // 显示时间
        self.timeLabel.text = message.time;
        self.timeLabel.hidden = NO;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(21);
        }];
    }
    if (message.type == KVMessageTypeMe) {
        self.otherContentButton.hidden = YES;
        self.otherIconView.hidden = YES;
        self.contentButton.hidden = NO;
        self.iconView.hidden = NO;
        [self layoutIfNeeded];
        
        [self.contentButton setTitle:message.text forState:UIControlStateNormal];
        self.contentButton.titleLabel.numberOfLines = 0;
        self.contentButton.titleLabel.preferredMaxLayoutWidth = 150;
        [self.contentButton layoutIfNeeded];
        //确定button的高度
        [self.contentButton updateConstraints:^(MASConstraintMaker *make) {
            CGFloat buttonH = self.contentButton.titleLabel.frame.size.height+30;
            make.height.equalTo(buttonH);
        }];
        [self layoutIfNeeded];
        //确定cell的高度
        CGFloat buttonMaxY = CGRectGetMaxY(self.contentButton.frame);
        CGFloat iconMaxY = CGRectGetMaxY(self.iconView.frame);
        self.message.cellHeight = MAX(buttonMaxY, iconMaxY) + 10;
        
    }else{
        self.otherContentButton.hidden = NO;
        self.otherIconView.hidden = NO;
        self.contentButton.hidden = YES;
        self.iconView.hidden = YES;
        [self layoutIfNeeded];
        
        [self.otherContentButton setTitle:message.text forState:UIControlStateNormal];
        self.otherContentButton.titleLabel.numberOfLines = 0;
        self.otherContentButton.titleLabel.preferredMaxLayoutWidth = 150;
        [self.otherContentButton layoutIfNeeded];
        //确定button的高度
        [self.otherContentButton updateConstraints:^(MASConstraintMaker *make) {
            CGFloat buttonH = self.otherContentButton.titleLabel.frame.size.height+30;
            make.height.equalTo(buttonH);
        }];
        [self layoutIfNeeded];
        //确定cell的高度
        CGFloat buttonMaxY = CGRectGetMaxY(self.otherContentButton.frame);
        CGFloat iconMaxY = CGRectGetMaxY(self.otherIconView.frame);
        self.message.cellHeight = MAX(buttonMaxY, iconMaxY) + 10;
    }
 
}
@end
