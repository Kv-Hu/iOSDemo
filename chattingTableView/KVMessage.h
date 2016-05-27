//
//  KVMessage.h
//  iOSDemo
//
//  Created by Kevin on 16/5/26.
//
//

#import <UIKit/UIKit.h>

typedef enum{
    KVMessageTypeMe = 0,
    KVMessageTypeOther = 1
}KVMessageType;


@interface KVMessage : NSObject

@property(strong,nonatomic) NSString *text;
@property(strong,nonatomic) NSString *time;
@property(assign,nonatomic) KVMessageType type;
@property(assign,nonatomic) CGFloat cellHeight;
@property(assign,nonatomic) BOOL hideTime;

+(instancetype)messageWithDict:(NSDictionary *)dict;

@end
