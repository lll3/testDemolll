//
//  UIImage+Tools.m
//  testDemo
//
//  Created by myzx on 2020/9/27.
//  Copyright © 2020 myzx. All rights reserved.
//

#import "UIImage+Tools.h"
#import <objc/runtime.h>

@implementation UIImage (Tools)


- (void)setUrlString:(NSString *)urlString{
    objc_setAssociatedObject(self, @selector(urlString), urlString, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)urlString{
    return objc_getAssociatedObject(self, _cmd);
}


- (void)clearAssociatedObjcet{
    objc_removeAssociatedObjects(self);
}

@end
