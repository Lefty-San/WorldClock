//
//  ViewController.h
//  WorldClock
//
//  Created by Eric Prewitt on 10/1/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addcontroller.h"

@interface ViewController : UIViewController                <AddControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *clocklabel;


@end
