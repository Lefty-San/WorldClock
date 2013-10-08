//
//  ViewController.m
//  WorldClock
//
//  Created by Eric Prewitt on 10/1/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// Smart Message
@property NSMutableArray *citiesListArray;

@end

NSString *const ClocksUserSet = @"ClocksUserSetKey";
NSString *const ClocksUserSet1 = @"ClocksUserSetKey1";
NSString *const ClocksUserSet2 = @"ClocksUserSetKey2";
NSString *const ClocksUserSet3 = @"ClocksUserSetKey3";

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"addcontrollersegue"]){
        addcontroller *ac = [segue destinationViewController];
        ac.delegate = self;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.citiesListArray = [[NSMutableArray alloc]initWithCapacity:7];
   
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   // NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];

     NSString *clocklabel1 = [defaults objectForKey:ClocksUserSet];
   //  NSString *clocklabel2 = [defaults1 objectForKey:ClocksUserSet1];
   // NSString *clocklabel3 = [defaults objectForKey:ClocksUserSet2];
   // NSString *clocklabel4 = [defaults objectForKey:ClocksUserSet3];

   self.clocklabel.text = clocklabel1;
  //  self.clocklabela.text = clocklabel2;
   // self.clocklabelc.text = clocklabel3;
   // self.clocklabeld.text = clocklabel4;
    
    clocklabel1 = [self.clocklabel text];
   //  clocklabel2 = [self.clocklabela text];
   // clocklabel3 = [self.clocklabelc text];
    // clocklabel4 = [self.clocklabeld text];
    defaults = [NSUserDefaults standardUserDefaults];
   //  defaults1 = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:clocklabel1 forKey:ClocksUserSet];
   //     [defaults1 setObject:clocklabel2 forKey:ClocksUserSet1];
   // [defaults setObject:clocklabel3 forKey:ClocksUserSet2];
   // [defaults setObject:clocklabel4 forKey:ClocksUserSet3];
    [defaults synchronize];
  //  [defaults1 synchronize];


   
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) didselectwith:(addcontroller *)controller cities:(NSString *)cities{
    
    [self.citiesListArray addObject:cities];
    
    if (self.citiesListArray.count == 1) {
        self.clocklabel.text = [self.citiesListArray objectAtIndex:0];
    }
    if (self.citiesListArray.count == 2) {
        self.clocklabela.text = [self.citiesListArray objectAtIndex:1];
    }
    if (self.citiesListArray.count == 3) {
        self.clocklabelb.text = [self.citiesListArray objectAtIndex:2];
    }
    if (self.citiesListArray.count == 4) {
        self.clocklabelc.text = [self.citiesListArray objectAtIndex:3];
    }
    if (self.citiesListArray.count == 5) {
        self.clocklabeld.text = [self.citiesListArray objectAtIndex:4];
    }
    if (self.citiesListArray.count == 6) {
        self.clocklabele.text = [self.citiesListArray objectAtIndex:5];
    }
    if (self.citiesListArray.count == 7) {
        self.clocklabelf.text = [self.citiesListArray objectAtIndex:6];
    }
    
    
  // self.clocklabelc.text = cities;
    //self.clocklabela.text = cities;
    
    NSLog(@"%@", cities);
    [controller dismissViewControllerAnimated:YES completion:nil];
}


@end
