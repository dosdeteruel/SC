//
//  campoTableViewController.h
//  ScoreCard
//
//  Created by Maria Jose Medrano on 26/09/13.
//  Copyright (c) 2013 Maria Jose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface campoTableViewController : UITableViewController
{
NSArray *arr;
UITableView *tbl;
    
}
@property (nonatomic, retain) IBOutlet UITableView *tbl;
- (IBAction)nuevoCampoBoton:(id)sender;
- (void)   S_Cargarcrearcampos;


@end
