//
//  numeroDeHoyosViewController.m
//  ScoreCard
//
//  Created by German Bonilla Monterde on 15/09/13.
//  Copyright (c) 2013 Maria Jose. All rights reserved.
//

#import "numeroDeHoyosViewController.h"

@interface numeroDeHoyosViewController ()



@end

@implementation numeroDeHoyosViewController

NSInteger pasarPantalla;
NSInteger numHoyos, colorRuta;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction) numeroHoyosYColor:(id) sender;
{
    UIButton *botonHoyos = (UIButton *) sender;
    int tagHoyos = botonHoyos.tag;
    if (tagHoyos>0 && tagHoyos<5) {
        [self.rutaAmarillaBoton setEnabled:NO];
        self.rutaAmarillaBoton.alpha =0;
        [self.rutaAzulBoton setEnabled:NO];
        self.rutaAzulBoton.alpha =0;
        [self.rutaBlancaBoton setEnabled:NO];
        self.rutaBlancaBoton.alpha =0;
        [self.rutaRojaBoton setEnabled:NO];
        self.rutaRojaBoton.alpha =0;
        pasarPantalla++;
        colorRuta = tagHoyos;
    }
    if (tagHoyos == 9 || tagHoyos == 18) {
        [self.nueveHoyosBoton setEnabled:NO];
        self.nueveHoyosBoton.alpha =0;
        [self.dieciochoHoyosBoton setEnabled:NO];
        self.dieciochoHoyosBoton.alpha =0;
        pasarPantalla++;
        numHoyos = tagHoyos;
        
    }
    if (pasarPantalla ==2) {
        [self.pasarPantallaBoton setEnabled:YES];
        self.pasarPantallaBoton.alpha =1;
    }
    
}
- (IBAction) numeroHoyos:(UIStoryboardSegue *)segue
{
    [self.rutaAmarillaBoton setEnabled:YES];
    self.rutaAmarillaBoton.alpha =1;
    [self.rutaAzulBoton setEnabled:YES];
    self.rutaAzulBoton.alpha =1;
    [self.rutaBlancaBoton setEnabled:YES];
    self.rutaBlancaBoton.alpha =1;
    [self.rutaRojaBoton setEnabled:YES];
    self.rutaRojaBoton.alpha =1;
    [self.nueveHoyosBoton setEnabled:YES];
    self.nueveHoyosBoton.alpha =1;
    [self.dieciochoHoyosBoton setEnabled:YES];
    self.dieciochoHoyosBoton.alpha =1;
    [self.pasarPantallaBoton setEnabled:NO ];
    self.pasarPantallaBoton.alpha =0;
    pasarPantalla = 0;
    
}
#pragma mark segue

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ScoreViewController *scoreview = [segue destinationViewController];

    scoreview.numeroHoyosCampo = numHoyos;
    scoreview.color = colorRuta;

}

- (void)dealloc {
    [_rutaBlancaBoton release];
    [_rutaAmarillaBoton release];
    [_rutaAzulBoton release];
    [_rutaRojaBoton release];
    [_nueveHoyosBoton release];
    [_dieciochoHoyosBoton release];
    [_pasarPantallaBoton release];
    [super dealloc];
}
@end
