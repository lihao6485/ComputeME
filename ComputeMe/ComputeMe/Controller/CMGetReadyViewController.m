//
//  CMGetReadyViewController.m
//  ComputeMe
//
//  Created by Kok Hong on 5/25/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMGetReadyViewController.h"
#import "CMQuestionViewController.h"
#import "RCFadeInSegue.h"
#import "UIFont+CMFont.h"

@interface CMGetReadyViewController () {
@private
   NSTimer *_timer;
   NSInteger _countingSecond;
}

@end

@implementation CMGetReadyViewController

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
   [self.getReadyLabel setFont:[UIFont cocogooseFontWithSize:36.0f]];
   _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(finishCounting:) userInfo:nil repeats:YES];
   _countingSecond = 3;
}

- (void)finishCounting:(NSTimer *)theTimer
{
   if (_countingSecond == 1) {
      [self.countDownLabel setFrame:CGRectMake(53.0f, 234.0f, 215.0f, 137.0f)];
      [self.countDownLabel setText:@"start"];
      _countingSecond--;

   }
   else if (_countingSecond <= 0) {
      [theTimer invalidate];
      CMQuestionViewController *questionVC = [[CMQuestionViewController alloc] initWithCategory:self.gameDetailDictionary[@"gameCategory"]
                                                                                           mode:self.gameDetailDictionary[@"gameMode"]];

      RCFadeInSegue *segue = [[RCFadeInSegue alloc] initWithIdentifier:@""
                                                                source:self
                                                           destination:questionVC];
      [self prepareForSegue:segue
                     sender:self];
      [segue perform];
   }
   else {
      _countingSecond--;
      [self.countDownLabel setText:[NSString stringWithFormat:@"%ld", (long) _countingSecond]];
   }

}

- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
   return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];
   [self.view setHidden:NO];
   self.navigationController.interactivePopGestureRecognizer.enabled = NO;
   self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
   [super viewWillDisappear:animated];
   [self.view setHidden:YES];
   self.navigationController.interactivePopGestureRecognizer.enabled = YES;
   self.navigationController.navigationBar.hidden = NO;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//   [self.navigationController popToRootViewControllerAnimated:YES];
   // Pass the selected object to the new view controller.
}


@end
