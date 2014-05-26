//
//  CMGameResultViewController.m
//  ComputeMe
//
//  Created by Kok Hong on 5/25/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMGameResultViewController.h"

@interface CMGameResultViewController ()

@end

@implementation CMGameResultViewController

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
   // Dummy data first for game mode (will be removed)
   self.gameDetails = @{@"gameMode" : @"CHALLENGE",
         @"correctAnswer" : @"16"
   };

   [self initTitle];

}

- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

- (void)initTitle
{
   [self.gameModeLabel setFont:[UIFont fontWithName:@"COCOGOOSE" size:35]];
   [self.correctAnswerLabel setFont:[UIFont fontWithName:@"Myriad Pro" size:50]];
   [self.correctAnswerLabel setText:self.gameDetails[@"correctAnswer"]];


   if ([self.gameDetails[@"gameMode"] isEqualToString:@"CLASSIC"]) {
      [self.gameModeLabel setText:@"CLASSIC"];
      [self.gameModeLabel setFrame:CGRectMake(83.0f, 79.0f, 156.0f, 45.0f)];
   }
   else {
      // is Challenge mode
      [self.gameModeLabel setText:@"CHALLENGE"];
      [self.gameModeLabel setFrame:CGRectMake(50, 79.0f, 223.0f, 45.0f)];
   }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
