//
//  ViewController.h
//  WorldClock
//
//  Created by Eric Prewitt on 10/1/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addcontroller.h"

@interface ViewController : UICollectionViewController                <AddControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *clocklabel;
@property (strong, nonatomic) IBOutlet UILabel *clocklabela;
@property (strong, nonatomic) IBOutlet UILabel *clocklabelb;
@property (strong, nonatomic) IBOutlet UILabel *clocklabelc;
@property (strong, nonatomic) IBOutlet UILabel *clocklabeld;
@property (strong, nonatomic) IBOutlet UILabel *clocklabele;
@property (strong, nonatomic) IBOutlet UILabel *clocklabelf;


@end
