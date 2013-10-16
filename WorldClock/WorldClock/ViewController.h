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

@property (weak, nonatomic) IBOutlet UILabel *clockLabel;
@property (weak, nonatomic) id<ViewControllerDelegate>delegate;


@end