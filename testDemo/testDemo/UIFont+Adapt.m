//
//  UIFont+Adapt.m
//  testDemo
//
//  Created by myzx on 2020/9/27.
//  Copyright © 2020 myzx. All rights reserved.
//

#import "UIFont+Adapt.h"
#import <objc/runtime.h>

@implementation UIFont (Adapt)

+ (void)load{
    
    Method systemMethod = class_getClassMethod([UIFont class], @selector(systemFontOfSize:));
    
    Method customMethod = class_getClassMethod([UIFont class], @selector(zs_systemFontOfSize:));
    
    method_exchangeImplementations(systemMethod, customMethod);
    
}

+ (UIFont *)zs_systemFontOfSize:(CGFloat)fontSize{
    //获取设备屏幕宽度，并计算出比例scale
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat scale  = width/375.0;
    //注意：由于方法交换，系统的方法名已变成了自定义的方法名，所以这里使用了
    //自定义的方法名来获取UIFont
    return [UIFont zs_systemFontOfSize:fontSize * scale];
}

@end
