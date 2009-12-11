//
//  doubleTransformer.m
//  winfo
//
//  Created by hippos on 09/12/11.
//  Copyright 2009 hippos-lab.com. All rights reserved.
//

#import "doubleTransformer.h"


@implementation doubleTransformer

+ (Class)transformedValueClass
{
  return [NSString self];
}

+ (BOOL)allowsReverseTransformation
{
  return NO;
}

- (id)transformedValue:(id)beforeObject
{
  if (beforeObject == nil)
  {
    return nil;
  }
  NSString *f = [NSString stringWithFormat:@"%.0f", [beforeObject doubleValue]];
  return f;
}
@end
