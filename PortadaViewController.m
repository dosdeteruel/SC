//
//  PortadaViewController.m
//  ScoreCard
//
//  Created by Maria Jose Medrano on 03/09/13.
//  Copyright (c) 2013 Maria Jose. All rights reserved.
//

#import "PortadaViewController.h"
#import "inicioViewController.h"

@interface PortadaViewController ()

@end

@implementation PortadaViewController

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
- (IBAction)cambiarPantalla {

    inicioViewController *controller =[self.storyboard instantiateViewControllerWithIdentifier:@"inicioViewController"];
    [self presentViewController:controller animated:YES completion:NULL];
    
    
}
@end
