//
//  KVAddCaculater.m
//  iOSDem/
//
//  Created by Kevin on 16-5-6.
//
///Users/Kevin/Desktop/working/iOSDemo/iOSDemo/KVAddCaculater.h

#import "KVAddCaculater.h"
#import "ViewController.h"

@interface KVAddCaculater()
@property (weak, nonatomic) IBOutlet UITextField *num1;

@property (weak, nonatomic) IBOutlet UITextField *num2;

@property (weak, nonatomic) IBOutlet UILabel *num3;

-(IBAction)compute;

@end

@implementation KVAddCaculater

+(instancetype)addCaculater

{
    return [[[NSBundle mainBundle] loadNibNamed:@"KVAddCaculater" owner:nil options:nil] lastObject];
}

-(void)compute
{
    NSString *str1 = self.num1.text;
    NSString *str2 = self.num2.text;
    int str3 = str1.intValue + str2.intValue;
    
     self.num3.text = [NSString stringWithFormat:@"%d",str3];
    
 }
@end
