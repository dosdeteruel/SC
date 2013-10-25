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


@property (retain, nonatomic) IBOutlet UIButton *rutaBlancaBoton;
@property (retain, nonatomic) IBOutlet UIButton *rutaAmarillaBoton;
@property (retain, nonatomic) IBOutlet UIButton *rutaAzulBoton;
@property (retain, nonatomic) IBOutlet UIButton *rutaRojaBoton;
@property (retain, nonatomic) IBOutlet UIButton *nueveHoyosBoton;
@property (retain, nonatomic) IBOutlet UIButton *dieciochoHoyosBoton;
@property (retain, nonatomic) IBOutlet UIButton *pasarPantallaBoton;

- (IBAction) numeroHoyosYColor:(id) sender;

@end
