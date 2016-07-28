//
//  KVSettingCell.m
//  lottery
//
//  Created by Kevin on 16/7/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVSettingCell.h"
#import "KVArrowSettingCellItem.h"
#import "KVSwitchSettingCellItem.h"

#import "KVGroupItem.h"

@interface KVSettingCell ()

@property(nonatomic,strong)UIImageView *arrowView;

@property(nonatomic,strong)UISwitch *switchView;

@end


@implementation KVSettingCell

-(UIView *)arrowView{

    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];  }
    return _arrowView;
}

-(UISwitch *)switchView{

    if (_switchView == nil) {
        _switchView = [[UISwitch alloc]init];
    }

    return _switchView;
}


//创建一个cell
+(instancetype)cellWithTableView:(UITableView *)tableview{
    
    static NSString *ID = @"cell";
    
    KVSettingCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[KVSettingCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;

}

-(void)setItem:(KVSettingCellItem *)item{

    _item = item;
    
    //设置数据
    [self setUpData];
    //设置accessory样式
    [self setUpAccessoryType];

}

-(void)setUpData{
    
  

    self.textLabel.text = _item.title;
    self.detailTextLabel.text = _item.subTitle;
    self.imageView.image = _item.image;
    
}

-(void)setUpAccessoryType{

    if ([_item isKindOfClass:[KVArrowSettingCellItem class]]) {
        //箭头
        self.accessoryView = self.arrowView;
        
        
    }else if ([_item isKindOfClass:[KVSwitchSettingCellItem class]]){
        //开关
        self.accessoryView = self.switchView;
        
    }else{
        //还原
        self.accessoryView = nil;
    }
    
    
}




@end
