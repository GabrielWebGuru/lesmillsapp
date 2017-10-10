//
//  AppDelegate.m
//  LesMillsApp
//
//  Created by Simona Boccuzzi on 12/20/13.
//  Copyright (c) 2013 Simona Boccuzzi. All rights reserved.
//

#import "AppDelegate.h"

#import <AVFoundation/AVFoundation.h>
#import "GAI.h"
#import "GAIDictionaryBuilder.h"


@implementation AppDelegate



- (void)playUrl:(NSString*)urlString
{
    if ([urlString isEqualToString:_playingUrl])
        return;
    
    _playingUrl = urlString;
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_sharedWebView loadRequest:request];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    NSString *urlString = [url absoluteString];
    
    id<GAITracker> tracker = [[GAI sharedInstance] trackerWithName:@"direct"
                                                        trackingId:@"UA-55235689-2"];

     GAIDictionaryBuilder *hitParams = [[GAIDictionaryBuilder alloc] init];

    [[hitParams setCampaignParametersFromUrl:urlString] build];
    
    if(![hitParams valueForKey:kGAICampaignSource] && [url host].length !=0) {
        // Set campaign data on the map, not the tracker.
        [hitParams set:@"referrer" forKey:kGAICampaignMedium];
        [hitParams set:[url host] forKey:kGAICampaignSource];
    }
    
     NSDictionary *hitParamsDict = [hitParams build];
    
     [tracker set:kGAIScreenName value:@"screen name"];
    [tracker send:[[[GAIDictionaryBuilder createAppView] setAll:hitParamsDict] build]];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    NSError *err = nil;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&err];
    
    _playingUrl = @"";
    _sharedWebView = [[UIWebView alloc] init];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:223.0/255.0 green:228.0/255.0 blue:233/255.0 alpha:1.0];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor colorWithRed:223.0/255.0 green:228.0/255.0 blue:233/255.0 alpha:1.0],NSForegroundColorAttributeName, shadow,NSShadowAttributeName,
                                                          [UIFont fontWithName:@"ArialMT" size:18.0],NSFontAttributeName,nil]];
    // Override point for customization after application launch.
    
    // 1
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // 2
    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelVerbose];
    
    // 3
    [GAI sharedInstance].dispatchInterval = 20;
    
    // 4
    [[GAI sharedInstance] trackerWithName:@"direct"
                                        trackingId:@"UA-55235689-2"];
    
    
                                                         
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

// Storage slot for Spotify track player


@end
