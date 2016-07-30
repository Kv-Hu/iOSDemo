//
//  KVDiscoverCell.h
//  lottery
//
//  Created by Kevin on 16/7/30.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KVDiscoverCellItem.h"

@interface KVDiscoverCell : UITableViewCell

@property(nonatomic,strong)KVDiscoverCellItem *item;


+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
