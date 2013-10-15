//
//  ViewController.h
//  WorldClock
//
//  Created by Eric Prewitt on 10/1/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addcontroller.h"
#import "ZoomViewController.h"
@class ViewController;

@protocol ViewControllerDelegate <NSObject>

-(void) didselectwith:(addcontroller *)controller cities: (NSString *) cities;
@end

@interface ViewController : UICollectionViewController            <AddControllerDelegate, ViewControllerDelegate> {
}
@property (strong, nonatomic) IBOutlet UILabel *clocklabel;
@property (strong, nonatomic) IBOutlet UILabel *clocklabela;
@property (strong, nonatomic) IBOutlet UILabel *clocklabelb;
@property (strong, nonatomic) IBOutlet UILabel *clocklabelc;
@property (strong, nonatomic) IBOutlet UILabel *clocklabeld;
@property (strong, nonatomic) IBOutlet UILabel *clocklabele;
@property (strong, nonatomic) IBOutlet UILabel *clocklabelf;
@property (nonatomic, retain) NSString * clocklabel1;
@property (nonatomic, retain) NSString * clocklabel2;
@property (nonatomic, retain) NSString * clocklabel3;
@property (nonatomic, retain) NSString * clocklabel4;
@property (nonatomic, retain) NSString * clocklabel5;
@property (nonatomic, retain) NSString * clocklabel6;
@property (nonatomic, retain) NSString * gmt1;
@property (nonatomic, retain) NSString * gmt2;
@property (nonatomic, retain) NSString * gmt3;
@property (nonatomic, retain) NSString * gmt4;
@property (nonatomic, retain) NSString * gmt5;
@property (nonatomic, retain) NSString * gmt6;

//@property (nonatomic, retain)
@property (weak, nonatomic) IBOutlet UILabel *clockLabel;
@property (weak, nonatomic) id<ViewControllerDelegate>delegate;


@end
