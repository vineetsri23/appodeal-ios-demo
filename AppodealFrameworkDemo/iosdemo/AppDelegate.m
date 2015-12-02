//
//  AppDelegate.m
//  iosdemo
//
//  Created by supergoodd on 4/23/15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

#import "AppDelegate.h"

#import <Appodeal/Appodeal.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Specify AppodealAppKey in Info.plist!
    // NSAssert(apiKey, @"Specify AppodealAppKey in Info.plist!");
    // NSString* apiKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"AppodealAppKey"];
    //init with api key - all ad types and autocache enabled
    //  [Appodeal initializeWithApiKey:apiKey];
    //[Appodeal setDebugEnabled:YES];
    //set debug mode
    //[Appodeal setDebugEnabled:YES];
    //set user metadata
    //[Appodeal setUserAge:23];
    //[Appodeal setUserGender:AppodealUserGenderMale];
    //block adnetwork and types of ad
    //[Appodeal disableNetworkForAdType:AppodealAdTypeVideo name:kAppodealAdColonyNetworkName];
    //[Appodeal disableNetworkForAdType:AppodealAdTypeBanner name:kAppodealAdMobNetworkName];
    [self configureAppearance];
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

#define appodeal_tintColor [UIColor colorWithRed:0.94f green:0.18f blue:0.16f alpha:1.0f]

- (void)configureAppearance {
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[UINavigationBar appearance] setBarTintColor: appodeal_tintColor];
}

@end
