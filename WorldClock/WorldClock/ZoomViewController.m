//
//  ZoomViewController.m
//  WorldClock
//
//  Created by Eric Prewitt on 10/1/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import "ZoomViewController.h"

@implementation ZoomViewController

@synthesize clockView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Clock images for view
    [clockView setClockBackgroundImage:[UIImage imageNamed:@"ClockFaceAlpha.png"].CGImage];
	[clockView setHourHandImage:[UIImage imageNamed:@"ClockMinuteHand.png"].CGImage];
	[clockView setMinHandImage:[UIImage imageNamed:@"ClockHourHand.png"].CGImage];
	[clockView setSecHandImage:[UIImage imageNamed:@"ClockSecondHand.png"].CGImage];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
	//start the clock at current time
	[clockView start];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	//stop the clock
	[clockView stop];
    
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	self.clockView = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)viewWillLayoutSubviews
{
	[super viewWillLayoutSubviews];
    
	const CGSize size1 = self.clockView.frame.size;
    
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
		float verticalSeparation = (self.view.bounds.size.height - size1.height)/3.0;
		self.clockView.frame = CGRectMake((self.view.bounds.size.width - size1.width)/2,
                                          verticalSeparation,
                                          size1.width,
                                          size1.height);
	} else {
		float horizontalSeparation = (self.view.bounds.size.width - size1.width)/3;
		self.clockView.frame = CGRectMake(horizontalSeparation,
                                          (self.view.bounds.size.height - size1.height)/2,
                                          size1.width,
                                          size1.height);
	}
}

@end
