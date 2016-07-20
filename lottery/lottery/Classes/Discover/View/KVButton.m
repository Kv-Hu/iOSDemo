//
//  KVButton.m
//  lottery
//
//  Created by Kevin on 16/7/20.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVButton.h"

@implementation KVButton

-(void)layoutSubviews{

    [super layoutSubviews];
    
    if (self.imageView.x < self.titleLabel.x) {
        
        self.titleLabel.x = self.imageView.x;
        
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
    
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{

    [super setTitle:title forState:state];
    
    [self sizeToFit];

}

@end
