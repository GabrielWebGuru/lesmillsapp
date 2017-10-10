//
//  MusicViewController.m
//  iFiTunes
//
//  Created by Simona Boccuzzi on 4/25/14.
//  Copyright (c) 2014 Simona Boccuzzi. All rights reserved.
//

#import "MusicViewController.h"
#import "AppDelegate.h"

@interface MusicViewController ()

@end

@implementation MusicViewController
@synthesize playUrl=playUrl_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad


{
    [super viewDidLoad];
    self.screenName = @"Music";
    
    AppDelegate *appDel = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    UIWebView *webView = appDel.sharedWebView;
    CGRect fr = self.view.frame;
    webView.frame = fr;
    webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);

  
    [self.view addSubview:webView];
    [appDel playUrl:playUrl_];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
