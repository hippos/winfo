//
//  windowInfo.h
//  winfo
//
//  Created by hippos on 09/12/11.
//  Copyright 2009 hippos-lab.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface windowInfo : NSObject
{
  NSString *application;
  NSString *title;
  NSNumber *wpos_x;
  NSNumber *wpos_y;
  NSNumber *wsize_w;
  NSNumber *wsize_h;
}

@property (copy) NSString *application;
@property (copy) NSString *title;
@property (copy) NSNumber *wpos_x;
@property (copy) NSNumber *wpos_y;
@property (copy) NSNumber *wsize_w;
@property (copy) NSNumber *wsize_h;

- (void)setWPos:(CGPoint)p;
- (void)setWSize:(CGSize)s;

@end
