//
//  MasterViewController.h
//  LesMillsApp
//
//  Created by Simona Boccuzzi on 12/20/13.
//  Copyright (c) 2013 Simona Boccuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MillsDetailsConstant.h"
#import "GAITrackedViewController.h"


@interface MasterViewController : GAITrackedViewController{
    
   //NSMutableArray* routinedescription_;
   NSMutableArray* routines_;
   
  
}

@property (nonatomic,retain)NSMutableArray* routines;

//@property (nonatomic,retain)NSMutableArray* routinedescription;



@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
