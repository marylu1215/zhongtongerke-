//
//  UIImageView+KJExtension.m
//
//  Created by kouhanjin on 16/3/7.
//  Copyright © 2016年 khj. All rights reserved.
//

#import "UIImageView+KJExtension.h"

@implementation UIImageView (KJExtension)


+(UIImageView *)createImageViewWithImageName:(NSString *)imageName color:(UIColor *)color
{
    UIImageView *imageView=[[UIImageView alloc]init];
    
    if (imageName)
    {
        imageView.image=[UIImage imageNamed:imageName];
    }
    if (color)
    {
        imageView.backgroundColor=color;
    }
    
    return imageView;
}


@end
