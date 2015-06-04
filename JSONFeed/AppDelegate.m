//
//  AppDelegate.m
//  JSONFeed
//
//  Created by Dennis Nguyen on 6/3/15.
//  Copyright (c) 2015 dnwin. All rights reserved.
//

#import "AppDelegate.h"
#import "CoursesViewController.h"
#import "WebViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    CoursesViewController *cvc = [[CoursesViewController alloc] initWithStyle:UITableViewStylePlain];
    
    // Place it within a navigation controller
    UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:cvc];
    
    // Instantiate here for use with UISplitViewController
    WebViewController *wvc = [[WebViewController alloc] init];
    cvc.webViewController = wvc;
    
    
    // Check for ipad
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        // Setup split view controller with webviewcontroller as the detail nav/ delegate
        
        // Make nav controller for web view controller
        UINavigationController *detailNav = [[UINavigationController alloc] initWithRootViewController:wvc];
        // Make split view controller
        UISplitViewController *svc = [[UISplitViewController alloc] init];
        svc.delegate = wvc;
        
        svc.viewControllers = @[masterNav, detailNav];
        
        self.window.rootViewController = svc;
    }
    else {
        self.window.rootViewController = masterNav;
    }

    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
