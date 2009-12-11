//
//  winfoAppDelegate.h
//  winfo
//
//  Created by hippos on 09/12/11.
//  Copyright 2009 hippos-lab.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface winfoAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
