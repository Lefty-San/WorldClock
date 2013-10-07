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

@end

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
    NSLog(@"asdf");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) didselectwith:(addcontroller *)controller cities:(NSString *)cities{
    self.clocklabel.text = cities;
    NSLog(@"%@", cities);
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
