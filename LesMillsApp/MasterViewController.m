//
//  MasterViewController.m
//  LesMillsApp
//
//  Created by Simona Boccuzzi on 12/20/13.
//  Copyright (c) 2013 Simona Boccuzzi. All rights reserved.
//

#import "MasterViewController.h"

#import "ClassDetailViewController.h"
#import "ClassConstants.h"
#import "MillsDetailsConstant.h"
#import "LesMillsCell2.h"
#import "LesMillsCell.h"


@implementation MasterViewController

@synthesize routines=routines_;



- (void)awakeFromNib
{
[super awakeFromNib];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.screenName = @"iFitunes";

    NSString *path = [[NSBundle mainBundle] pathForResource:@"Mills" ofType:@"plist"];
    
    routines_= [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    /*NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0],NSForegroundColorAttributeName, shadow,NSShadowAttributeName,
                                                          [UIFont fontWithName:@"HelveticaNeue-CondenseBlack" size:21.0],NSFontAttributeName,nil]];
     */
    
    //Uncomment the following line to displa an Edit button in the navgation bar for this view controller.
    
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
 
    self.tableView.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:223.0/255.0 green:228.0/255.0 blue:233/255.0 alpha:1.0];
    
}






- (void)insertNewObject:(id)sender
{
    //    if (!_objects) {
    //        _objects = [[NSMutableArray alloc] init];
    //    }
    //    [_objects insertObject:[NSDate date] atIndex:0];
    //    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



//Customize the number of rows in the table view.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.routines count];
    
}


//Configure appearence of table view cells.


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
 
    
    //Configure the cell.
    cell.textLabel.text = [[self.routines objectAtIndex:indexPath.row]
                       objectForKey:NAME_KEY];
    
    cell.detailTextLabel.text = [[self.routines objectAtIndex:indexPath.row]
                                 objectForKey:ROUTINEDESCRIPTION];
                                 
                               
 

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    //Create a UIImages
    UIImage *bodyattackImage = [UIImage imageNamed:@"bodyattack.png"];
    UIImage *bodybalanceImage = [UIImage imageNamed:@"bodybalance.png"];
    UIImage *bodycombatImage = [UIImage imageNamed:@"bodycombat.png"];
    UIImage *bodyjamImage = [UIImage imageNamed:@"bodyjam.png"];
    UIImage *bodypumpImage = [UIImage imageNamed:@"bodypump.png"];
    UIImage *bodystepImage = [UIImage imageNamed:@"bodystep.png"];
    UIImage *bodyviveImage = [UIImage imageNamed:@"bodyvive.png"];
    UIImage *bodyrpmImage = [UIImage imageNamed:@"rpm.png"];
    UIImage *bodyshbamImage = [UIImage imageNamed:@"shbam.png"];
    UIImage *bodycxworxImage = [UIImage imageNamed:@"cxworx.png"];
    UIImage *bodygritstrenghtImage = [UIImage imageNamed:@"grit_strenght.png"];
    UIImage *bodygritplyoImage = [UIImage imageNamed:@"grit_plyo.png"];
    UIImage *bodygritcardioImage = [UIImage imageNamed:@"grit_cardio.png"];
    
    //Set the image in thee row

    
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = bodyattackImage;
            //cell.detailTextLabel.textColor = [UIColor greenColor];
            
            break;
            
        case 1:
            cell.imageView.image = bodybalanceImage;
            
            break;
            
        case 2:
            cell.imageView.image = bodycombatImage;
            break;
            
        case 3:
            cell.imageView.image = bodyjamImage;
            break;
            
        case 4:
            cell.imageView.image = bodypumpImage;
            break;
            
        case 5:
            cell.imageView.image = bodystepImage;
            break;
            
        case 6:
            cell.imageView.image = bodyviveImage;
            break;
            
        case 7:
            cell.imageView.image = bodyrpmImage;
            break;
            
        case 8:
            cell.imageView.image = bodyshbamImage;
            break;
            
        case 9:
            cell.imageView.image = bodycxworxImage;
            break;
            
        case 10:
            cell.imageView.image = bodygritstrenghtImage;
            break;
            
        case 11:
            cell.imageView.image = bodygritplyoImage;
            break;
            
        case 12:
            cell.imageView.image = bodygritcardioImage;
            break;
        
    }
    
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}





- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        // Get the data given the selected row
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSInteger IndexSelected=[indexPath row];
        //NSDictionary *routinedata = [self->routines_ objectAtIndex:[indexPath row]];
        
        // Pass that data on to the DetailViewController
        DetailViewController *detailVC = segue.destinationViewController;

   
        NSString *pathSelected=@"";;
     
        UIColor *exerColor = [UIColor whiteColor];
        //NSURL *fullURL = [[NSURL URLWithString:self.];
       
        

        switch (IndexSelected)
      
        {
            case 0:
              
                pathSelected = [[NSBundle mainBundle] pathForResource:@"BodyAttack" ofType:@"plist"];
        exerColor = [UIColor colorWithRed:255/255.0f green:196/255.0f blue:37/255.0f alpha:1];
               
                
           break;
                
            case 1:
                 pathSelected = [[NSBundle mainBundle] pathForResource:@"BodyBalance" ofType:@"plist"];
         exerColor = [UIColor colorWithRed:203/255.0f green:224/255.0f blue:136/255.0f alpha:1];
               
                break;
                
           
            case 2:
                  pathSelected = [[NSBundle mainBundle] pathForResource:@"BodyCombat" ofType:@"plist"];
                exerColor = [UIColor colorWithRed:129/255.0f green:124/255.0f blue:0/255.0f alpha:1];
                
                break;
                
            case 3:
                pathSelected = [[NSBundle mainBundle] pathForResource:@"BodyJam" ofType:@"plist"];
                exerColor = [UIColor colorWithRed:255/255.0f green:242/255.0f blue:0/255.0f alpha:1];
                break;
                
            case 4:
                pathSelected = [[NSBundle mainBundle] pathForResource:@"BodyPump" ofType:@"plist"];
                exerColor = [UIColor colorWithRed:244/255.0f green:63/255.0f blue:46/255.0f alpha:1];
                break;
                
            case 5:
                pathSelected = [[NSBundle mainBundle] pathForResource:@"BodyStep" ofType:@"plist"];
                exerColor = [UIColor colorWithRed:0/255.0f green:133/255.0f blue:156/255.0f alpha:1];
                break;
                
            case 6:
                pathSelected = [[NSBundle mainBundle] pathForResource:@"BodyVive" ofType:@"plist"];
                exerColor = [UIColor colorWithRed:122/255.0f green:104/255.0f blue:174/255.0f alpha:1];
                break;
                
            case 7:
                pathSelected = [[NSBundle mainBundle]pathForResource:@"RPM" ofType:@"plist"];
                exerColor = [UIColor colorWithRed:0/255.0f green:164/255.0f blue:228/255.0f alpha:1];
                break;
                
            case 8:
                pathSelected = [[NSBundle mainBundle] pathForResource:@"Shbam" ofType:@"plist"];
                exerColor = [UIColor colorWithRed:204/255.0f green:0/255.0f blue:102/255.0f alpha:1];
                break;
                
            case 9:
                pathSelected = [[NSBundle mainBundle] pathForResource:@"CxWorx" ofType:@"plist"];
                exerColor = [UIColor colorWithRed:236/255.0f green:119/255.0f blue:1/255.0f alpha:1];
                break;
                
            case 10:
                pathSelected = [[NSBundle mainBundle] pathForResource:@"GritStrength" ofType:@"plist"]; exerColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
                break;
                
            case 11:
                pathSelected = [[NSBundle mainBundle] pathForResource:@"GritPlyo" ofType:@"plist"]; exerColor = [UIColor colorWithRed:79/255.0f green:75/255.0f blue:76/255.0f alpha:1];
                break;
                
            case 12:
                pathSelected = [[NSBundle mainBundle] pathForResource:@"GritCardio" ofType:@"plist"]; exerColor = [UIColor colorWithRed:22/255.0f green:63/255.0f blue:118/255.0f alpha:1];
                break;
            default:
                break;
                
        }
        NSMutableArray *releaseList = [[NSMutableArray alloc] initWithContentsOfFile:pathSelected];
        

        detailVC.releaseList = releaseList;
        detailVC.releaseIndex = 0;
        detailVC.color = exerColor;
      
        
    
}
}




@end

