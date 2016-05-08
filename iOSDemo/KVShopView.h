//
//  KVShopView.h
//  iOSDemo
//
//  Created by Kevin on 16-5-8.
//
//

#import <UIKit/UIKit.h>
@class KVShop;

@interface KVShopView : UIView
/** 模型数据 */
@property (nonatomic, strong) KVShop *shop;

+ (instancetype)shopView;
+ (instancetype)shopViewWithShop:(KVShop *)shop;

@end
