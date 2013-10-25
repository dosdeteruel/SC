//
//  nuevocampoViewController.h
//  ScoreCard
//
//  Created by Maria Jose Medrano on 20/10/13.
//  Copyright (c) 2013 Maria Jose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "campo.h"

@interface nuevocampoViewController : UIViewController
@property  (nonatomic, retain) IBOutlet  UITextField *nombre;
@property (nonatomic, retain) IBOutlet UITextField *numerohoyoscampo;

@property (nonatomic, retain)  hoyocampo *hoyo;
@property (retain, nonatomic) IBOutlet UITextField *hoyoblanco;

@property (nonatomic,retain) IBOutlet UITextField *hoyoamarillo;
@property (nonatomic,retain) IBOutlet UITextField *hoyoazul;
@property (nonatomic,retain) IBOutlet UITextField *hoyorojo;


@property (retain, nonatomic) IBOutlet UILabel *numhoyo;

- (IBAction) guardarCampo:(UIStoryboardSegue *)segue;

- (IBAction) guardarHoyoCampo;

- (IBAction) textFieldDoneEditing : (id) sender;


@end
