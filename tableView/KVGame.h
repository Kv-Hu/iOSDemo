//
//  KVGame.h
//  iOSDemo
//
//  Created by Kevin on 16-5-18.
//
//

#import <Foundation/Foundation.h>

@interface KVGame : NSObject

@property(strong,nonatomic) NSString *number;

@property(strong,nonatomic) NSString *icon;

@property(strong,nonatomic) NSString *title;

@property(strong,nonatomic) NSString *classes;

@property(strong,nonatomic) NSString *levelIcon;

@property(strong,nonatomic) NSString *buyNumber;

@property(strong,nonatomic) NSString *moneyIcon;

@property(strong,nonatomic) NSString *buyIntro;

@property (assign,nonatomic,getter=isChecked) BOOL checked;

+(instancetype)gameWithDict:(NSDictionary *)dict;
@end
