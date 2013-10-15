//
//  ClockSetup.h
//  WorldClock
//
//  Created by Eric Prewitt on 10/8/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

double zone;

@interface ClockSetup : UIView {
    
    CALayer *containerLayer;
    CALayer *hourHand;
    CALayer *minHand;
    CALayer *secHand;
    NSTimer *timer;
}


//basic methods
- (void)start;
- (void)stop;

//customize appearence
- (void)setHourHandImage:(CGImageRef)image;
- (void)setMinHandImage:(CGImageRef)image;
- (void)setSecHandImage:(CGImageRef)image;
- (void)setClockBackgroundImage:(CGImageRef)image;

@property (nonatomic, retain) NSString * clockGMT1;
@property (nonatomic, retain) NSString * clockGMT2;
@property (nonatomic, retain) NSString * clockGMT3;
@property (nonatomic, retain) NSString * clockGMT4;
@property (nonatomic, retain) NSString * clockGMT5;
@property (nonatomic, retain) NSString * clockGMT6;

@end