//
//  winfoArrayController.h
//  winfo
//
//  Created by hippos on 09/12/11.
//  Copyright 2009 hippos-lab.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface winfoArrayController : NSArrayController 
{
	IBOutlet NSTableView *tableView;
}

- (IBAction)add:(id)sender;

@end
