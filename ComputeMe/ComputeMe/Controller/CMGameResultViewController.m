//
//  CMGameResultViewController.m
//  ComputeMe
//
//  Created by Kok Hong on 5/25/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMGameResultViewController.h"
#import "UIFont+CMFont.h"
#import "Result.h"

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

   [self initTitle];

}

- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

- (void)initTitle
{
   [self.gameModeLabel setFont:[UIFont cocogooseFontWithSize:35.0f]];
   [self.correctAnswerLabel setFont:[UIFont myriadProFontWithSize:50.0f]];
   [self.correctAnswerLabel setText:[self.gameDetails[@"correctAnswers"] stringValue]];


   if ([self.gameDetails[@"gameMode"] isEqualToString:ResultKeyGameModeClassic]) {
      [self.gameModeLabel setText:@"CLASSIC"];
      [self.gameModeLabel setFrame:CGRectMake(83.0f, 79.0f, 156.0f, 45.0f)];
   }
   else if([self.gameDetails[@"gameMode"] isEqualToString:ResultKeyGameModeChallenge]){
      // is Challenge mode
      [self.gameModeLabel setText:@"CHALLENGE"];
      [self.gameModeLabel setFrame:CGRectMake(50, 79.0f, 223.0f, 45.0f)];
   }

}

- (IBAction)exitButton:(id)sender
{
    [((UINavigationController *)self.presentingViewController.presentingViewController) popToRootViewControllerAnimated:NO];
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:NO completion:nil];
}

@end
