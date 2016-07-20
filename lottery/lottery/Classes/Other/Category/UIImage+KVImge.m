//
//  UIImage+KVImge.m
//  lottery
//
//  Created by Kevin on 16/7/18.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "UIImage+KVImge.h"

@implementation UIImage (KVImge)

+(instancetype)imageWithOrigin:(NSString *)imageNamed
{
    
    UIImage *image = [UIImage imageNamed:imageNamed];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    return image;
}

+(instancetype)imageWithStrechWithImage:(UIImage *)image{

    
    image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    
    
    return image;

}
@end
