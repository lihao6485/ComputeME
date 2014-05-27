//
//  CMSettingViewController.m
//  ComputeMe
//
//  Created by Lai Li Hao on 5/24/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMSettingViewController.h"
#import "UIFont+CMFont.h"
#import "CMAppDelegate.h"

@interface CMSettingViewController () <UIAlertViewDelegate>

@end

@implementation CMSettingViewController

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
   [self.resetAllButton setTintColor:[UIColor colorWithHue:357.0f saturation:79.0f brightness:74.0f alpha:1.0f]];
   self.navigationItem.hidesBackButton = YES;

   UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"MODE"
                                                                  style:UIBarButtonItemStyleDone target:self action:@selector(backAction:)];
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

- (IBAction)resetAllAction:(id)sender
{
   UIAlertView *alert = [[UIAlertView alloc]

         initWithTitle:@"Reset All"
               message:@"Are you sure want to reset all score?"
              delegate:self
     cancelButtonTitle:@"Cancel"
     otherButtonTitles:@"Ok", nil];

   [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   if (buttonIndex == 1) {
      [self deleteAllObjects:@"Result"];
      [self.backgroundMusicSwitch setOn:YES animated:YES];
      [self.soundEffectSwitch setOn:NO animated:YES];
   }
}

- (void)deleteAllObjects:(NSString *)entityDescription
{

   CMAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
   NSManagedObjectContext *context = [appDelegate managedObjectContext];
   NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];

   NSEntityDescription *entity = [NSEntityDescription entityForName:entityDescription inManagedObjectContext:context];
   [fetchRequest setEntity:entity];


   NSError *error;
   NSArray *items = [context executeFetchRequest:fetchRequest error:&error];

   for (NSManagedObject *managedObject in items) {
      [context deleteObject:managedObject];
   }
   if (![context save:&error]) {
      NSLog(@"Error deleting %@ - error:%@", entityDescription, error);
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
