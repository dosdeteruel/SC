//
//  nuevocampoViewController.m
//  ScoreCard
//
//  Created by Maria Jose Medrano on 20/10/13.
//  Copyright (c) 2013 Maria Jose. All rights reserved.
//

#import "nuevocampoViewController.h"

@interface nuevocampoViewController ()


@end

@implementation nuevocampoViewController
@synthesize numhoyo;
@synthesize hoyo;
@synthesize hoyoblanco;
@synthesize hoyoamarillo;
@synthesize hoyoazul;
@synthesize hoyorojo;
@synthesize  numerohoyoscampo;
@synthesize nombre;

NSMutableArray *hoyos;
int numerohoyo;
int hoyoscampo;


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
    numerohoyo=1;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) guardarCampoAPlist:(NSMutableArray*) hoyos
{
    NSMutableArray *campoaux = [[NSMutableArray alloc]init];
    NSDictionary *plistDictionary;
    NSData *plistData;
    NSString *ruta;
    NSString *pathArray =    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    ruta= [pathArray stringByAppendingPathComponent:@"campos.plist"];
    
    
    // Ahora recorro el Array para generar el Dictionary
    for (hoyocampo *elhoyo in hoyos)
    {
        plistDictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects: nombre.text, elhoyo.numhoyo,elhoyo.lonblancohoyo, elhoyo.lonamarillohoyo, elhoyo.lonazulhoyo, elhoyo.lonrojohoyo, elhoyo.minblancohoyo,elhoyo.minamarillohoyo, elhoyo.minazulhoyo,elhoyo.minrojohoyo,elhoyo.maxblancohoyo, elhoyo.maxamarillohoyo, elhoyo.maxazulhoyo, elhoyo.maxrojohoyo, nil] forKeys:[NSArray arrayWithObjects:@"nombre", @"numhoyo",@"lonblancohoyo",@"lonamarillohoyo",@"lonazulhoyo",@"lonrojohoyo", @"minblancohoyo", @"minamarillohoyo",@"minazulhoyo",@"minrojohoyo",@"maxblancohoyo",@"maxamarillohoyo",@"maxazulhoyo",@"maxrojohoyo", nil]];
        
        [campoaux addObject:plistDictionary];
    }
    
    NSDictionary *micampo = [[NSDictionary alloc]init];
    micampo = [NSDictionary dictionaryWithObject: campoaux forKey:nombre.text];
    
    NSError *error = [[NSError alloc]init];
    
    
    plistData = [NSPropertyListSerialization dataWithPropertyList:micampo format:NSPropertyListXMLFormat_v1_0 options:0 error:&error];
    
    
    if (plistData)
    {
        [plistData writeToFile:ruta atomically:YES];
    }
    
    
    [campoaux release];
    [plistDictionary release];
    [plistData release];
    

}

-(IBAction) textFieldDoneEditing : (id) sender{
    [sender resignFirstResponder];
}
- (IBAction) guardarHoyoCampo
{
    NSMutableArray *hoyos = [[NSMutableArray alloc] init];

    hoyoscampo = [NSNumber numberWithChar: numerohoyoscampo.text];
   

    hoyo.numhoyo=numhoyo.text;
    hoyo.lonazulhoyo= hoyoazul.text;
    hoyo.lonblancohoyo=hoyoblanco.text;
    hoyo.lonrojohoyo=hoyorojo.text;
    [hoyos addObject:hoyo];
    
    if (numerohoyo < hoyoscampo)
    {
    
        numhoyo.text=[NSString stringWithFormat: @"%d", numerohoyo++];
    
    }
    else
    {
    //ha acabado, boton guardar
        
    [self guardarCampoAPlist: hoyos];
        
 
        
    }
    
 }

- (IBAction)guardarCampo:(UIStoryboardSegue *)segue{
    
}



- (void)dealloc {
    [numhoyo release];
    [hoyoblanco release];
    [hoyoamarillo release];
    [hoyorojo release];
    [hoyoazul release];
    [super dealloc];
}
@end
