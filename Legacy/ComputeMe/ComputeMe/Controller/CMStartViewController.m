//
//  CMStartViewController.m
//  ComputeMe
//
//  Created by Lai Li Hao on 5/19/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMStartViewController.h"
#import "UIFont+CMFont.h"

@interface CMStartViewController ()

@end

@implementation CMStartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
   if (self) {
      // Custom initialization
   }
   return self;
}

- (void)viewDidLoad
{
   [super viewDidLoad];
   // Do any additional setup after loading the view.
   [self initTitleLabel];

}

- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}


- (void)initTitleLabel
{
   self.titleFirstLabel.font = [UIFont codeLightFontWithSize:40.0f];
   self.titleSecondLabel.font = [UIFont codeLightFontWithSize:60.0f];

   [self.startLabel setAlpha:0.2f];

   [UIView animateWithDuration:0.8f
                         delay:0.0f
                       options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction
                    animations:^{
      [self.startLabel setAlpha:1.0f];
   }
                    completion:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   // Get the new view controller using [segue destinationViewController].
   // Pass the selected object to the new view controller.

}


@end
