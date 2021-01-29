//
//  AppDelegate.m
//  testDemo
//
//  Created by myzx on 2020/9/23.
//  Copyright © 2020 myzx. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen] .bounds];
    
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init] ];
    
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    [self.window makeKeyAndVisible];
    

    
    return YES;
}




@end
