//
//  ClockSetup.m
//  WorldClock
//
//  Created by Eric Prewitt on 10/8/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import "ClockSetup.h"
@implementation ClockSetup


- (void)start
{
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateClock:) userInfo:nil repeats:YES];
}

- (void)stop
{
	[timer invalidate];
	timer = nil;
}

float Degrees2Radians(float degrees) { return degrees * M_PI / 180; }

- (void) updateClock:(NSTimer *)theTimer{
    
	//get whole melbourne time hh:mm:ss
    NSDate *timenow = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setTimeStyle:NSDateFormatterLongStyle];
    [df setTimeZone:[NSTimeZone timeZoneWithName:@"US/Chicago"]];
    NSString *konJikan = [df stringFromDate:timenow];
    NSDate *melbournecurrenttime = [df dateFromString:konJikan];
    NSLog(@"%@", konJikan);
    
    //break apart the time hh  mm   ss
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit)fromDate:melbournecurrenttime];
    
	NSInteger seconds = [dateComponents second];
	NSInteger minutes = [dateComponents minute];
	NSInteger hours = [dateComponents hour];
	//NSLog(@"raw: hours:%d min:%d secs:%d", hours, minutes, seconds);
	if (hours > 12) hours -=12; //PM
    
	//set angles for each of the hands
	CGFloat secAngle = Degrees2Radians(seconds/60.0*360);
	CGFloat minAngle = Degrees2Radians(minutes/60.0*360);
	CGFloat hourAngle = Degrees2Radians(hours/12.0*360) + minAngle/12.0;
	
	//reflect the rotations + 180 degres since CALayers coordinate system is inverted
	secHand.transform = CATransform3DMakeRotation (secAngle+M_PI, 0, 0, 1);
	minHand.transform = CATransform3DMakeRotation (minAngle+M_PI, 0, 0, 1);
	hourHand.transform = CATransform3DMakeRotation (hourAngle+M_PI, 0, 0, 1);
}



-(void)defaultSetup
{
    containerLayer = [CALayer layer];
    hourHand = [CALayer layer];
    minHand = [CALayer layer];
    secHand = [CALayer layer];
    
    //default appearance
    [self setClockBackgroundImage:NULL];
    [self setHourHandImage:NULL];
    [self setMinHandImage:NULL];
    [self setSecHandImage:NULL];
    
    //add all created sublayers
    [containerLayer addSublayer:hourHand];
    [containerLayer addSublayer:minHand];
    [containerLayer addSublayer:secHand];
    [self.layer addSublayer:containerLayer];
}

//customize appearence
- (void)setHourHandImage:(CGImageRef)image
{
	if (image == NULL) {
		hourHand.backgroundColor = [UIColor blackColor].CGColor;
		hourHand.cornerRadius = 3;
	}else{
		hourHand.backgroundColor = [UIColor clearColor].CGColor;
		hourHand.cornerRadius = 0.0;
		
	}
	hourHand.contents = (__bridge id)image;
}

- (void)setMinHandImage:(CGImageRef)image
{
	if (image == NULL) {
		minHand.backgroundColor = [UIColor grayColor].CGColor;
	}else{
		minHand.backgroundColor = [UIColor clearColor].CGColor;
	}
	minHand.contents = (__bridge id)image;
}

- (void)setSecHandImage:(CGImageRef)image
{
	if (image == NULL) {
		secHand.backgroundColor = [UIColor whiteColor].CGColor;
		secHand.borderWidth = 1.0;
		secHand.borderColor = [UIColor grayColor].CGColor;
	}else{
		secHand.backgroundColor = [UIColor clearColor].CGColor;
		secHand.borderWidth = 0.0;
		secHand.borderColor = [UIColor clearColor].CGColor;
	}
	secHand.contents = (__bridge id)image;
}

- (void)setClockBackgroundImage:(CGImageRef)image
{
	if (image == NULL) {
		containerLayer.borderColor = [UIColor blackColor].CGColor;
		containerLayer.borderWidth = 1.0;
		containerLayer.cornerRadius = 5.0;
	}else{
		containerLayer.borderColor = [UIColor clearColor].CGColor;
		containerLayer.borderWidth = 0.0;
		containerLayer.cornerRadius = 0.0;
	}
	containerLayer.contents = (__bridge id)image;
}
- (void) layoutSubviews
{
	[super layoutSubviews];
    
	containerLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    /* Lots of Comments, just trying to get around and an abort before deleting */
    
    //	float length = MIN(self.frame.size.width, self.frame.size.height)/2;
	CGPoint c = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
	hourHand.position = minHand.position = secHand.position = c;
    
    //	CGFloat w, h;
	CGFloat scale = 1;
	if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
		scale = [UIScreen mainScreen].scale;
	}
    
	hourHand.anchorPoint = CGPointMake(0.5,0);
	minHand.anchorPoint = CGPointMake(0.5,0);
	secHand.anchorPoint = CGPointMake(0.5,0);
	containerLayer.anchorPoint = CGPointMake(0.5, 0.5);
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self defaultSetup];
}

//- (void)removeFromSuperview
//{
//	[self stop];
//	[super removeFromSuperview];
//}

//- (void)dealloc
//{
//	[self stop];
//}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
