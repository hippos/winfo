//
//  windowInfo.m
//  winfo
//
//  Created by hippos on 09/12/11.
//  Copyright 2009 hippos-lab.com. All rights reserved.
//

#import "windowInfo.h"


@implementation windowInfo 

@synthesize application;
@synthesize title;
@synthesize wpos_x;
@synthesize wpos_y;
@synthesize wsize_w;
@synthesize wsize_h;

- (id)init
{
  if (self = [super init])
  {
    application = @"foo";
    title       = @"no title";
  }
  return self;
}

- (void)setWSize:(CGSize)s
{
  wsize_w = [NSNumber numberWithDouble:s.width];
  wsize_h = [NSNumber numberWithDouble:s.height];;
}

- (void)setWPos:(CGPoint)p
{
  wpos_x = [NSNumber numberWithDouble:p.x];
  wpos_y = [NSNumber numberWithDouble:p.y];;
}

- (NSString*)description
{
  return 
  [NSString stringWithFormat:@"application[%@] window (x:y,w:h)(%.0f:%.0f,%.0f:%.0f)",
    [self application],[self title],
    [[self wpos_x] doubleValue],[[self wpos_y] doubleValue],
    [[self wsize_w] doubleValue],[[self wsize_h] doubleValue]
   ];
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeObject:[self application] forKey:@"application"];
  [coder encodeObject:[self title] forKey:@"title"];
  [coder encodeObject:[self wpos_x] forKey:@"wpos_x"];
  [coder encodeObject:[self wpos_y] forKey:@"wpos_y"];
  [coder encodeObject:[self wsize_w] forKey:@"wsize_w"];
  [coder encodeObject:[self wsize_h] forKey:@"wsize_h"];
}

- (id)initWithCoder:(NSCoder *)coder
{
  if (self = [super init])
  {
    self.application = [coder decodeObjectForKey:@"application"];
    self.title       = [coder decodeObjectForKey:@"title"];
    self.wpos_x      = [coder decodeObjectForKey:@"wpos_x"];
    self.wpos_y      = [coder decodeObjectForKey:@"wpos_y"];
    self.wsize_w     = [coder decodeObjectForKey:@"wsize_w"];
    self.wsize_h     = [coder decodeObjectForKey:@"wsize_h"];
  }
  return self;
}

@end
