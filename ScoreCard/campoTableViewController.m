//
//  campoTableViewController.m
//  ScoreCard
//
//  Created by Maria Jose Medrano on 26/09/13.
//  Copyright (c) 2013 Maria Jose. All rights reserved.
//

#import "campoTableViewController.h"
#import "campo.h"
#import "numeroDeHoyosViewController.h"
@interface campoTableViewController ()
{
    NSUserDefaults *defaults;
}
@end

@implementation campoTableViewController

@synthesize tbl;
NSUserDefaults *defaults;

NSArray *arraynombrecampos;
NSArray * diccionariocampos;

  //  NSrray *nombresCamposarray = [[NSArray alloc] init];

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //cargar el array desde el plist
 //   NSArray *arrayCamposAux= [[NSArray alloc] init];
    NSString *ruta;
    

  //  [self S_Cargarcrearcampos];
    
    
    NSString *pathArray =    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    ruta= [pathArray stringByAppendingPathComponent:@"nombrescampos.plist"];
    NSLog(@"Ruta al fichero: %@", ruta);
    

    arraynombrecampos = [[NSArray alloc] initWithContentsOfFile: ruta] ;
    
    
    
    
    
    
    
    

    
 //   NSString *fichero = [[NSBundle mainBundle] pathForResource:@"campos" ofType:@"plist"];
   //
 //   NSString *pathArray =    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
//    ruta= [pathArray stringByAppendingPathComponent:@"campos2.plist"];
//    NSLog(@"Ruta al fichero: %@", ruta);
 
 //    diccionariocampos = [[NSDictionary alloc] initWithContentsOfFile: ruta] ;
   
 //arrayCamposAux = [diccionariocampos allKeys];
    
 //   arraynombrecampos = [[NSMutableArray alloc] initWithArray:arrayCamposAux ];
    
 //   NSString *nom= [arraynombrecampos objectAtIndex:0];
    
    
 //   NSLog(@"%@", nom);
    
    
      }




- (void)   S_Cargarcrearcampos{
    NSString *ruta;

 //   NSMutableArray *myArraycampos = [NSMutableArray array];
//	[myArraycampos addObject:@"Teruel"];
//	[myArraycampos addObject:@"Negralejo"];
  //  [myArraycampos addObject:nil];
    NSArray *myArraycampos = [NSArray arrayWithObjects:@"Teruel", @"Negralejo",nil];    //ahora volcar a plist
    NSString *pathArray =    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    ruta= [pathArray stringByAppendingPathComponent:@"nombrescampos.plist"];
    NSLog(@"Ruta al fichero: %@", ruta);

    NSData *plistData;

    
    NSError *error = [[NSError alloc]init];
    
    
    plistData = [NSPropertyListSerialization dataWithPropertyList:myArraycampos format:NSPropertyListXMLFormat_v1_0 options:0 error:&error];
    
    
    if (plistData)
    {
        [plistData writeToFile:ruta atomically:YES];
    }
    
    
 
    [myArraycampos release];
    [plistData release];

    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
      NSLog(@"%d", [arraynombrecampos count]);
    return [arraynombrecampos count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell==nil)
        
    {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];    
    }
    // Configure the cell...
    
    cell.textLabel.text =[arraynombrecampos objectAtIndex:indexPath.row];
    cell.detailTextLabel.text =@"Elige";
    cell.accessoryType =UITableViewCellAccessoryDetailDisclosureButton;
    
    NSLog(@"%@", cell.textLabel.text);
    //  [arraynombrecampos release];
      return cell;

}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    int arrIndex =[indexPath indexAtPosition:[indexPath length]-1];
    
    NSString *titulo=[arraynombrecampos objectAtIndex:arrIndex];
    
  //  NSMutableArray *micampoauxdatos= [[NSMutableArray alloc]init];
  
    
    
    
    NSString *ruta;
    
    
    NSString *pathArray =    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *nombrec = [NSString stringWithFormat:@"%@",titulo];
    nombrec = [nombrec stringByAppendingFormat:@".plist"];
    
    
    
    
    
    ruta= [pathArray stringByAppendingPathComponent:nombrec];
    NSLog(@"Ruta al fichero: %@", ruta);
    
    
  NSArray  *micampoauxdatos = [[NSArray alloc] initWithContentsOfFile: ruta] ;

    
    
    
//    micampoaux = [diccionariocampos objectForKey: titulo];
    
//  NSMutableDictionary *micampo= [micampoaux objectAtIndex:2];
    
    
    
    //cargar el nuevo fichero con los datos de ese campo
    
    
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:titulo forKey:@"jugarcampo"] ;
    [defaults setObject:micampoauxdatos forKey:@"datoscampo"];
    
    [defaults synchronize];
    
    
    numeroDeHoyosViewController *detailViewController = [[numeroDeHoyosViewController alloc] initWithNibName:@"" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];


}

- (IBAction)nuevoCampoBoton:(id)sender {
}
@end

