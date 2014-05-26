//
//  RCFadeInSegue.m
//  TradeHero
//
//  Created by Matthias Ryne Cheow on 2/4/13.
//
//

#import "RCFadeInSegue.h"
#import <QuartzCore/QuartzCore.h>

@implementation RCFadeInSegue


- (void) perform
{
//    CATransition* transition = [CATransition animation];
//    
//    transition.duration = 0.5;
//    transition.type = kCATransitionFade;
//    
//    [[self.sourceViewController navigationController].view.layer addAnimation:transition forKey:kCATransition];
     [[self sourceViewController] presentModalViewController:[self destinationViewController] animated:NO];
}

@end
