//
//  KVLuckyViewController.m
//  lottery
//
//  Created by Kevin on 16/7/20.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVLuckyViewController.h"

@interface KVLuckyViewController()

@property (weak, nonatomic) IBOutlet UIImageView *luckyLight;


@end

@implementation KVLuckyViewController


-(void)viewDidLoad{

    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image1 = [UIImage imageNamed:@"lucky_entry_light1"];
    
    _luckyLight.animationImages = @[image,image1];
    _luckyLight.animationDuration = 1;
    [_luckyLight startAnimating];


}
@end
