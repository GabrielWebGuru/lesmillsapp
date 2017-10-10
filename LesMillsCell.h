//
//  LesMillsCell.h
//  LesMillsApp
//
//  Created by Lella on 12/01/2014.
//  Copyright (c) 2014 Simona Boccuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LesMillsCell : UITableViewCell{

@private


UILabel *Exercise_;
UILabel *Title_;
UILabel *Artist_;
UILabel *Time_;
NSMutableArray *routineinfo_;



}


@property (nonatomic, retain) IBOutlet UILabel *Exercise;
@property (nonatomic, retain) IBOutlet UILabel *Title;
@property (nonatomic, retain) IBOutlet UILabel *Artist;
@property (nonatomic, retain) IBOutlet UILabel *Time;





@end
