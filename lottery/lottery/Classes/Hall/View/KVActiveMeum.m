//
//  KVActiveMeum.m
//  lottery
//
//  Created by Kevin on 16/7/18.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVActiveMeum.h"
#import "KVCover.h"

@implementation KVActiveMeum

- (IBAction)btnClick:(id)sender {
    
  [UIView animateWithDuration:1 animations:^{
      self.center = CGPointMake(44, 44);
      self.transform = CGAffineTransformMakeScale(0.001, 0.001);
  } completion:^(BOOL finished) {
      
      [KVCover hide];
      [self removeFromSuperview];
    
      
  }
   ];
   
    
}
+(instancetype)activeMeum{

    return [[NSBundle mainBundle] loadNibNamed:@"KVActiveMeum" owner:nil options:nil][0];

}
+(void)show{

    //创建窗口
   KVActiveMeum *activeMeum = [KVActiveMeum activeMeum];
   activeMeum.center = KVKeyWindow.center;

    //添加到主窗口
    [KVKeyWindow addSubview:activeMeum];

}

@end
