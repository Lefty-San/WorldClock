//
//  ClockSetup.m
//  WorldClock
//
//  Created by Eric Prewitt on 10/8/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import "ClockSetup.h"
@implementation ClockSetup


- (void)start:(NSString*)time
{

    if ([time isEqual:@"(GMT-1)"]) {
        self.zone = 6*60*60;
        
    }
    else if ([time isEqual:@"(GMT-2)"]) {
        self.zone = 5*60*60;
        
    }
    else if ([time isEqual:@"(GMT-3)"]) {
        self.zone = 4*60*60;
        
    }
    else if ([time isEqual:@"(GMT-4)"]) {
        self.zone = 3*60*60;
        
    }
    else if ([time isEqual:@"(GMT-5)"]) {
        self.zone = 2*60*60;
        
    }
    else if ([time isEqual:@"(GMT-6)"]) {
        self.zone = 60*60;
        
    }
    else if ([time isEqual:@"(MDT)"]) {
        self.zone = 0;
        
    }
    else if ([time isEqual:@"(GMT+1)"]) {
        self.zone = 7*60*60;
        
    }
    else if ([time isEqual:@"(GMT+2)"]) {
        self.zone = 8*60*60;
        
    }
    else if ([time isEqual:@"(GMT+3)"]) {
        self.zone = 9*60*60;
        
    }
    else if ([time isEqual:@"(GMT+4)"]) {
        self.zone = 10*60*60;
        
    }
    else if ([time isEqual:@"(GMT+5)"]) {
        self.zone = 11*60*60;
        
    }
    else if ([time isEqual:@"(GMT+6)"]) {
        self.zone = 12*60*60;
       
    }
    else if ([time isEqual:@"(GMT+7)"]) {
        self.zone = 13*60*60;
        
    }
    else if ([time isEqual:@"(GMT+8)"]) {
        self.zone = 14*60*60;
        
    }
    else if ([time isEqual:@"(GMT+9)"]) {
        self.zone = 15*60*60;
        
    }
    else if ([time isEqual:@"(GMT+10)"]) {
        self.zone = 16*60*60;
        
    }
    else {
        self.zone = 6*60*60;
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateClock:) userInfo:nil repeats:YES];

}

- (void)stop
{
	[timer invalidate];
	timer = nil;
}

float Degrees2Radians(float degrees) { return degrees * M_PI / 180; }

- (void) updateClock:(NSTimer *)theTimer{

    NSDate *newYorkTime = [NSDate dateWithTimeIntervalSinceNow:self.zone];

    //break apart the time hh  mm   ss
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit)fromDate:newYorkTime];

	NSInteger seconds = [dateComponents second];
	NSInteger minutes = [dateComponents minute];
	NSInteger hours = [dateComponents hour];

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
		hourHand.backgroundColor = [UIColor clearColor].CGColor;
		hourHand.cornerRadius = 0.0;
        hourHand.borderWidth = 0.0;
		
	hourHand.contents = (__bridge id)image;

}

- (void)setMinHandImage:(CGImageRef)image
{
		minHand.backgroundColor = [UIColor clearColor].CGColor;
        minHand.borderWidth = 0.0;
		minHand.cornerRadius = 0.0;

	minHand.contents = (__bridge id)image;
}

- (void)setSecHandImage:(CGImageRef)image
{
		secHand.backgroundColor = [UIColor clearColor].CGColor;
		secHand.borderColor = [UIColor clearColor].CGColor;
        secHand.borderWidth = 0.0;
		secHand.cornerRadius = 0.0;

	secHand.contents = (__bridge id)image;
}

- (void)setClockBackgroundImage:(CGImageRef)image
{
		containerLayer.borderColor = [UIColor clearColor].CGColor;
		containerLayer.borderWidth = 0.0;
		containerLayer.cornerRadius = 0.0;

	containerLayer.contents = (__bridge id)image;
}

- (void) layoutSubviews
{
	[super layoutSubviews];

	containerLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

	CGPoint c = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
	hourHand.position = minHand.position = secHand.position = c;

	CGFloat w, h;
	CGFloat scale = 1;
	if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
		scale = [UIScreen mainScreen].scale;
	}

		w = CGImageGetWidth((__bridge CGImageRef)hourHand.contents)/scale;
		h = CGImageGetHeight((__bridge CGImageRef)hourHand.contents)/scale;

	hourHand.bounds = CGRectMake(0,0,w,h);
	
		w = CGImageGetWidth((__bridge CGImageRef)minHand.contents)/scale;
		h = CGImageGetHeight((__bridge CGImageRef)minHand.contents)/scale;

	minHand.bounds = CGRectMake(0,0,w,h);
	
		w = CGImageGetWidth((__bridge CGImageRef)secHand.contents)/scale;
		h = CGImageGetHeight((__bridge CGImageRef)secHand.contents)/scale;

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

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
