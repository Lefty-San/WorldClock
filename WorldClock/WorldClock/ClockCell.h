//
//  ClockCell.h
//  WorldClock
//
//  Created by Shawna MacNabb on 10/10/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockSetup.h"

@interface ClockCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet ClockSetup *clockView;

@end
