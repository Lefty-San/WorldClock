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
@property NSArray *tempGMT;

@end

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

    self.temp = [defaults arrayForKey:@"clocksuserset"];
    self.citiesListArray = [[NSMutableArray alloc]initWithArray:self.temp];
    self.tempGMT = [defaults arrayForKey:@"clocksGMT"];
    self.timezoneListArray = [[NSMutableArray alloc] initWithArray:self.tempGMT];

}
-(void)viewDidAppear:(BOOL)animated {
}

-(void)appWillResignActive {
  // store data here
}

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

    [self.timezoneListArray addObject:citytimezones];
    [self.citiesListArray addObject:cities];

    [self.collectionView reloadData];

}

-(void) didselectwith1:(addcontroller *)controller citytimezones:(NSString *)citytimezones{

    [self.timezoneListArray addObject:citytimezones];
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
    [cell.clockView start:timezonelabels];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.citiesListArray forKey:@"clocksuserset"];
    [defaults setObject:self.timezoneListArray forKey:@"clocksGMT"];
    [defaults synchronize];
    return cell;
}

- (void)delete:(UIButton *)sender

{

    NSIndexPath *indexPath = [self.collectionView indexPathForCell:(ClockCell *)sender.superview.superview];

    [self.citiesListArray removeObjectAtIndex:indexPath.row];

    [self.collectionView reloadData];

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

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
    }
}


@end