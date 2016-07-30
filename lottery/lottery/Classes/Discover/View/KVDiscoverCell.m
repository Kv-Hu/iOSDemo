//
//  KVDiscoverCell.m
//  lottery
//
//  Created by Kevin on 16/7/30.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVDiscoverCell.h"

@interface KVDiscoverCell ()



@property(nonatomic,strong)UIImageView *titleImageView;
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UITextField *instructionTextField;

@end


@implementation KVDiscoverCell

//快速创建一个cell

+(instancetype)cellWithTableView:(UITableView *)tableView{


    static NSString *ID = @"cell";
    
    KVDiscoverCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[KVDiscoverCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;


}


-(void)setItem:(KVDiscoverCellItem *)item{
    

    _item = item;
    
    self.titleImageView.image = _item.titleImage;
    self.iconImageView.image = _item.iconImage;
    self.instructionTextField.text = _item.text;
    
  
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
           self.titleImageView =  [[UIImageView alloc]initWithFrame:CGRectMake(8, 8, 45, 30)];

        [self addSubview:_titleImageView];
        

        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(267, 0, 95, 79)];
        [self addSubview:_iconImageView];
        
        
   self.instructionTextField = [[UITextField alloc]initWithFrame:CGRectMake(8, 46, 208, 30)];
        self.instructionTextField.enabled = NO;
        [self addSubview:_instructionTextField];
    
}
    
     return self;
    
}






@end
