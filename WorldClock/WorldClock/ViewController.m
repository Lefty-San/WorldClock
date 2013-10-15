//
//  ViewController.m
//  WorldClock
//
//  Created by Eric Prewitt on 10/1/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import "ViewController.h"
#import "ZoomViewController.h"
#import  "ClockCell.h"
#import "addcontroller.h"

@interface ViewController ()<AddControllerDelegate> {
    
    NSArray *clockArray;

}

// Smart Message
@property NSMutableArray *citiesListArray;
@property NSMutableArray *timezoneListArray;

@end

NSString *const ClocksUserSet = @"ClocksUserSetKey";
NSString *const ClocksUserSet1 = @"ClocksUserSetKey1";
NSString *const ClocksUserSet2 = @"ClocksUserSetKey2";
NSString *const ClocksUserSet3 = @"ClocksUserSetKey3";
NSString *const ClocksUserSet4 = @"ClocksUserSetKey4";
NSString *const ClocksUserSet5 = @"ClocksUserSetKey5";

@implementation ViewController
//@synthesize delegate;
    
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
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
   //long press
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = .5; //seconds
    lpgr.delegate = self;
    [self.collectionView addGestureRecognizer:lpgr];
    
	// Do any additional setup after loading the view, typically from a nib.

    self.citiesListArray = [[NSMutableArray alloc]initWithCapacity:6];
    self.timezoneListArray = [[NSMutableArray alloc]initWithCapacity:6];
    [[NSUserDefaults standardUserDefaults]setObject:self.citiesListArray forKey:@"clocksuserset"];
   
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
   
   /*//NSLog(@"%d", count);
    _clocklabel1 = [defaults objectForKey:@"ClocksUserSet"];
    _clocklabel2 = [defaults objectForKey:@"ClocksUserSet1"];
    _clocklabel3 = [defaults objectForKey:@"ClocksUserSet2"];
    _clocklabel4 = [defaults objectForKey:@"ClocksUserSet3"];
    _clocklabel5 = [defaults objectForKey:@"ClocksUserSet4"];
    _clocklabel6 = [defaults objectForKey:@"ClocksUserSet5"]; */
    
    _gmt1 = [defaults objectForKey:@"ClocksUserSetGMT"];
    _gmt2 = [defaults objectForKey:@"ClocksUserSet1GMT"];
    _gmt3 = [defaults objectForKey:@"ClocksUserSet2GMT"];
    _gmt4 = [defaults objectForKey:@"ClocksUserSet3GMT"];
    _gmt5 = [defaults objectForKey:@"ClocksUserSet4GMT"];
    _gmt6 = [defaults objectForKey:@"ClocksUserSet5GMT"];
   
}
    
-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    } else {
        // get the cell at indexPath (the one you long pressed)
        UICollectionViewCell* cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        // do stuff with the cell
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Clock Deleted"
                                                          message:@""
                                                         delegate:self
                                             cancelButtonTitle:@"Ok"
                                                otherButtonTitles:nil];
        
        [alert show];
        
        
        
        [cell removeFromSuperview];
    }
}


/*-(void) LabelLongPressed5:(UILongPressGestureRecognizer *)recognizer  {
   // [self.clocklabele removeFromSuperview];
    self.clocklabele.text = @"";
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet5];
    
  //  [[NSUserDefaults standardUserDefaults] synchronize];
    
} */






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) didselectwith:(addcontroller *)controller cities:(NSString *)cities{
    
    [self.citiesListArray addObject:cities];
    [self.collectionView reloadData];
   
    

}
-(void) didselectwith1:(addcontroller *)controller citytimezones:(NSString *)citytimezones{
    
    [self.timezoneListArray addObject:citytimezones];
    NSLog(@"%@",citytimezones);
    [self.collectionView reloadData];
    
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.citiesListArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    ClockCell *cell = (ClockCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell.deletecell addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
   
    NSString *labels = [self.citiesListArray objectAtIndex:indexPath.row];
    NSString *timezonelabels = [self.timezoneListArray objectAtIndex:indexPath.row];
    
    cell.clockLabel.text = labels;
    cell.timezoneLabel.text = timezonelabels;
    [cell.clockView setClockBackgroundImage:[UIImage imageNamed:@"ClockFaceAlpha.png"].CGImage];
	[cell.clockView setHourHandImage:[UIImage imageNamed:@"ClockHourHand.png"].CGImage];
	[cell.clockView setMinHandImage:[UIImage imageNamed:@"ClockMinuteHand.png"].CGImage];
	[cell.clockView setSecHandImage:[UIImage imageNamed:@"ClockSecondHand.png"].CGImage];
    
    
    
    [cell.clockView start];
  
    
    return cell;
}

- (void)delete:(UIButton *)sender

{
    
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:(ClockCell *)sender.superview.superview];
    
    
    
    [self.citiesListArray removeObjectAtIndex:indexPath.row];
    
    [self.collectionView reloadData];
    
    
    
    NSLog(@"delete but pressed");
    
    
    
    NSLog(@"%@",self.citiesListArray);
    
    
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   // [self.delegate passItemBack:self didFinishWithItem:[_clocklabel1]];
    if (indexPath.row==0) {
        
    } else if (indexPath.row == 1) {
       // ZoomViewController *zoom = [[ZoomViewController alloc] initWithNibName:nil bundle:nil];
    
        
    } else if (indexPath.row == 2) {
        
    } else if (indexPath.row == 3) {
        
    } else if (indexPath.row == 4) {
        
    } else if (indexPath.row == 5) {
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"citiesListSegue"]){
        addcontroller *ac = [segue destinationViewController];
        ac.delegate = self;
    }
 /*   else  if ([segue.identifier isEqualToString:@"bigClock"]) {
        NSString *indexPaths = [self.collectionView indexPathsForSelectedItems];
        ZoomViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        destViewController.clockLabel = [_clocklabel1[indexPath.section] objectAtIndex:indexPath.row];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    } */

}

- (void)collectionView:(UICollectionViewCell *)collectionView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
      //  NSString *value =_clocklabel1;
     //   [self.delegate didselectwith: self.valuevalue];

    }
}


@end
