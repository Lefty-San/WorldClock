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
@property NSMutableArray *array;

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
   
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
   
   //NSLog(@"%d", count);
    _clocklabel1 = [defaults objectForKey:@"ClocksUserSet"];
    _clocklabel2 = [defaults objectForKey:@"ClocksUserSet1"];
    _clocklabel3 = [defaults objectForKey:@"ClocksUserSet2"];
    _clocklabel4 = [defaults objectForKey:@"ClocksUserSet3"];
    _clocklabel5 = [defaults objectForKey:@"ClocksUserSet4"];
    _clocklabel6 = [defaults objectForKey:@"ClocksUserSet5"];
    
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


/*- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
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
 
}*/
/*-(void) LabelLongPressed:(UILongPressGestureRecognizer *)recognizer  {
    //[self.clocklabel removeFromSuperview];
    self.clocklabel.text = @"";
    //Deletes user default
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet];
    
 //   [[NSUserDefaults standardUserDefaults] synchronize];
   
}
-(void) LabelLongPressed1:(UILongPressGestureRecognizer *)recognizer  {
    //[self.clocklabela removeFromSuperview];
    self.clocklabela.text = @"";
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet1];
    
   // [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(void) LabelLongPressed2:(UILongPressGestureRecognizer *)recognizer  {
    //[self.clocklabelb removeFromSuperview];
    self.clocklabelb.text = @"";
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet2];
    
   // [[NSUserDefaults standardUserDefaults] synchronize];
   
}
-(void) LabelLongPressed3:(UILongPressGestureRecognizer *)recognizer  {
   // [self.clocklabelc removeFromSuperview];
    self.clocklabelc.text = @"";
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet3];
    
 //   [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(void) LabelLongPressed4:(UILongPressGestureRecognizer *)recognizer  {
  //  [self.clocklabeld removeFromSuperview];
    self.clocklabeld.text = @"";
    NSDictionary *defaultsDict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDict allKeys])
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ClocksUserSet4];
    
 //   [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(void) LabelLongPressed5:(UILongPressGestureRecognizer *)recognizer  {
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
   
    
//    if (self.citiesListArray.count == 1) {
//        
//                
//        if(self.clocklabel.text == nil){
//            self.clocklabel.text = [self.citiesListArray objectAtIndex:0];
//            //save here
//            
//            [[NSUserDefaults standardUserDefaults]setObject:self.clocklabel.text forKey:ClocksUserSet];
//            [[NSUserDefaults standardUserDefaults]synchronize];
//        }
//        
//    }
//    if (self.citiesListArray.count == 2) {
//        if(self.clocklabel.text !=nil && self.clocklabela.text !=nil && self.clocklabelb.text != nil && self.clocklabelc.text != nil && self.clocklabeld.text != nil && self.clocklabele.text != nil){
//            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Can not add any more cities" message:@"Press and hold to delete one city" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//            [alert1 show];
//        }
//        if(self.clocklabela.text == nil){
//        self.clocklabela.text = [self.citiesListArray objectAtIndex:1];
//        [[NSUserDefaults standardUserDefaults]setObject:self.clocklabela.text forKey:ClocksUserSet1];
//        [[NSUserDefaults standardUserDefaults]synchronize];
//        }
//    }
//    if (self.citiesListArray.count == 3) {
//        if(self.clocklabel.text !=nil && self.clocklabela.text !=nil && self.clocklabelb.text != nil && self.clocklabelc.text != nil && self.clocklabeld.text != nil && self.clocklabele.text != nil){
//            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Can not add any more cities" message:@"Press and hold to delete one city" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//            [alert1 show];
//        }
//        if(self.clocklabelb.text == nil){
//        self.clocklabelb.text = [self.citiesListArray objectAtIndex:2];
//        [[NSUserDefaults standardUserDefaults]setObject:self.clocklabelb.text forKey:ClocksUserSet2];
//        [[NSUserDefaults standardUserDefaults]synchronize];
//    
//        }
//    }
//    if (self.citiesListArray.count == 4) {
//        if(self.clocklabel.text !=nil && self.clocklabela.text !=nil && self.clocklabelb.text != nil && self.clocklabelc.text != nil && self.clocklabeld.text != nil && self.clocklabele.text != nil){
//            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Can not add any more cities" message:@"Press and hold to delete one city" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//            [alert1 show];
//        }
//        if(self.clocklabelc.text == nil){
//        self.clocklabelc.text = [self.citiesListArray objectAtIndex:3];
//        [[NSUserDefaults standardUserDefaults]setObject:self.clocklabelc.text forKey:ClocksUserSet3];
//        [[NSUserDefaults standardUserDefaults]synchronize];
//        }
//    }
//    if (self.citiesListArray.count == 5) {
//        if(self.clocklabel.text !=nil && self.clocklabela.text !=nil && self.clocklabelb.text != nil && self.clocklabelc.text != nil && self.clocklabeld.text != nil && self.clocklabele.text != nil){
//            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Can not add any more cities" message:@"Press and hold to delete one city" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//            [alert1 show];
//        }
//        if(self.clocklabeld.text == nil){
//        self.clocklabeld.text = [self.citiesListArray objectAtIndex:4];
//        [[NSUserDefaults standardUserDefaults]setObject:self.clocklabeld.text forKey:ClocksUserSet4];
//        [[NSUserDefaults standardUserDefaults]synchronize];
//        }
//    }
//    if (self.citiesListArray.count == 6) {
//        if(self.clocklabel.text !=nil && self.clocklabela.text !=nil && self.clocklabelb.text != nil && self.clocklabelc.text != nil && self.clocklabeld.text != nil && self.clocklabele.text != nil){
//            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Can not add any more cities" message:@"Press and hold to delete one city" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//            [alert1 show];
//        }
//        if(self.clocklabele.text == nil){
//        self.clocklabele.text = [self.citiesListArray objectAtIndex:5];
//        [[NSUserDefaults standardUserDefaults]setObject:self.clocklabele.text forKey:ClocksUserSet5];
//        [[NSUserDefaults standardUserDefaults]synchronize];
//        }
//    }
//    if (self.citiesListArray.count > 6){
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Can not add more cities"
//                                                          message:@"press and hold to delete one City"
//                                                         delegate:self
//                                                cancelButtonTitle:@"Ok"
//                                                otherButtonTitles: nil];
//        
//        [alert show];
//    }
//    
//    
//    NSLog(@"%@", cities);
//    [controller dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.citiesListArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    ClockCell *cell = (ClockCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell.deletecell addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
   
    NSString *labels = [self.citiesListArray objectAtIndex:indexPath.row];
    
    cell.clockLabel.text = labels;
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
   // NSString *selectedItem = [self.citiesListArray[indexPath.section] objectAtIndex:indexPath.row];
  //  [self.array addObject:selectedItem];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"citiesListSegue"]){
        addcontroller *ac = [segue destinationViewController];
        ac.delegate = self;
    }
    else  if ([segue.identifier isEqualToString:@"bigClock"]) {
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        ZoomViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        destViewController.labelClock = [self.citiesListArray[indexPath.section] objectAtIndex:indexPath.row];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }

}

- (void)collectionView:(UICollectionViewCell *)collectionView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
      //  NSString *value =_clocklabel1;
     //   [self.delegate didselectwith: self.valuevalue];

    }
}


@end
