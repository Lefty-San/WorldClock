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


@end

@interface addcontroller : UIViewController

@property (weak, nonatomic) IBOutlet UISearchBar *search;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)backbutton:(id)sender;

@property (weak, nonatomic) id<AddControllerDelegate>delegate;

@end
