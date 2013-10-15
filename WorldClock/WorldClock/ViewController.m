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
@property NSArray *temp;

@end

/*NSString *const ClocksUserSet = @"ClocksUserSetKey";
NSString *const ClocksUserSet1 = @"ClocksUserSetKey1";
NSString *const ClocksUserSet2 = @"ClocksUserSetKey2";
NSString *const ClocksUserSet3 = @"ClocksUserSetKey3";
NSString *const ClocksUserSet4 = @"ClocksUserSetKey4";
NSString *const ClocksUserSet5 = @"ClocksUserSetKey5"; */

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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
   
   // self.citiesListArray = [defaults arrayForKey:@"clocksuserset"];
    self.temp = [defaults arrayForKey:@"clocksuserset"];
    self.citiesListArray = [[NSMutableArray alloc]initWithArray:self.temp];
    NSLog(@"sdlfjlsdfj%@", self.citiesListArray);
  //  self.citiesListArray = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] arrayForKey:@"clocksuserset"]];
    
    self.citiesListArray = [[NSMutableArray alloc]initWithCapacity:6];
    self.timezoneListArray = [[NSMutableArray alloc]initWithCapacity:6];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appHasGoneInForeground)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];

    
  //  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   // [defaults setObject:self.citiesListArray forKey:@"clocksuserset"];
   // [defaults synchronize];
   
}
-(void)viewDidAppear:(BOOL)animated
{
   // NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   // NSMutableArray *array = [defaults arrayForKey:@"clocksuserset"];

    
}
-(void)appHasGoneInForeground{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    [standardUserDefaults setObject:self.citiesListArray forKey:@"clocksuserset"];
    [standardUserDefaults synchronize];
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

-(void) didselectwith:(addcontroller *)controller cities: (NSString *) cities citytimezones: (NSString *) citytimezones{
    
    NSLog(@"%@",citytimezones);
    NSLog(@"%@",cities);
    
    [self.timezoneListArray addObject:citytimezones];
    [self.citiesListArray addObject:cities];
    
    NSLog(@"%@",citytimezones);
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
    //NSString *labels = [self.temp objectAtIndex:indexPath.row];
    //NSLog(@"jkh %@", labels);
    NSString *timezonelabels = [self.timezoneListArray objectAtIndex:indexPath.row];
    
    cell.clockLabel.text = labels;
    cell.timezoneLabel.text = timezonelabels;
    [cell.clockView setClockBackgroundImage:[UIImage imageNamed:@"ClockFaceAlpha.png"].CGImage];
	[cell.clockView setHourHandImage:[UIImage imageNamed:@"ClockHourHand.png"].CGImage];
	[cell.clockView setMinHandImage:[UIImage imageNamed:@"ClockMinuteHand.png"].CGImage];
	[cell.clockView setSecHandImage:[UIImage imageNamed:@"ClockSecondHand.png"].CGImage];
    [cell.clockView start:timezonelabels];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.citiesListArray forKey:@"clocksuserset"];
    [defaults synchronize];
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
        NSString *cityName = [self.citiesListArray objectAtIndex:indexPath.row];
        destViewController.labelClock = cityName;
        
        NSString *timeZone = [self.timezoneListArray objectAtIndex:indexPath.row];
        destViewController.timeZone = timeZone;
        
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
