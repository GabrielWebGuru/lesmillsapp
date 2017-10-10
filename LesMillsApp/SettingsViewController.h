//
//  SettingsViewController.h
//  iFiTunes
//
//  Created by Simona Boccuzzi on 3/27/14.
//  Copyright (c) 2014 Simona Boccuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "GAITrackedViewController.h"

@interface SettingsViewController : GAITrackedViewController


- (IBAction)done:(id)sender;


- (IBAction)SendEmail:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *emailButton;
@property (strong, nonatomic) IBOutlet UIView *tableView;
@end
