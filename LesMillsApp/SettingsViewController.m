//
//  SettingsViewController.m
//  iFiTunes
//
//  Created by Simona Boccuzzi on 3/27/14.
//  Copyright (c) 2014 Simona Boccuzzi. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    self.screenName = @"Settings";
    
	// Do any additional setup after loading the view.
   [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    _emailButton.layer.borderWidth = .5f;
    _emailButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    
    
    
   self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
   self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:223.0/255.0 green:228.0/255.0 blue:233/255.0 alpha:1.0];
    
 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)SendEmail:(id)sender {
    
    
    
    MFMailComposeViewController *mailcontroller = [[MFMailComposeViewController alloc] init];
    [mailcontroller setMailComposeDelegate:self];
    NSString *email;
    NSArray *emailArray = [[NSArray alloc] initWithObjects:@"fitunesme@gmail.com", nil];
    [mailcontroller setToRecipients:emailArray];
    [mailcontroller setSubject:@"iFitunes feedback"];
    [self presentViewController:mailcontroller animated:YES completion:nil];
     
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
