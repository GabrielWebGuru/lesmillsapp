//
//  DetailViewController.h
//  LesMillsApp
//
//  Created by Simona Boccuzzi on 12/20/13.
//  Copyright (c) 2013 Simona Boccuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface DetailViewController : GAITrackedViewController<UITableViewDelegate, UITableViewDataSource,UIActionSheetDelegate>{
 
@private
NSArray *trackList_;
NSArray *releaseList_;
    int releaseIndex_;
NSString *releaseName_;
NSString *url_;
    NSDictionary *playlistByService_;
    UIColor *color_;
    UILabel *trackType_;
    UILabel *songTitle_;
    UILabel *artistName_;
}
@property (nonatomic, retain)  NSArray *trackList;
@property (nonatomic, retain)  NSArray *releaseList;
@property (nonatomic) int releaseIndex;
@property (nonatomic, retain)  UIColor *color;
@property(nonatomic, copy) NSString *releaseName;
@property (retain, nonatomic) IBOutlet UILabel *trackType;
@property (retain, nonatomic) IBOutlet UILabel *songTitle;
@property (retain, nonatomic) IBOutlet UILabel *artistName;
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSDictionary *playlistByService;
@property (strong, nonatomic) IBOutlet UITableView *tableView;





@end