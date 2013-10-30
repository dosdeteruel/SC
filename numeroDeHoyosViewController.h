//
//  numeroDeHoyosViewController.h
//  ScoreCard
//
//  Created by German Bonilla Monterde on 15/09/13.
//  Copyright (c) 2013 Maria Jose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreViewController.h"

@interface numeroDeHoyosViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIButton *botonAmarillo;



- (IBAction) numeroHoyos:(UIStoryboardSegue *)segue;
- (IBAction) colorCampo:(UIButton *) sender;

@end
