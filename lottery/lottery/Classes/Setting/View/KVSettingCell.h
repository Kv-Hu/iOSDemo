//
//  KVSettingCell.h
//  lottery
//
//  Created by Kevin on 16/7/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KVSettingCellItem;

@interface KVSettingCell : UITableViewCell

@property(nonatomic,strong)KVSettingCellItem *item;

+(instancetype)cellWithTableView:(UITableView *)tableview;

@end
