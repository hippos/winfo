//
//  winfoArrayController.m
//  winfo
//
//  Created by hippos on 09/12/11.
//  Copyright 2009 hippos-lab.com. All rights reserved.
//

#import <AppKit/NSAccessibility.h>
#import "winfoArrayController.h"
#import "SystemEvents.h"
#import "windowInfo.h";

@implementation winfoArrayController

- (IBAction)add:(id)sender
{
  if ([[self arrangedObjects] count] > 0)
  {
    [self removeObjects:[self arrangedObjects]];
  }

  SystemEventsApplication *systemEvents   = [SBApplication applicationWithBundleIdentifier:@"com.apple.systemevents"];
  SBElementArray          *processes      = [systemEvents processes];

  for (SystemEventsProcess *proc in processes)
  {
    AXUIElementRef appElement = AXUIElementCreateApplication(proc.unixId);
    id             windows    = nil;
    NSArray       *proc_attrs;
    CFStringRef    attribute  = CFSTR("AXWindows");

    if (AXUIElementCopyAttributeNames(appElement, (CFArrayRef *)&proc_attrs) != kAXErrorSuccess)
    {
      continue;
    }
    if ([proc_attrs indexOfObject:(NSString *)attribute] == NSNotFound)
    {
      [proc_attrs release];
      continue;
    }
    if (AXUIElementCopyAttributeValue(appElement, attribute, (CFTypeRef *)&windows) == kAXErrorSuccess)
    {
      if (CFGetTypeID(windows) == CFArrayGetTypeID())
      {
        CGPoint        pos;
        CGSize         sz;
        id             w_pos        = nil;
        id             w_size       = nil;
        id             w_title      = nil;
        NSArray       *window_attrs = (NSArray *)windows;
        NSEnumerator  *enumerator   = [window_attrs objectEnumerator];
        AXUIElementRef aref;
        while ((aref = (AXUIElementRef)[enumerator nextObject]))
        {
          windowInfo *wi = [[windowInfo alloc] init];
          wi.application = proc.name;
          
          if (AXUIElementCopyAttributeValue(aref, CFSTR("AXTitle"), (CFTypeRef *)&w_title) == kAXErrorSuccess)
          {
            wi.title = [w_title description];
            [w_title release];
          }
          if (AXUIElementCopyAttributeValue(aref, CFSTR("AXPosition"), (CFTypeRef *)&w_pos) == kAXErrorSuccess)
          {
            if (AXValueGetType((AXValueRef)w_pos) == kAXValueCGPointType)
            {
              AXValueGetValue((AXValueRef)w_pos, kAXValueCGPointType, &pos);
              wi.wpos_x      = [NSNumber numberWithDouble:pos.x];
              wi.wpos_y      = [NSNumber numberWithDouble:pos.y];
            }
            [w_pos release];
          }
          if (AXUIElementCopyAttributeValue(aref, CFSTR("AXSize"), (CFTypeRef *)&w_size) == kAXErrorSuccess)
          {
            if (AXValueGetType((AXValueRef)w_size) == kAXValueCGSizeType)
            {
              AXValueGetValue((AXValueRef)w_size, kAXValueCGSizeType, &sz);
              wi.wsize_w     = [NSNumber numberWithDouble:sz.width];
              wi.wsize_h     = [NSNumber numberWithDouble:sz.height];
            }
            [w_size release];
          }
          [self addObject:wi];
          [wi release];
        }
        [windows release];
      }
      CFRelease(appElement);
      [proc_attrs release];
    }
  }
}

@end
