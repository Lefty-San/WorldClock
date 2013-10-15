//
//  ZoomViewController.h
//  WorldClock
//
//  Created by Eric Prewitt on 10/1/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockSetup.h"
#import "ViewController.h"


@interface ZoomViewController : UIViewController {
    

}
@property (weak, nonatomic) IBOutlet UILabel *clockLabel;
@property (weak, nonatomic) NSMutableArray *cityArray;
@property (nonatomic, strong) IBOutlet ClockSetup *clockView;
@property (weak, nonatomic) NSString *labelClock; 

- (IBAction)Style1:(id)sender;
- (IBAction)Style2:(id)sender;
@end

