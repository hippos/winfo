//
//  winfoAppDelegate.m
//  winfo
//
//  Created by hippos on 09/12/11.
//  Copyright 2009 hippos-lab.com. All rights reserved.
//

#import "winfoAppDelegate.h"
#import "doubleTransformer.h"

@implementation winfoAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  id transformer = [[[doubleTransformer alloc] init] autorelease];
  [NSValueTransformer setValueTransformer:transformer forName:@"doubleTransformer"];
}

@end
