//
//  KVMessage.h
//  chattingTableView
//
//  Created by Kevin on 16/5/27.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    KVMessageTypeMe = 0,
    KVMessageTypeOther = 1
}KVMessageType;


@interface KVMessage : NSObject
@property(strong,nonatomic) NSString *text;
@property(strong,nonatomic) NSString *time;
@property(assign,nonatomic) KVMessageType type;
@property (nonatomic, assign) CGFloat cellHeight;
@property(assign,nonatomic,getter=isTimeHide) BOOL timeHide;
+(instancetype)messageWithDict:(NSDictionary *)dict;


@end
