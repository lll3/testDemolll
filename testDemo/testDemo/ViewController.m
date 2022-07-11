//
//  ViewController.m
//  testDemo
//
//  Created by myzx on 2020/9/23.
//  Copyright © 2020 myzx. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Tools.h"
#import <objc/runtime.h>
#import <objc/message.h>


@interface ViewController ()<UIGestureRecognizerDelegate>{
    UILabel *nameLabel;
}

@property (atomic,strong) UILabel *titleLabel;

@end

@implementation ViewController
//@synthesize titleLabel;

- (void)viewDidLoad{
    [super viewDidLoad];
        
    [self test];
    
    nameLabel.text = @"";
    
//    WechatPay *pay = [[WechatPay alloc] init];
//
//    [pay play:2];
//    [pay play:1];
    
    // Do any additional setup after loading the view.
}


- (void)test{
    
    //相当于：Class class = [UIView class];
    Class viewClass = objc_getClass("UIView");
    
    UIView *view = ((id (*)(id, SEL))(void *)objc_msgSend)((id)viewClass, sel_registerName("alloc"));

    ((id (*)(id, SEL))(void *)objc_msgSend)((id)view, sel_registerName("init"));
    
     
    //动态添加方法
    class_addMethod(object_getClass(self), @selector(test), class_getMethodImplementation(object_getClass(self), @selector(test)), "");
    
    
    //方法交换
    Method methodA = class_getInstanceMethod([self class], @selector(printA));
    
    Method methodB = class_getInstanceMethod([self class], @selector(printB));
    
    method_exchangeImplementations(methodA, methodB);
    
    [self printA];
    [self printB];
    
    //替换系统方法
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 300, 50)];
    label.text = @"测试Runtime拦截方法";
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    
    //关联对象
    UIImage *image = [[UIImage alloc] init];
    image.urlString = @"url";
    NSLog(@"%@",image.urlString);
    
    [image clearAssociatedObjcet];
    
    NSLog(@"%@",image.urlString);
   
    //动态解析方法

    
    //.获取属性列表
    [self attributeList];
    
    //获取成员变量
    [self memberList];
    
    //获取所有方法
    [self methodAll];
    
    //当前遵循的所有协议
    [self protocolList];
    
}


#pragma mark - 属性列表
- (void)attributeList{
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"PropertyName(%d): %@",i,[NSString stringWithUTF8String:propertyName]);
    }
    free(propertyList);
}

#pragma mark - 成员列表
- (void)memberList{
    unsigned int count;

    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (int i= 0; i<count; i++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        NSLog(@"Ivar(%d): %@", i, [NSString stringWithUTF8String:ivarName]);
    }
    
}

#pragma mark - 获取所有方法
- (void)methodAll{
    
    unsigned int count;
    
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i<count; i++) {
        Method method = methodList[i];
        SEL mthodName = method_getName(method);
        NSLog(@"MethodName(%d): %@",i,NSStringFromSelector(mthodName));
    }
    free(methodList);
}

#pragma mark - 获取当前遵循的所有协议
- (void)protocolList{
    unsigned int count;

    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (int i=0; i<count; i++) {
        Protocol *protocal = protocolList[i];
        const char *protocolName = protocol_getName(protocal);
        NSLog(@"protocol(%d): %@",i, [NSString stringWithUTF8String:protocolName]);
    }
    
    
//    free(propertyList);
}


- (void)printA{
    NSLog(@"打印A......");
}

- (void)printB{
    NSLog(@"打印B......");
}

@end
