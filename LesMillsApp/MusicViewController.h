//
//  MusicViewController.h
//  iFiTunes
//
//  Created by Simona Boccuzzi on 4/25/14.
//  Copyright (c) 2014 Simona Boccuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface MusicViewController : GAITrackedViewController{
 @private
    

    
    NSString *playUrl_;
}




@property (strong, nonatomic) UIWebView *viewWeb;
@property(nonatomic, copy) NSString *playUrl;



@end
