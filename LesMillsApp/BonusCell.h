//
//  BonusCell.h
//  LesMillsApp
//
//  Created by Lella on 12/01/2014.
//  Copyright (c) 2014 Simona Boccuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BonusCell : UITableViewCell{
    
@private
    
    
  
    UILabel *bonusTitle_;
    UILabel *bonusArtist_;
    UILabel *bonusTime_;
    
    
}



@property (nonatomic, retain) IBOutlet UILabel *bonusTitle;
@property (nonatomic, retain) IBOutlet UILabel *bonusArtist;
@property (nonatomic, retain) IBOutlet UILabel *bonusTime;





@end