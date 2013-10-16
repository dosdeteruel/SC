//
//  ScoreViewController.h
//  ScoreCard
//
//  Created by Maria Jose on 21/08/13.
//  Copyright (c) 2013 Maria Jose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreViewController : UIViewController


//Imágenes de los botones y pantalla

@property (retain, nonatomic) IBOutlet UIImageView *imagenLadoIzdo;
@property (retain, nonatomic) IBOutlet UIImageView *imagenLadoDcho;
@property (retain, nonatomic) IBOutlet UIImageView *bolaColor;
@property (retain, nonatomic) IBOutlet UIImageView *numeroHoyo;
@property (retain, nonatomic) IBOutlet UIImageView *numeroGolpes;
@property (retain, nonatomic) IBOutlet UIImageView *golpesDelPar;
@property (retain, nonatomic) IBOutlet UISegmentedControl *elegirParSegmentedControl;
@property (retain, nonatomic) IBOutlet UILabel *labelElegirPar;
@property (retain, nonatomic) IBOutlet UIButton *volverNumeroHoyosBoton;



@property  NSInteger numeroHoyosCampo;

//Botones para manejar la pantalla
- (IBAction)cambiarHoyo:(id)sender;  //llama a cambiardeHoyo

- (IBAction)cambiarGolpes:(id)sender;

- (IBAction)elegirPar:(UISegmentedControl *)sender;

- (void)cambiardeHoyo:(id)sender;  
- (void) grabarEnplist: (NSMutableArray *)mihoyo;

@end
