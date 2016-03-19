//
//  ViewController.m
//  iOSDemo
//
//  Created by amoblin on 16/3/14.
//  Copyright © 2016年 amoblin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)compute
{
    
    NSString *str1 = self.num1.text;
    NSString *str2 = self.num2.text;
    int result = str1.intValue + str2.intValue;
    self.sumLabel.text = [NSString stringWithFormat:@"%d",result];
    
    [self.view endEditing:YES];
    
    
    
    
    
    
    
}
@end
