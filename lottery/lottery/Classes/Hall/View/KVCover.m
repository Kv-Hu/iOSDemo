//
//  KVCover.m
//  lottery
//
//  Created by Kevin on 16/7/18.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVCover.h"
#import "KVActiveMeum.h"



@implementation KVCover

+(void)show{
    
    //创建蒙版对象
    KVCover *cover = [[KVCover alloc]initWithFrame:KVScreenBounds];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
       
    
//    //创建小苹果对象
//    KVActiveMeum *active = [KVActiveMeum activeMeum];
//    active.center = cover.center;
//    [cover addSubview:active];
//    
    //把蒙版添加到主窗口上
    [KVKeyWindow addSubview:cover];
   
}
+(void)hide{
    
    for (UIView *childView in KVKeyWindow.subviews) {
        if ([childView isKindOfClass:self]) {
            [childView removeFromSuperview];
        }
    }

}

@end
