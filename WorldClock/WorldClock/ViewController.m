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

@interface ViewController () {
    
    NSArray *clockArray;

}

// Smart Message
@property NSMutableArray *citiesListArray;

@end

NSString *const ClocksUserSet = @"ClocksUserSetKey";
NSString *const ClocksUserSet1 = @"ClocksUserSetKey1";
NSString *const ClocksUserSet2 = @"ClocksUserSetKey2";
NSString *const ClocksUserSet3 = @"ClocksUserSetKey3";
NSString *const ClocksUserSet4 = @"ClocksUserSetKey4";
NSString *const ClocksUserSet5 = @"ClocksUserSetKey5";


@implementation ViewController
    
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

	// Do any additional setup after loading the view, typically from a nib.

    self.citiesListArray = [[NSMutableArray alloc]initWithCapacity:6];
   
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
   
   // int count = [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] count];
   // NSLog(@"%d", count);
    _clocklabel1 = [defaults objectForKey:ClocksUserSet];
    _clocklabel2 = [defaults objectForKey:ClocksUserSet1];
    _clocklabel3 = [defaults objectForKey:ClocksUserSet2];
    _clocklabel4 = [defaults objectForKey:ClocksUserSet3];
    _clocklabel5 = [defaults objectForKey:ClocksUserSet4];
    _clocklabel6 = [defaults objectForKey:ClocksUserSet5];
   

   
  /*  self.clocklabel.text = clocklabel1;
    self.clocklabela.text = clocklabel2;
     self.clocklabelb.text = clocklabel3;
     self.clocklabelc.text = clocklabel4;
     self.clocklabeld.text = clocklabel5;
     self.clocklabele.text = clocklabel6;
    

   
    
    clocklabel1 = [self.clocklabel text];
    clocklabel2 = [self.clocklabela text];
    clocklabel3 = [self.clocklabelb text];
    clocklabel4 = [self.clocklabelc text];
    clocklabel5 = [self.clocklabeld text];
    clocklabel6 = [self.clocklabele text]; */
   
   
    defaults = [NSUserDefaults standardUserDefaults];
   // defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:_clocklabel1 forKey:ClocksUserSet];
     [defaults setObject:_clocklabel2 forKey:ClocksUserSet1];
    [defaults setObject:_clocklabel3 forKey:ClocksUserSet2];
    [defaults setObject:_clocklabel4 forKey:ClocksUserSet3];
    [defaults setObject:_clocklabel5 forKey:ClocksUserSet4];
    [defaults setObject:_clocklabel6 forKey:ClocksUserSet5];
    
   
    [defaults synchronize];
    }
    


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if (CGRectContainsPoint([self.view frame], [touch locationInView:self.view])){
        //do whatever you want
        
        self.clocklabel.userInteractionEnabled = YES;
        self.clocklabela.userInteractionEnabled = YES;
        self.clocklabelb.userInteractionEnabled = YES;
        self.clocklabelc.userInteractionEnabled = YES;
        self.clocklabeld.userInteractionEnabled = YES;
        self.clocklabele.userInteractionEnabled = YES;
        
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]      initWithTarget:self action:@selector(LabelLongPressed:)];
        UILongPressGestureRecognizer *longPress1 = [[UILongPressGestureRecognizer alloc]      initWithTarget:self action:@selector(LabelLongPressed1:)];
        UILongPressGestureRecognizer *longPress2 = [[UILongPressGestureRecognizer alloc]      initWithTarget:self action:@selector(LabelLongPressed2:)];
        UILongPressGestureRecognizer *longPress3 = [[UILongPressGestureRecognizer alloc]      initWithTarget:self action:@selector(LabelLongPressed3:)];
        UILongPressGestureRecognizer *longPress4 = [[UILongPressGestureRecognizer alloc]      initWithTarget:self action:@selector(LabelLongPressed4:)];
        UILongPressGestureRecognizer *longPress5 = [[UILongPressGestureRecognizer alloc]      initWithTarget:self action:@selector(LabelLongPressed5:)];
        
        longPress.minimumPressDuration = 0.5;  
        longPress.numberOfTapsRequired = 0;
        longPress1.minimumPressDuration = 0.5;
        longPress1.numberOfTapsRequired = 0;
        longPress2.minimumPressDuration = 0.5;
        longPress2.numberOfTapsRequired = 0;
        longPress3.minimumPressDuration = 0.5;
        longPress3.numberOfTapsRequired = 0;
        longPress4.minimumPressDuration = 0.5;
        longPress4.numberOfTapsRequired = 0;
        longPress5.minimumPressDuration = 0.5;
        longPress5.numberOfTapsRequired = 0;
        
        
        [self.clocklabel addGestureRecognizer:longPress];
        [self.clocklabela addGestureRecognizer:longPress1];
        [self.clocklabelb addGestureRecognizer:longPress2];
        [self.clocklabelc addGestureRecognizer:longPress3];
        [self.clocklabeld addGestureRecognizer:longPress4];
        [self.clocklabele addGestureRecognizer:longPress5];
       
        
        
    }
    
}
-(void) LabelLongPressed:(UILongPressGestureRecognizer *)recognizer  {
    //[self.clocklabel removeFromSuperview];
    self.clocklabel.text = @"";
    //Deletes user default
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
   
}
-(void) LabelLongPressed1:(UILongPressGestureRecognizer *)recognizer  {
    //[self.clocklabela removeFromSuperview];
    self.clocklabela.text = @"";
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet1];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(void) LabelLongPressed2:(UILongPressGestureRecognizer *)recognizer  {
    //[self.clocklabelb removeFromSuperview];
    self.clocklabelb.text = @"";
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet2];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
   
}
-(void) LabelLongPressed3:(UILongPressGestureRecognizer *)recognizer  {
   // [self.clocklabelc removeFromSuperview];
    self.clocklabelc.text = @"";
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet3];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(void) LabelLongPressed4:(UILongPressGestureRecognizer *)recognizer  {
  //  [self.clocklabeld removeFromSuperview];
    self.clocklabeld.text = @"";
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet4];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(void) LabelLongPressed5:(UILongPressGestureRecognizer *)recognizer  {
   // [self.clocklabele removeFromSuperview];
    self.clocklabele.text = @"";
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet5];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) didselectwith:(addcontroller *)controller cities:(NSString *)cities{
    
    [self.citiesListArray addObject:cities];
   
    
    if (self.citiesListArray.count == 1) {
        
        if(self.clocklabel.text !=nil && self.clocklabela.text !=nil && self.clocklabelb.text != nil && self.clocklabelc.text != nil && self.clocklabeld.text != nil && self.clocklabele.text != nil){
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Can not add any more cities" message:@"Press and hold to delete one city" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert1 show];
        }
        
        if(self.clocklabel.text == nil){
            self.clocklabel.text = [self.citiesListArray objectAtIndex:0];
            //save here
            
            [[NSUserDefaults standardUserDefaults]setObject:self.clocklabel.text forKey:ClocksUserSet];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }
        
    }
    if (self.citiesListArray.count == 2) {
        if(self.clocklabel.text !=nil && self.clocklabela.text !=nil && self.clocklabelb.text != nil && self.clocklabelc.text != nil && self.clocklabeld.text != nil && self.clocklabele.text != nil){
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Can not add any more cities" message:@"Press and hold to delete one city" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert1 show];
        }
        if(self.clocklabela.text == nil){
        self.clocklabela.text = [self.citiesListArray objectAtIndex:1];
        [[NSUserDefaults standardUserDefaults]setObject:self.clocklabela.text forKey:ClocksUserSet1];
        [[NSUserDefaults standardUserDefaults]synchronize];
        }
    }
    if (self.citiesListArray.count == 3) {
        if(self.clocklabel.text !=nil && self.clocklabela.text !=nil && self.clocklabelb.text != nil && self.clocklabelc.text != nil && self.clocklabeld.text != nil && self.clocklabele.text != nil){
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Can not add any more cities" message:@"Press and hold to delete one city" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert1 show];
        }
        if(self.clocklabelb.text == nil){
        self.clocklabelb.text = [self.citiesListArray objectAtIndex:2];
        [[NSUserDefaults standardUserDefaults]setObject:self.clocklabelb.text forKey:ClocksUserSet2];
        [[NSUserDefaults standardUserDefaults]synchronize];
    
        }
    }
    if (self.citiesListArray.count == 4) {
        if(self.clocklabel.text !=nil && self.clocklabela.text !=nil && self.clocklabelb.text != nil && self.clocklabelc.text != nil && self.clocklabeld.text != nil && self.clocklabele.text != nil){
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Can not add any more cities" message:@"Press and hold to delete one city" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert1 show];
        }
        if(self.clocklabelc.text == nil){
        self.clocklabelc.text = [self.citiesListArray objectAtIndex:3];
        [[NSUserDefaults standardUserDefaults]setObject:self.clocklabelc.text forKey:ClocksUserSet3];
        [[NSUserDefaults standardUserDefaults]synchronize];
        }
    }
    if (self.citiesListArray.count == 5) {
        if(self.clocklabel.text !=nil && self.clocklabela.text !=nil && self.clocklabelb.text != nil && self.clocklabelc.text != nil && self.clocklabeld.text != nil && self.clocklabele.text != nil){
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Can not add any more cities" message:@"Press and hold to delete one city" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert1 show];
        }
        if(self.clocklabeld.text == nil){
        self.clocklabeld.text = [self.citiesListArray objectAtIndex:4];
        [[NSUserDefaults standardUserDefaults]setObject:self.clocklabeld.text forKey:ClocksUserSet4];
        [[NSUserDefaults standardUserDefaults]synchronize];
        }
    }
    if (self.citiesListArray.count == 6) {
        if(self.clocklabel.text !=nil && self.clocklabela.text !=nil && self.clocklabelb.text != nil && self.clocklabelc.text != nil && self.clocklabeld.text != nil && self.clocklabele.text != nil){
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Can not add any more cities" message:@"Press and hold to delete one city" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert1 show];
        }
        if(self.clocklabele.text == nil){
        self.clocklabele.text = [self.citiesListArray objectAtIndex:5];
        [[NSUserDefaults standardUserDefaults]setObject:self.clocklabele.text forKey:ClocksUserSet5];
        [[NSUserDefaults standardUserDefaults]synchronize];
        }
    }
    else if (self.citiesListArray.count > 6){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Can not add more cities"
                                                          message:@"press and hold to delete one City"
                                                         delegate:self
                                                cancelButtonTitle:@"Ok"
                                                otherButtonTitles: nil];
        
        [alert show];
    }
    
    
    NSLog(@"%@", cities);
    [controller dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    ClockCell *cell = (ClockCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.clockLabel.text = _clocklabel1;
    }
    else if (indexPath.row==1) {
        cell.clockLabel.text = _clocklabel2;
    }
    else if (indexPath.row==2) {
        cell.clockLabel.text = _clocklabel3;
    }
    else if (indexPath.row==3) {
        cell.clockLabel.text = _clocklabel4;
    }
    else if (indexPath.row==4) {
        cell.clockLabel.text = _clocklabel5;
    }
    else if (indexPath.row==5) {
        cell.clockLabel.text = _clocklabel6;
    }
   // cell.clockLabel.text = [@"objectAtIndex:indexPath.row];
    
    [cell.clockView setClockBackgroundImage:[UIImage imageNamed:@"ClockFaceAlpha.png"].CGImage];
	[cell.clockView setHourHandImage:[UIImage imageNamed:@"ClockHourHand.png"].CGImage];
	[cell.clockView setMinHandImage:[UIImage imageNamed:@"ClockMinuteHand.png"].CGImage];
	[cell.clockView setSecHandImage:[UIImage imageNamed:@"ClockSecondHand.png"].CGImage];
    
    [cell.clockView start];
   // [cell.clockView clockLabel];
   // _zoomView = (UIView *)[Cell viewWithTag:100];
    
  //  _zoomView = [objectAtIndex:indexPath.row];
    // cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"addcontrollersegue"]){
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
    ZoomViewController *detailVC = [[ZoomViewController alloc] initWithNibName:@"Cell" bundle:[NSBundle mainBundle]];
    if (indexPath.row == 0) {
        _clocklabel1;
    }
    [self presentViewController:detailVC animated:YES completion:nil];
}


@end
