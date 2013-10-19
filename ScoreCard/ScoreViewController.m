//
//  ScoreViewController.m
//  ScoreCard
//
//  Created by Maria Jose on 21/08/13.
//  Copyright (c) 2013 Maria Jose. All rights reserved.
//

#import "ScoreViewController.h"
#import "clasehoyo.h"
//#import "campoTableViewController.h"
@interface ScoreViewController ()
{


}
@end


@implementation ScoreViewController

@synthesize numeroHoyosCampo;

NSInteger hoyo;
int par;
NSInteger golpesDados;
int golpesTotales;


//NSMutableArray *hoyosArray;

 //if ([defaults objectForKey:@"jugarcampo"] != nil)
NSMutableArray *hoyosArray;


//=[[NSMutableArray alloc] init];

//{
//}





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
    
    hoyosArray=[NSMutableArray new];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSString *nombredelcampo= [defaults stringForKey:@"jugarcampo"];
    
//aqui carga los hoyos y los datos
    hoyo=1;
    par=0;
    golpesDados=0;
    if ((hoyo > 0) & (hoyo<numeroHoyosCampo +1)) {
        NSString * stHoyo = [NSString stringWithFormat:@"%d",hoyo];
        stHoyo = [stHoyo stringByAppendingFormat:@".png"];
        [self.numeroHoyo setImage:[UIImage imageNamed:stHoyo]];
    }
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    [_numeroHoyo release];
    [_imagenLadoIzdo release];
    [_imagenLadoDcho release];
    [_bolaColor release];
    [_numeroGolpes release];
    [_golpesDelPar release];
    [_imagenLadoIzdo release];
    [_imagenLadoDcho release];
    [_elegirParSegmentedControl release];
    [_labelElegirPar release];
    [_volverNumeroHoyosBoton release];
    [super dealloc];
}


#pragma mark funciones directorios


- (void)createEditableCopyOfIfNeeded
{
    // First, test for existence.
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writablePath = [documentsDirectory stringByAppendingPathComponent:@"golf.plist"];
    success = [fileManager fileExistsAtPath:writablePath];
    
    if (success)
        return;
    
    // The writable file does not exist, so copy from the bundle to the appropriate location.
    NSString *defaultPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"golf.plist"];
    success = [fileManager copyItemAtPath:defaultPath toPath:writablePath error:&error];
    if (!success)
        NSAssert1(0, @"Failed to create writable file with message '%@'.", [error localizedDescription]);
}


#pragma mark funciones


- (void)grabarHoyo:(id)sender
{
    clasehoyo *hoyoActual= [[clasehoyo alloc]init];

    hoyoActual.numerohoyo=   [NSNumber numberWithInt:hoyo];
    hoyoActual.golpes=[NSNumber numberWithInt:golpesDados];
    
 // graba en estructura bd
  //comprueba que no esté grabado
    if (hoyosArray.count > hoyo)
    {
        [hoyosArray replaceObjectAtIndex:hoyo withObject:hoyoActual];
      //  [NSKeyedArchiver archiveRootOBject: hoyosArray toFile:]

    }
         else
         {
       //si quiero volver a grabar un hoyo ya hecho 
  
       
 //   [hoyosArray insertObject:[clasehoyo hoyoActual] atIndex:hoyo];
          [hoyosArray addObject:hoyoActual];
         
        //     [hoyosArray insertObject:hoyoActual atIndex:hoyo];
            
             
   }
}
- (void)cambiardeHoyo:(id)sender{

    
     
    //tener en cuenta volver a elegir par
    // o cargar el par del hoyo
    
  //  self.volverElegirPar(id) sender;
    [self grabarHoyo:sender];
    UIButton *botonHoyo = (UIButton *) sender;
    int tagHoyo = botonHoyo.tag;
    switch (tagHoyo) {
        case 1:
            if (hoyo>1) {
                hoyo--;
            }
            break;
        case 2:
            if (hoyo < numeroHoyosCampo) {
                hoyo++;
            }
            break;
        default:
            break;
    }
    NSString * stHoyo = [NSString stringWithFormat:@"%d",hoyo];
    stHoyo = [stHoyo stringByAppendingFormat:@".png"];
    [self.numeroHoyo setImage:[UIImage imageNamed:stHoyo]];
    
    // cuando llega al último hoyo se graba todo ¡¡¡¡¡
    
    if (hoyo == numeroHoyosCampo)
    {
    
    //he acabado, a grabar hoyosArray a plist
        [self grabarEnplist: hoyosArray];
        
            }

}


- (void) grabarEnplist: (NSMutableArray *)mihoyo{
    // Primero voy a pasar a string la ruta del fichero a grabar
    NSMutableArray *hoyoaux = [[NSMutableArray alloc]init];
    NSDictionary *plistDictionary;
    NSData *plistData;
    NSString *ruta;
    NSString *pathArray =    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    ruta= [pathArray stringByAppendingPathComponent:@"golf2.plist"];
    
    // Ahora recorro el Array para generar el Dictionary
    for (clasehoyo *elhoyo in mihoyo)
    {
    plistDictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects: @"Campo2", elhoyo.numerohoyo,elhoyo.golpes,nil] forKeys:[NSArray arrayWithObjects:@"campo",@"hoyo",@"golpes",nil]];
    
    [hoyoaux addObject:plistDictionary];
    }

    NSDictionary *mijugada = [[NSDictionary alloc]init];
    mijugada = [NSDictionary dictionaryWithObject: hoyoaux forKey:@"campo2"];
    //NSString *errorDescription = nil;
    NSError *error = [[NSError alloc]init];
    
    
    plistData = [NSPropertyListSerialization dataWithPropertyList:mijugada format:NSPropertyListXMLFormat_v1_0 options:0 error:&error];


    if (plistData)
    {
        [plistData writeToFile:ruta atomically:YES];
    }


    [hoyoaux release];


 }

- (void) grabarAplist: (NSMutableArray *) miHoyo {
// vuelta los datos del array a disco en plist
    // tener en cuenta el nombre del campo
    
   // createEditableCopyOfIfNeeded;
    
    NSString *ruta;
    NSDictionary *plistDictionary;
    NSData *plistData;
    NSMutableArray *hoyosAuxMutableArray=[[NSMutableArray alloc]init];
    NSString *pathArray =    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    ruta= [pathArray stringByAppendingPathComponent:@"golf.plist"];
    NSLog(@"%@", ruta);
    
      for (clasehoyo *elhoyo in miHoyo)
    {
   
    plistDictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects: [NSString stringWithFormat:@"%d",elhoyo.numerohoyo], [NSString stringWithFormat:@"%d", elhoyo.golpes],nil] forKeys:[NSArray arrayWithObjects:@"golpes",@"hoyo",nil]];
   
   [hoyosAuxMutableArray addObject:plistDictionary];
    }
        
    
    NSString *error;
    
    
    
    plistData = [NSPropertyListSerialization dataFromPropertyList:hoyosAuxMutableArray format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    
     if (plistData)
          {
                                [plistData writeToFile:ruta atomically:YES];
          }
                                
         
    [hoyosAuxMutableArray release];
    
}
- (IBAction)cambiarHoyo:(id)sender {
    [self cambiardeHoyo:sender];
    
   }


- (IBAction)cambiarGolpes:(id)sender {
    UIButton *botonGolpes = (UIButton *) sender;
    int tagGolpes = botonGolpes.tag;
    // Pulsamos botones de más o menos golpes
    switch (tagGolpes) {
        case 3:
            if (golpesDados > 0) {
                golpesDados--;
            }
            break;
        case 4:
            golpesDados++;
            break;
            
        default:
            break;
    }
    
    // Se genera la imagen de los números de la bola de golpes
    NSString * stgolpesDados = [NSString stringWithFormat:@"golpe"];
    stgolpesDados = [stgolpesDados stringByAppendingFormat:@"%d",golpesDados];
    stgolpesDados = [stgolpesDados stringByAppendingFormat:@".png"];
    if (golpesDados<= 9 && golpesDados>0){
        [self.numeroGolpes setImage:[UIImage imageNamed:stgolpesDados]];
    }
    //Se dibuja la bola en función de estar por debajo o por encima del par
    if (golpesDados < par)
    {
        [self.bolaColor setImage:[UIImage imageNamed:@"bolaverde.png"]];
    } else if (golpesDados == par)
    {
        [self.bolaColor setImage:[UIImage imageNamed:@"bolablanca.png"]];
    } else if (golpesDados > par) {
        [self.bolaColor setImage:[UIImage imageNamed:@"bolaroja.png"]];
    }
}
    
    
- (IBAction)volverElegirPar:(id)sender {
    // Hay que volver a habilitar los controles para elegir el par
    [self.elegirParSegmentedControl setEnabled:YES];
    self.elegirParSegmentedControl.alpha =1;
    self.labelElegirPar.alpha =1;
    self.volverNumeroHoyosBoton.alpha = 1;
    [self.volverNumeroHoyosBoton setEnabled:YES];
}

- (IBAction)elegirPar:(UISegmentedControl *)sender {
    int parSegmentedControl = sender.selectedSegmentIndex;
    //Se elige el par del hoyo
    switch (parSegmentedControl) {
        case 0:
            [self.golpesDelPar setImage:[UIImage imageNamed:@"golpe3.png"]];
            par = 3;
        break;
        case 1:
            [self.golpesDelPar setImage:[UIImage imageNamed:@"golpe4.png"]];
            par = 4;
            break;
        case 2:
            [self.golpesDelPar setImage:[UIImage imageNamed:@"golpe5.png"]];
            par = 5;
            break;
        default:
            break;
    }
    //Se deshabilitan los controles de elegir el par
    self.golpesDelPar.alpha =1;
    [sender setEnabled:NO];
    sender.alpha = 0;
    self.labelElegirPar.alpha = 0;
    self.volverNumeroHoyosBoton.alpha = 0;
    [self.volverNumeroHoyosBoton setEnabled:NO];
        
}
@end
