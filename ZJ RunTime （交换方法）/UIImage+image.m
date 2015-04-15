//
//  UIImage+image.m
//  ZJ RunTime （交换方法）
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import "UIImage+image.h"
#import <objc/message.h>

@implementation UIImage (image)


+ (void)load
{
    Method zj_imagedNamedMethod = class_getClassMethod(self, @selector(zj_imageNamed:));
    
    Method imagedNamed = class_getClassMethod(self, @selector(imageNamed:));
    
    //交换两个方法的实现
    method_exchangeImplementations(zj_imagedNamedMethod, imagedNamed);
    
}

+ (instancetype)zj_imageNamed:(NSString *)imageNamed
{
    UIImage *image = [UIImage zj_imageNamed:imageNamed];
    if (image == nil) {
        NSLog(@"没有图片");
    }
    return image;
}
@end
