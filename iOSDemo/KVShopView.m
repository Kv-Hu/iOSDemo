//
//  KVShopView.m
//  iOSDemo
//
//  Created by Kevin on 16-5-8.
//
//

#import "KVShopView.h"
#import "KVShop.h"

@interface KVShopView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end


@implementation KVShopView

+ (instancetype)shopView
{
    
    return [self shopViewWithShop:nil];
}

+ (instancetype)shopViewWithShop:(KVShop *)shop
{
    KVShopView *shopView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    shopView.shop = shop;
    return shopView;
}

- (void)setShop:(KVShop *)shop
{
    _shop = shop;
    
    
    
    
    
    // 设置子控件的数据
    //    UIImageView *iconView = [self viewWithTag:10];
    //    UIImageView *iconView = [self.subviews firstObject];
    self.iconView.image = [UIImage imageNamed:shop.icon];
    
    //    UILabel *nameLabel = [self viewWithTag:20];
    //    UILabel *nameLabel = [self.subviews lastObject];
    self.nameLabel.text = shop.name;
}



@end
