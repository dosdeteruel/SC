//
//  campoTableViewController.m
//  ScoreCard
//
//  Created by Maria Jose Medrano on 26/09/13.
//  Copyright (c) 2013 Maria Jose. All rights reserved.
//

#import "campoTableViewController.h"
#import "campo.h"

@interface campoTableViewController ()
{
    NSUserDefaults *defaults;
}
@end

@implementation campoTableViewController

@synthesize tbl;


NSMutableArray *arraynombrecampos;
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
    NSArray *arrayCamposAux= [[NSArray alloc] init];
    

    
    NSString *fichero = [[NSBundle mainBundle] pathForResource:@"campos" ofType:@"plist"];
   
     NSDictionary * diccionariocampos = [[NSDictionary alloc] initWithContentsOfFile: fichero] ;
   
 arrayCamposAux = [diccionariocampos allKeys];
    
    arraynombrecampos = [[NSMutableArray alloc] initWithArray:arrayCamposAux ];
    
//    arr = [[NSArray alloc] initWithContentsOfFile:fichero];
    
    
    
    
  
        //puedo sacar solo las zonas
        // puedo saar los puntos de una zona
        int i;
        i=0;
        
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"campos" ofType:@"plist"];
  //      NSMutableArray *arraycampos =[[NSMutableArray alloc] init];
//        NSMutableArray *arraynombrecampos =[[NSMutableArray alloc] init];
        
        
        //Creamos un array con el contenido del fichero
        
  //      NSArray *arrayConDatos = [[NSArray alloc] initWithContentsOfFile:path];
        
 //       for (; i < arrayConDatos.count; i++)
        {
            
 //           [arraycampos addObject: [arrayConDatos objectAtIndex:i]];
            //  NSLog(@"elemento - %d en myArray: %@", i, element);
 //           [arraynombrecampos addObject:[arraycampos objectAtIndex:2]];
            
        }
        
        
 //   NSDictionary *micampo = [[NSDictionary alloc]init];
//    micampo = [NSDictionary dictionaryWithObject: campoaux forKey:nombre.text];
    
    
    
    
    
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
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:titulo forKey:@"jugarcampo"] ;
    
    [defaults synchronize];
    
                                       // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
