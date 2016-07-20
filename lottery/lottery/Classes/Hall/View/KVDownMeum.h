//
//  KVDownMeum.h
//  lottery
//
//  Created by Kevin on 16/7/19.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVDownMeum : UIView

+(instancetype)showInView:(UIView *)view items:(NSArray *)items andOriginY:(CGFloat)originY;

-(void)hide;

@end
