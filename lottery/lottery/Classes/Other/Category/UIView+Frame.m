//
//  UIView+Frame.m
//  lottery
//
//  Created by Kevin on 16/7/20.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)


- (CGFloat)x
{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x
{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
@end
