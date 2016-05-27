//
//  KVMessageCell.m
//  iOSDemo
//
//  Created by Kevin on 16/5/26.
//
//

#import "KVMessageCell.h"
#import "KVMessage.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface KVMessageCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIButton *contentButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *otherIconView;

@property (weak, nonatomic) IBOutlet UIButton *otherContentButton;


@end

@implementation KVMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentButton.titleLabel.preferredMaxLayoutWidth = 150;
    self.contentButton.titleLabel.numberOfLines =0;
    
    self.otherContentButton.titleLabel.preferredMaxLayoutWidth = 150;
    self.otherContentButton.titleLabel.numberOfLines =0;
}

//重写setter方法
-(void)setMessage:(KVMessage *)message{
    _message = message;
    self.timeLabel.text = message.time;
    
    if (message.hideTime) {
        self.timeLabel.hidden = YES;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(0);
        }];
    }else{
        self.timeLabel.hidden = NO;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(21);
        }];
    
    }
    

    //判定左右显示
    if (message.type == KVMessageTypeMe) {//显示右边
        
        self.iconView.hidden = NO;
        self.contentButton.hidden = NO;
        self.otherIconView.hidden = YES;
        self.otherContentButton.hidden = YES;
        [self.contentButton setTitle:message.text forState:UIControlStateNormal];
        
        [self.contentButton layoutIfNeeded];
        
        //将contentButton的高度 设置为内置titleLabel的高度
        [self.contentButton updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.contentButton.titleLabel.frame.size.height);
        }];
        
        [self.contentButton layoutIfNeeded];
        //设置cell的高度
        CGFloat buttonMaxY = CGRectGetMaxY(self.contentButton.frame);
        CGFloat iconMaxY = CGRectGetMaxY(self.iconView.frame);
        self.message.cellHeight = MAX(buttonMaxY, iconMaxY) + 10;
      
    }else{//显示左边
        self.iconView.hidden = YES;
        self.contentButton.hidden = YES;
        self.otherIconView.hidden = NO;
        self.otherContentButton.hidden = NO;
        [self.otherContentButton setTitle:message.text forState:UIControlStateNormal];
        
        [self.otherContentButton layoutIfNeeded];
        //将othercontentButton的高度 设置为内置titleLabel的高度
       
        [self.otherContentButton updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.otherContentButton.titleLabel.frame.size.height);
            
        }];
        
        [self.otherContentButton layoutIfNeeded];
        //设置cell的高度
        CGFloat otherButtonMaxY = CGRectGetMaxY(self.otherContentButton.frame);
        CGFloat otherIconMaxY = CGRectGetMaxY(self.otherIconView.frame);
        self.message.cellHeight = MAX(otherIconMaxY, otherButtonMaxY) + 10;
       
    }
    

    
    
}
@end







