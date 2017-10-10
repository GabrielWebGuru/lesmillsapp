//
//  LesMillsCell2.h
//  LesMillsApp
//
//  Created by Simona Boccuzzi on 2/3/14.
//  Copyright (c) 2014 Simona Boccuzzi. All rights reserved.
//

#import "LesMillsCell.h"

@interface LesMillsCell2 : LesMillsCell {

@private

UILabel *Title2_;
UILabel *Artist2_;
UILabel *Time2_;



}


@property (nonatomic, retain) IBOutlet UILabel *Title2;
@property (nonatomic, retain) IBOutlet UILabel *Artist2;
@property (nonatomic, retain) IBOutlet UILabel *Time2;

@end
