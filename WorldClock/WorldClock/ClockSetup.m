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

        /*************** Begin Switch ***************/
    
/*
    switch (citytimezones) {
        case @"(GMT)":
            zone = 7*60*60;
            break;
        case @"GMT-1)":
            zone = 6*60*60;
            break;
        case @"(GMT-2)":
            zone = 5*60*60;
            break;
        case @"(GMT-3)":
            zone = 4*60*60;
            break;
        case @"(GMT-4)":
            zone = 3*60*60:
            break;
        case @"(GMT-5)":
            zone = 2*60*60;
            break;
        case @"(GMT-6)":
            zone = 60*60;
            break;
        case @"(MDT)":
            zone = 0;
            break;
        case @"(GMT+1":
            zone = 8*60*60;
            break;
        case @"(GMT+2)":
            zone = 9*60*60;
            break;
        case @"(GMT+3)":
            zone = 10*60*60;
            break;
        case @"(GMT+4)":
            zone = 11*60*60;
            break;
        case @"(GMT+5)":
            zone = 12*60*60;
            break;
        case @"(GMT+6)":
            zone = 13*60*60;
            break;
        case @"(GMT+7)":
            zone = 14*60*60;
            break;
        case @"(GMT+8)":
            zone = 15*60*60;
            break;
        case @"(GMT+9)":
            zone = 16*60*60;
            break
        case @"(GMT+10)":
            zone = 17*60*60;
            break;
        default:
            zone = 7*60*60;
            break;
    }
    
*/
    
    /* This is an example of setting the time interval externally  */
    zone = 2*60*60;
    /*  *  */
    
    
    NSDate *newYorkTime = [NSDate dateWithTimeIntervalSinceNow:zone];
    //    NSLog(@"%@",newYorkTime);
    
    //break apart the time hh  mm   ss
    NSCalendar *calendar = [NSCalendar currentCalendar];    
    NSDateComponents *dateComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit)fromDate:newYorkTime];
    
	NSInteger seconds = [dateComponents second];
	NSInteger minutes = [dateComponents minute];
	NSInteger hours = [dateComponents hour];
//	NSLog(@"raw: hours:%d min:%d secs:%d", hours, minutes, seconds);
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
//	if (image == NULL) {
//		hourHand.backgroundColor = [UIColor blackColor].CGColor;
//		hourHand.cornerRadius = 3;
//	}else{
		hourHand.backgroundColor = [UIColor clearColor].CGColor;
		hourHand.cornerRadius = 0.0;
        hourHand.borderWidth = 0.0;
		
//	}
	hourHand.contents = (__bridge id)image;

}

- (void)setMinHandImage:(CGImageRef)image
{
//	if (image == NULL) {
//		minHand.backgroundColor = [UIColor grayColor].CGColor;
//	}else{
		minHand.backgroundColor = [UIColor clearColor].CGColor;
        minHand.borderWidth = 0.0;
		minHand.cornerRadius = 0.0;
//	}
	minHand.contents = (__bridge id)image;
}

- (void)setSecHandImage:(CGImageRef)image
{
//	if (image == NULL) {
//		secHand.backgroundColor = [UIColor whiteColor].CGColor;
//		secHand.borderWidth = 1.0;
//		secHand.borderColor = [UIColor grayColor].CGColor;
//	}else{
		secHand.backgroundColor = [UIColor clearColor].CGColor;
		secHand.borderColor = [UIColor clearColor].CGColor;
        secHand.borderWidth = 0.0;
		secHand.cornerRadius = 0.0;
//	}
	secHand.contents = (__bridge id)image;
}

- (void)setClockBackgroundImage:(CGImageRef)image
{
//	if (image == NULL) {
//		containerLayer.borderColor = [UIColor blackColor].CGColor;
//		containerLayer.borderWidth = 1.0;
//		containerLayer.cornerRadius = 5.0;
//	}else{
		containerLayer.borderColor = [UIColor clearColor].CGColor;
		containerLayer.borderWidth = 0.0;
		containerLayer.cornerRadius = 0.0;
//	}
	containerLayer.contents = (__bridge id)image;
}

//Default sizes of hands:
//in percentage (0.0 - 1.0)
//#define HOURS_HAND_LENGTH 0.65
//#define MIN_HAND_LENGTH 0.75
//#define SEC_HAND_LENGTH 0.8
//in pixels
//#define HOURS_HAND_WIDTH 10
//#define MIN_HAND_WIDTH 8
//#define SEC_HAND_WIDTH 4

- (void) layoutSubviews
{
	[super layoutSubviews];
    
	containerLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
//	float length = MIN(self.frame.size.width, self.frame.size.height)/2;
	CGPoint c = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
	hourHand.position = minHand.position = secHand.position = c;
    
	CGFloat w, h;
	CGFloat scale = 1;
	if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
		scale = [UIScreen mainScreen].scale;
	}
	
//	if (hourHand.contents == NULL){
//		w = HOURS_HAND_WIDTH;
//		h = length*HOURS_HAND_LENGTH;
//	}else{
		w = CGImageGetWidth((__bridge CGImageRef)hourHand.contents)/scale;
		h = CGImageGetHeight((__bridge CGImageRef)hourHand.contents)/scale;
//	}
	hourHand.bounds = CGRectMake(0,0,w,h);
	
//	if (minHand.contents == NULL){
//		w = MIN_HAND_WIDTH;
//		h = length*MIN_HAND_LENGTH;
//	}else{
		w = CGImageGetWidth((__bridge CGImageRef)minHand.contents)/scale;
		h = CGImageGetHeight((__bridge CGImageRef)minHand.contents)/scale;
//	}
	minHand.bounds = CGRectMake(0,0,w,h);
	
//	if (secHand.contents == NULL){
//		w = SEC_HAND_WIDTH;
//		h = length*SEC_HAND_LENGTH;
//	}else{
		w = CGImageGetWidth((__bridge CGImageRef)secHand.contents)/scale;
		h = CGImageGetHeight((__bridge CGImageRef)secHand.contents)/scale;
//	}
	secHand.bounds = CGRectMake(0,0,w,h);
    
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
//
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
