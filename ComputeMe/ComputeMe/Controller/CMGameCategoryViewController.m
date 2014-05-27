//
//  CMGameCategoryViewController.m
//  ComputeMe
//
//  Created by Kok Hong on 5/24/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMGameCategoryViewController.h"
#import "CMGetReadyViewController.h"
#import "Result.h"
#import "UIFont+CMFont.h"

@interface CMGameCategoryViewController () {
@private
   NSMutableDictionary *_gameDetailMutableDictionary;
}

@end

@implementation CMGameCategoryViewController

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
   [self initButtonTitle];
   _gameDetailMutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:self.gameDetailDictionary];

   self.navigationItem.hidesBackButton = YES;

   UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"MODE"
                                                                  style:UIBarButtonItemStyleDone
                                                                 target:self
                                                                 action:@selector(backAction:)];

   [leftButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
         [UIFont cocogooseFontWithSize:17.0f], NSFontAttributeName,
         [UIColor blackColor], NSForegroundColorAttributeName,
         nil]
                             forState:UIControlStateNormal];

   [self.navigationItem setLeftBarButtonItem:leftButton];
}

- (void)backAction:(id)sender
{
   [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

- (void)initButtonTitle
{
   [[self.historyButton titleLabel] setFont:[UIFont cocogooseFontWithSize:25.0f]];
   [[self.programmingButton titleLabel] setFont:[UIFont cocogooseFontWithSize:25.0f]];
   self.programmingButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
   self.programmingButton.titleLabel.textAlignment = NSTextAlignmentCenter;
   [self.programmingButton setTitle:@"programming\nlanguage" forState:UIControlStateNormal];
   [[self.hardwareButton titleLabel] setFont:[UIFont cocogooseFontWithSize:25.0f]];
   [[self.networkingButton titleLabel] setFont:[UIFont cocogooseFontWithSize:25.0f]];
   [[self.digitalMediaButton titleLabel] setFont:[UIFont cocogooseFontWithSize:25.0f]];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
   // Get the new view controller using [segue destinationViewController].
   // Pass the selected object to the new view controller.
   if ([[[self.historyButton titleLabel] text] isEqualToString:sender.titleLabel.text]) {
      [_gameDetailMutableDictionary setObject:ResultKeyGameCategoryHistory forKey:@"gameCategory"];
   }

   else if ([[[self.programmingButton titleLabel] text] isEqualToString:sender.titleLabel.text]) {
      [_gameDetailMutableDictionary setObject:ResultKeyGameCategoryProgrammingLanguage forKey:@"gameCategory"];
   }

   else if ([[[self.hardwareButton titleLabel] text] isEqualToString:sender.titleLabel.text]) {
      [_gameDetailMutableDictionary setObject:ResultKeyGameCategoryHardware forKey:@"gameCategory"];
   }

   else if ([[[self.digitalMediaButton titleLabel] text] isEqualToString:sender.titleLabel.text]) {
      [_gameDetailMutableDictionary setObject:ResultKeyGameCategoryDigitalMedia forKey:@"gameCategory"];
   }
   else if ([[[self.networkingButton titleLabel] text] isEqualToString:sender.titleLabel.text]) {
      [_gameDetailMutableDictionary setObject:ResultKeyGameCategoryNetworking forKey:@"gameCategory"];
   }

   CMGetReadyViewController *getReadyVC = [segue destinationViewController];
   [getReadyVC setGameDetailDictionary:[_gameDetailMutableDictionary copy]];

}


@end
