//
//  ViewController.h
//  iOSDemo
//
//  Created by amoblin on 16/3/14.
//  Copyright © 2016年 amoblin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(IBAction)compute;
@property(nonatomic,weak) IBOutlet UITextField*num1;
@property(nonatomic,weak) IBOutlet UITextField*num2;
@property(nonatomic,weak) IBOutlet UILabel*sumLabel;


@end

