//
//  AppDelegate.m
//  HashNumbGetter
//
//  Created by 박종찬 on 2017. 2. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"willFinishLaunchingWithOptions");
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"didFinishLaunchingWithOptions");
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"applicationWillResignActive");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive");
}

-(void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"applicationWillTerminate");
}



@end
