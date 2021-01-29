//
//  UIImage+Tools.h
//  testDemo
//
//  Created by myzx on 2020/9/27.
//  Copyright © 2020 myzx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Tools)

@property (nonatomic,copy) NSString *urlString;

- (void)clearAssociatedObjcet;

@end

NS_ASSUME_NONNULL_END
