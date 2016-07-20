//
//  KVLuckyView.m
//  lottery
//
//  Created by Kevin on 16/7/20.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVLuckyView.h"

@implementation KVLuckyView

-(void)drawRect:(CGRect)rect{

    UIImage *image = [UIImage imageNamed:@"luck_entry_background"];
    [image drawInRect:rect];
    

}

@end
