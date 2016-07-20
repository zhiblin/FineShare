//
//  AppDelegate.m
//  FineShareDemo
//
//  Created by xiaopi on 16/7/15.
//  Copyright © 2016年 fine. All rights reserved.
//

#import "AppDelegate.h"
#import "FineShareManager.h"

#define K_UM_AppKey      @"5695bb8067e58ee9b90022c2"

/*sina*/
#define K_Sina_AppKey    @"115498324"
#define K_Sina_AppSecret @"109348e05849e7cfdd3e627648dc0aa3"
/*QQ*/
#define K_QQ_AppId       @"1105382245"
#define K_QQ_AppKey      @"LzKx5zF5bQiUr0rk"
/*微信*/
#define K_WX_AppID       @"wx5586473c67c3c0aa"
#define K_WX_AppSecret   @"3fe830b71e8cc524b0504f647e2e4839"

#define K_Share_Url      @"http://www.umeng.com/social"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    需要分享到几个平台设置几个appid，需要注意URLType的设置
    [FineShareManager setUMSocialAPPKey:K_UM_AppKey];
    [FineShareManager WXAppid:K_WX_AppID appSecret:K_WX_AppSecret andUrl:K_Share_Url];
    [FineShareManager QQAppid:K_QQ_AppId appKey:K_QQ_AppKey andUrl:K_Share_Url];
    [FineShareManager SinaAppKey:K_Sina_AppKey appSecret:K_Sina_AppSecret andUrl:K_Share_Url];
    return YES;
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
