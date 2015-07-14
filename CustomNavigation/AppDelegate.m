//
//  AppDelegate.m
//  CustomNavigation
//
//  Created by Vishal Mishra, Gagan on 7/14/15.
//  Copyright (c) 2015 Gagan Vishal. All rights reserved.
//

#import "AppDelegate.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    NSArray *barTintGradientColors =[NSArray arrayWithObjects:[UIColor darkGrayColor], [UIColor cyanColor], nil];
    [[UINavigationBar appearance] setBackgroundImage:[self gradientBackgroundImage:barTintGradientColors height:64] forBarMetrics:UIBarMetricsDefault];  //  BarMetrics should be change for Orienation
    return YES;
}

- (UIImage *)gradientBackgroundImage:(NSArray *)colors height:(CGFloat)height
{
    CGFloat components[colors.count * 2];
    for (int i = 0; i < colors.count; i++) {
        CGFloat red, green, blue, alpha;
        [colors[i] getRed:&red green:&green blue:&blue alpha:&alpha];
        components[i * 4] = red;
        components[i * 4 + 1] = green;
        components[i * 4 + 2] = blue;
        components[i * 4 + 3] = alpha;
    }
    CGSize size = CGSizeMake(1, height * [UIScreen mainScreen].scale);
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(space, components, NULL, colors.count);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
