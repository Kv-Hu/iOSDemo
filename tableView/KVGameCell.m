//
//  KVGameCell.m
//  iOSDemo
//
//  Created by Kevin on 16-5-18.
//
//

#import "KVGameCell.h"
#import "KVGame.h"

@interface KVGameCell()
@property(strong,nonatomic) UILabel *numberLabel;
@property(strong,nonatomic) UIImageView *gameIcon;
@property(strong,nonatomic) UILabel *titleLabel;
@property(strong,nonatomic) UILabel *classesLabel;
@property(strong,nonatomic) UIImageView *levelIcon;
@property(strong,nonatomic) UILabel *buyNumberLabel;
@property(strong,nonatomic) UIImageView *moneyIcon;
@property(strong,nonatomic) UILabel *buyItroLabel;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end

@implementation KVGameCell




-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel *numberLabel = [[UILabel alloc] init];
        numberLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:numberLabel];
        
        self.numberLabel = numberLabel;
        
        UIImageView *gameIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:gameIcon];
        self.gameIcon = gameIcon;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.numberOfLines = 2;
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UILabel *classesLabel = [[UILabel alloc] init];
        classesLabel.font = [UIFont systemFontOfSize:8];
        classesLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:classesLabel];
        self.classesLabel = classesLabel;
        
        UIImageView *levelIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:levelIcon];
        self.levelIcon = levelIcon;
        
        UILabel *buyNumberLabel = [[UILabel alloc] init];
        buyNumberLabel.textColor = [UIColor grayColor];
        buyNumberLabel.font = [UIFont systemFontOfSize:8];
        [self.contentView addSubview:buyNumberLabel];
        self.buyNumberLabel = buyNumberLabel;
        
        UIImageView *moneyIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:moneyIcon];
        self.moneyIcon = moneyIcon;
        
        UILabel *buyIntroLabel = [[UILabel alloc] init];
        buyIntroLabel.font = [UIFont systemFontOfSize:8];
        buyIntroLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:buyIntroLabel];
        self.buyItroLabel = buyIntroLabel;
        //NSLog(@"123");
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat contentH = self.contentView.frame.size.height;
    CGFloat contentW = self.contentView.frame.size.width;
    CGFloat margin = 10;
    
    CGFloat numberLabelX = margin;
    CGFloat numberLabelY = margin;
    CGFloat numberLabelW = 20;
    CGFloat numberLabelH = contentH - 2*numberLabelY;
    self.numberLabel.frame = CGRectMake(numberLabelX,numberLabelY, numberLabelW, numberLabelH);
    
    CGFloat gameIconX = 2*margin + numberLabelW;
    CGFloat gameIconY = margin;
    CGFloat gameIconW = 50;
    CGFloat gameIconH = contentH - 2*numberLabelY;
    self.gameIcon.frame = CGRectMake(gameIconX, gameIconY, gameIconW, gameIconH);
    
    CGFloat titleLabelX = CGRectGetMaxX(self.gameIcon.frame) + margin;
    CGFloat titleLabelY = margin;
    CGFloat titleLabelW = 150;
    CGFloat titleLabelH = 40;
    self.titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    
    CGFloat classesLabelX = titleLabelX;
    CGFloat classesLabelY = CGRectGetMaxY(self.titleLabel.frame);
    CGFloat classesLabelW = 50;
    CGFloat classesLabelH = 10;
    self.classesLabel.frame = CGRectMake(classesLabelX, classesLabelY, classesLabelW, classesLabelH);
    
    CGFloat levelIconX = titleLabelX;
    CGFloat levelIconY = CGRectGetMaxY(self.classesLabel.frame) + margin;
    CGFloat levelIconW = 50;
    CGFloat levelIconH = contentH -levelIconY - margin;
    self.levelIcon.frame = CGRectMake(levelIconX, levelIconY, levelIconW, levelIconH);
    
    CGFloat buyNumberLabelX = CGRectGetMaxX(self.levelIcon.frame);
    CGFloat buyNumberLabelY = levelIconY;
    CGFloat buyNumberLabelW = 50;
    CGFloat buyNumberLabelH = levelIconH;
    self.buyNumberLabel.frame = CGRectMake(buyNumberLabelX, buyNumberLabelY, buyNumberLabelW, buyNumberLabelH);
    
    CGFloat moneyIconW = 60;
    CGFloat moneyIconX = contentW - margin -moneyIconW;
    CGFloat moneyIconY = 30;
    CGFloat moneyIconH = 30;
    self.moneyIcon.frame = CGRectMake(moneyIconX, moneyIconY, moneyIconW, moneyIconH);
    
    CGFloat buyItroLabelX = moneyIconX+margin-2;
    CGFloat buyItroLabelY = CGRectGetMaxY(self.moneyIcon.frame) + margin*0.5;
    CGFloat buyItroLabelW = moneyIconW;
    CGFloat buyItroLabelH = 10;
    
    self.buyItroLabel.frame = CGRectMake(buyItroLabelX, buyItroLabelY, buyItroLabelW, buyItroLabelH);
    
    

}

-(void)setGame:(KVGame *)game{

    _game = game;
    self.numberLabel.text = game.number;
    self.gameIcon.image = [UIImage imageNamed:game.icon];
    self.titleLabel.text = game.title;
    self.classesLabel.text = game.classes;
    self.levelIcon.image = [UIImage imageNamed:game.levelIcon];
    self.buyNumberLabel.text = game.buyNumber;
    self.moneyIcon.image = [UIImage imageNamed:game.moneyIcon];
    self.buyItroLabel.text = game.buyIntro;

}










@end
