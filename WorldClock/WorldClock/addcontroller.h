//
//  addcontroller.h
//  WorldClock
//
//  Created by WPP Administrator on 10/7/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class addcontroller;

@protocol AddControllerDelegate <NSObject>

-(void) didselectwith:(addcontroller *)controller cities: (NSString *) cities citytimezones: (NSString *) citytimezones;
//-(void) didselectwith1:(addcontroller *)controller citytimezones: (NSString *) citytimezones;
//-(void) didselectwith1:(addcontroller *)controller cities: (NSString *) cities;

@end

@interface addcontroller : UIViewController

@property (weak, nonatomic) IBOutlet UISearchBar *search;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSUserDefaults *defaults;
@property (nonatomic, retain) NSString * clocklabel1;
@property (nonatomic, retain) NSString * clocklabel2;
@property (nonatomic, retain) NSString * clocklabel3;
@property (nonatomic, retain) NSString * clocklabel4;
@property (nonatomic, retain) NSString * clocklabel5;
@property (nonatomic, retain) NSString * clocklabel6;
- (IBAction)backbutton:(id)sender;

@property (weak, nonatomic) id<AddControllerDelegate>delegate;

@end
