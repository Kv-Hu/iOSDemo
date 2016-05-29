//
//  KVMessageCell.h
//  chattingTableView
//
//  Created by Kevin on 16/5/27.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KVMessage;
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface KVMessageCell : UITableViewCell

@property(strong,nonatomic) KVMessage *message;
@end
