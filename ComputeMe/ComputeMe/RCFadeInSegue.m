//
//  RCFadeInSegue.m
//  TradeHero
//
//  Created by Matthias Ryne Cheow on 2/4/13.
//
//

#import "RCFadeInSegue.h"

@implementation RCFadeInSegue


- (void)perform
{
//   [[self sourceViewController] presentModalViewController:[self destinationViewController] animated:NO]; deprecated in ios 6
   [[self sourceViewController] presentViewController:[self destinationViewController] animated:NO completion:nil];
}

@end
