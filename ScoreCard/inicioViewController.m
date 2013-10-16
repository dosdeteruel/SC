//
//  inicioViewController.m
//  ScoreCard
//
//  Created by German Bonilla Monterde on 10/09/13.
//  Copyright (c) 2013 Maria Jose. All rights reserved.
//

#import "inicioViewController.h"
#import "numeroDeHoyosViewController.h"
#import "statsViewController.h"

@interface inicioViewController ()

@end

@implementation inicioViewController

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


- (IBAction)play:(UIStoryboardSegue *)segue
{
  // numeroDeHoyosViewController *controller =[self.storyboard instantiateViewControllerWithIdentifier:@"numeroDeHoyosViewController"];
  //  [self presentViewController:controller animated:YES completion:NULL];

}

- (IBAction)stats:(UIStoryboardSegue *)segue
{
   
}
@end
