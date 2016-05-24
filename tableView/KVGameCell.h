//
//  KVGameCell.h
//  iOSDemo
//
//  Created by Kevin on 16-5-18.
//
//

#import <UIKit/UIKit.h>
@class KVGame;

@class KVGameCell;

@interface KVGameCell : UITableViewCell
@property(strong,nonatomic) UIImageView *checkView;



@property(strong,nonatomic) KVGame *game;

@end
