//
//  ViewController.m
//  addSubview
//
//  Created by Kevin on 16-4-25.
//  Copyright (c) 2016年 KV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIView *button;

@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
   


}
- (IBAction)buttonClick {
    
    UISwitch *s = [[UISwitch alloc] init];
    s.frame = CGRectMake(20, 20, 10, 10);
    s.backgroundColor = [UIColor grayColor];
    [self.view addSubview:s];
    [self.label removeFromSuperview];
    [[self.view viewWithTag:10] removeFromSuperview];
    
    UIView *tempView = [[UIView alloc] init];
    tempView.backgroundColor = [UIColor orangeColor];
    tempView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:tempView];
    
     NSLog(@"%@",NSStringFromCGRect(self.view.frame));
}


@end
