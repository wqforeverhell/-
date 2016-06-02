//
//  ZYAppDelegate.m
//  GouXingChao
//
//  Created by Mac on 14-11-3.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ZYAppDelegate.h"
#import "ZYAiGuangViewController.h"
#import "ZYFenLeiViewController.h"
#import "ZYMineViewController.h"
#import "ZYDaPeiViewController.h"



@implementation ZYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    ZYAiGuangViewController *aiGuangViewC = [[ZYAiGuangViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:aiGuangViewC];
   
    aiGuangViewC.tabBarItem.title = @"爱逛";
    aiGuangViewC.tabBarItem.image = [UIImage imageNamed:@"爱逛"];
    
    ZYFenLeiViewController *fenLeiViewC = [[ZYFenLeiViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:fenLeiViewC];
  
  
    fenLeiViewC.tabBarItem.title = @"分类";
    fenLeiViewC.tabBarItem.image = [UIImage imageNamed:@"分类"];
    
    ZYDaPeiViewController *daPeiViewC = [[ZYDaPeiViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:daPeiViewC];
    
   
    
    daPeiViewC.tabBarItem.title = @"搭配";
    daPeiViewC.tabBarItem.image = [UIImage imageNamed:@"搭配"];
    
    ZYMineViewController *mineViewC = [[ZYMineViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:mineViewC];
 
    mineViewC.tabBarItem.title = @"我的";
    mineViewC.tabBarItem.image = [UIImage imageNamed:@"个人"];
    
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    
    CGRect frame = CGRectMake(0.0, 0, 320, 50);
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [view setBackgroundColor:[[UIColor alloc] initWithRed:253/255.0
                                                 green:188/255.0
                                                  blue:201/255.0
                                                 alpha:1]];
    [tabBar.tabBar insertSubview:view atIndex:0];
    tabBar.viewControllers = @[nav1,nav2,nav3,nav4];
    tabBar.tabBar.selectedImageTintColor=[UIColor redColor];
    
    
    
    
    self.window.rootViewController=tabBar;
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
