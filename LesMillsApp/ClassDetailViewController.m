//
//  DetailViewController.m
//  LesMillsApp
//
//  Created by Simona Boccuzzi on 12/20/13.
//  Copyright (c) 2013 Simona Boccuzzi. All rights reserved.
//


#import "ClassDetailViewController.h"
#import "ClassConstants.h"
#import "MillsDetailsConstant.h"
#import "LesMillsCell.h"
#import "LesMillsCell2.h"
#import "BonusCell.h"
#import "MusicViewController.h"


@implementation DetailViewController
@synthesize trackList=trackList_,releaseList=releaseList_,releaseName=exerciseName_, color=color_,trackType=trackType_,songTitle=songTitle_,artistName=artistName_,url=url_,releaseIndex= releaseIndex_,playlistByService=playlistByService_;

-(void) prev:(id)sender
{
    // Make us look like the new release by changing the releaseIndex
    if (self.releaseIndex == 0)
        return;
    
    self.releaseIndex = self.releaseIndex - 1;
    
    [self showRelease];
}
-(void) next:(id)sender
{
    // Make us look like the new release by changing the releaseIndex
    if (self.releaseIndex == self.releaseList.count - 1)
        return;
    
    self.releaseIndex = self.releaseIndex + 1;
    
    [self showRelease];
}

-(void)showRelease
{
    // Update our properties FROM the data
    NSDictionary *release = (NSDictionary*)[self.releaseList objectAtIndex:self.releaseIndex];
    
    self.url = [release objectForKey:PLAYLISTURL_KEY];
    self.playlistByService = [release objectForKey:PLAYLISTBYSERVICE_KEY];
    self.releaseName = [release objectForKey:RELEASE_KEY];
    self.trackList = (NSArray*)[release objectForKey:TRACKS_KEY];
    
    self.title = self.releaseName;

    // Update the User Interface (the table)
    [self.tableView reloadData];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
     self.screenName = @"Detail";
    
    self.artistName.textColor = self.color;
    self.songTitle.textColor = self.color;
    self.trackType.textColor = self.color;
    

    [self showRelease];
    
    UIImage *upimage = [UIImage imageNamed:@"down"];
    UIBarButtonItem *prevButton = [[UIBarButtonItem alloc ] initWithImage:upimage style:UIBarButtonItemStylePlain target:self action:@selector(prev:)];

    UIImage *downimage = [UIImage imageNamed:@"up"];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc ] initWithImage:downimage style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
    
    self.navigationItem.rightBarButtonItems =
        [[NSArray alloc] initWithObjects:prevButton,nextButton,nil];
    

    
   
}

//Configure appearence of table view cells.
- (void) viewWillAppear:(BOOL)animated {
    
[super viewWillAppear:animated];
    

 
   
}
   
  /*  NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:1.0 green:0.0 blue:1.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor colorWithRed:0.0/255.0 green:245.0/255.0 blue:0.0/255.0 alpha:1.0],NSForegroundColorAttributeName, shadow,NSShadowAttributeName,
                                                          [UIFont fontWithName:@"HelveticaNeue-CondenseBlack" size:21.0],NSFontAttributeName,nil];
   
   

*/


- (IBAction)barButtonPressed:(id)sender
{
    NSString *stURL=self.url;
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:stURL]];
    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // create and configure the actionsheet
    
    UIActionSheet *musicServiceSheet =[[UIActionSheet alloc] initWithTitle:@"In which Music Service you want to play?" delegate:self cancelButtonTitle:@"Cancel"destructiveButtonTitle:nil otherButtonTitles:@"YouTube", @"Grooveshark", @"Spotify", nil];
    
    
    // Action * foo = [[Action alloc] initWithBullshit:@sel(userPickedMusicService)];
    
    // [foo show]
    
    [musicServiceSheet showInView:self.view];
}

//This is the the thing that receives the button click
//-(void)actionSheet:(UIActionSheet *)actionSheet
//clickedButtonAtIndex:(NSInteger)buttonIndex{
//
//    NSLog(@"You have pressed the %@ button", [actionSheet buttonTitleAtIndex:buttonIndex]);
//
//}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        
        
        return;
    }
    
    
    
   // Figureout the URL
    NSString *theUrl = @"PlaylistUrl";
    switch (buttonIndex) {
        case 0:
            theUrl = [self.playlistByService objectForKey:@"YouTube"];
            break;
        case 1:
            theUrl = [self.playlistByService objectForKey:@"GrooveShark"];
            break;
        case 2:
            theUrl = [self.playlistByService objectForKey:@"Spotify"];
            break;
        default:
            break;
    }
    
    //// Display the music site
    MusicViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MusicViewController"];
    mvc.playUrl = theUrl;
    NSLog(@"%@", theUrl);
   [self.navigationController pushViewController:mvc animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    CGFloat h = 55;
    
    id exer = [self.trackList objectAtIndex:indexPath.row];
    
    if ([exer objectForKey:TIME2_KEY] != nil)
        h *= 2;
    
    
    // putting second song 2 in cell
    
    if ([exer objectForKey:SONG_KEY2] != nil)
        h = h+55;
    
    return h;
    
 

}

- (NSInteger)rowSelected:(UITableView *)tableView
{
    return 1;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.trackList count];
   
   
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    
    id exer = [self.trackList objectAtIndex:indexPath.row];
    
    
    
    if ([exer objectForKey:BONUSONG_KEY] != nil)
        
    {
        
        static NSString *CellIdentifier3 = @"BonusCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier3];
        BonusCell *bonusCell = nil;
        if (![cell isKindOfClass:[BonusCell class]]) {
            
            bonusCell = [[BonusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier3];
            
        }
        else {
            bonusCell = (BonusCell*)cell;
        }
        bonusCell.bonusTitle.text = [exer objectForKey:BONUSONG_KEY];
        
        //Configure the cell SONG
        bonusCell.bonusTime.text= [exer objectForKey:SONG_KEY];
        
        //Configure the cell ARTIST
        bonusCell.bonusArtist.text= [exer objectForKey:ARTIST_KEY];
        
        //Configure the cell TIME
        bonusCell.bonusTime.text= [exer objectForKey:TIME_KEY];

        
        return bonusCell;
    }
    else {
    
        BOOL isDoubleHeight = [exer objectForKey:TIME2_KEY] != nil;
        
       // || ([exer objectForKey:SONG_KEY2] != nil);
        
        
        
        

        LesMillsCell *lmCell = nil;
        
        if (isDoubleHeight) {

            static NSString *CellIdentifier2 = @"LesMillsCell2";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
            LesMillsCell2 *lmCell2 = nil;
            if (![cell isKindOfClass:[LesMillsCell2 class]]) {
                
                lmCell2 = [[LesMillsCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2];
                
                
            }
            else {
                lmCell2 = (LesMillsCell2*)cell;
               
            }
            
            if ([exer objectForKey:TIME2_KEY] != nil)
               //Configure the cell SONG
               lmCell2.Title2.text= [exer objectForKey:SONG_KEY];
            
               //Configure the cell ARTIST
               lmCell2.Artist2.text= [exer objectForKey:ARTIST_KEY];
            
               //Configure the cell TIME
               lmCell2.Time2.text= [exer objectForKey:TIME2_KEY];
            
            

               
            
            
            
            
            
            
            
            
               lmCell = lmCell2;

            
            
            
            
            
        }
        else {
        
            static NSString *CellIdentifier = @"LesMillsCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (![cell isKindOfClass:[LesMillsCell class]]) {
                
                lmCell = [[LesMillsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                
                
            }
            else {
                lmCell = (LesMillsCell*)cell;
            }
            
            
        }
        
        //Configure the cell EXERCISE
        lmCell.Exercise.text= [exer objectForKey:EXERCISE_KEY];
        


        
        //Configure the cell SONG
        lmCell.Title.text= [exer objectForKey:SONG_KEY];
        
        //Configure the cell ARTIST
        lmCell.Artist.text= [exer objectForKey:ARTIST_KEY];
       
        //Configure the cell TIME
        lmCell.Time.text= [exer objectForKey:TIME_KEY];
        
        lmCell.Exercise.textColor = color_;
        //lmCell.Time.textColor = color_;
        
        
        
      
        
            //Alternate background cell color
        
        if (indexPath.row % 2 == 0) {
            
            lmCell.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
        }
        else
        {
            lmCell.backgroundColor =[UIColor colorWithRed:34.0/255.0 green:34.0/255.0 blue:34.0/255.0 alpha:1];
        }

        

        
        return lmCell;
    }
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showMusic"]) {
        
        
        // Pass that data on to the DetailViewController
    
        MusicViewController *musicVC = segue.destinationViewController;
        
        musicVC.playUrl = url_;
        
    }
}


@end

    

