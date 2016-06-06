//
//  ShopModel.h
//  iOSDemo
//
//  Created by Kevin on 16/6/6.
//
//

#import <Foundation/Foundation.h>

@interface ShopModel : NSObject

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, assign) NSInteger h;

@property (nonatomic, assign) NSInteger w;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)shopModelWithDict:(NSDictionary *)dict;

@end