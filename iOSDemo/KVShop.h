//
//  KVShop.h
//  iOSDemo
//
//  Created by Kevin on 16-5-8.
//
//

#import <UIKit/UIKit.h>

@interface KVShop : NSObject

/** 商品名称 */
@property (nonatomic, strong) NSString *name;
/** 图标 */
@property (nonatomic, strong) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)shopWithDict:(NSDictionary *)dict;

@end
