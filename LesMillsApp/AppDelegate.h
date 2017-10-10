//
//  AppDelegate.h
//  LesMillsApp
//
//  Created by Simona Boccuzzi on 12/20/13.
//  Copyright (c) 2013 Simona Boccuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *_playingUrl;
    UIWebView *_sharedWebView;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIWebView *sharedWebView;

- (void)playUrl:(NSString*)url;


@end
