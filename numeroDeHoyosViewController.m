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
- (IBAction) numeroHoyos:(UIStoryboardSegue *)segue
{

}
#pragma mark segue

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ScoreViewController *scoreview = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"nueveHoyos"]) {
        scoreview.numeroHoyosCampo = 9;
        
    } else if ([segue.identifier isEqualToString:@"dieciochoHoyos"]){
        scoreview.numeroHoyosCampo =18;
    }
}


- (IBAction) colorCampo:(UIButton *) sender
{
   UILabel *nombreBoton = sender.titleLabel;
    
    if ([nombreBoton.text  isEqual:@"Blancos"])
    {
    
    }
  
    if ([nombreBoton.text  isEqual:@"Amarillos"])
    {
    
    }
  if ([nombreBoton.text  isEqual:@"Azules"])
  {}
    
    
    if ([nombreBoton.text  isEqual:@"Rojos"])
    {}
    
    
    
}

- (void)dealloc {
    [_botonAmarillo release];
    [super dealloc];
}
@end
