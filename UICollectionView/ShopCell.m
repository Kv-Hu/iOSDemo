//
//  ShopCell.m
//  iOSDemo
//
//  Created by Kevin on 16/6/6.
//
//

#import "ShopCell.h"
#import "ShopModel.h"

@interface ShopCell()
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;


@end

@implementation ShopCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setShopModel:(ShopModel *)shopModel {
    _shopModel = shopModel;
    
    _priceLabel.text = shopModel.price;
}

@end