//
//  KVLuckyBackGroundView.m
//  lottery
//
//  Created by Kevin on 16/8/4.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVLuckyBackGroundView.h"

@implementation KVLuckyBackGroundView

-(void)drawRect:(CGRect)rect{

    UIImage *image = [UIImage imageNamed:@"luck_entry_background"];
    
    
    [image drawInRect:rect];
}


@end
