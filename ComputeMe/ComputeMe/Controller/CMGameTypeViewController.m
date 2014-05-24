//
//  CMGameTypeViewController.m
//  ComputeMe
//
//  Created by Lai Li Hao on 5/19/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMGameTypeViewController.h"
#import "CMSettingViewController.h"

@interface CMGameTypeViewController ()

@end

@implementation CMGameTypeViewController

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
    [self initButtonTitle];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"RESULT"
                                                                    style:UIBarButtonItemStyleDone target:self action:@selector(resultAction:)];
    [rightButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIFont fontWithName:@"COCOGOOSE" size:17], NSFontAttributeName,
                                     [UIColor blackColor], NSForegroundColorAttributeName,
                                     nil]
                           forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (IBAction)settingAction:(id)sender
{
    UIStoryboard *settingStoryboard = [UIStoryboard storyboardWithName:@"SettingStoryboard" bundle:nil];
    CMSettingViewController *settingVC = [settingStoryboard instantiateViewControllerWithIdentifier:@"CMSettingViewController"];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initButtonTitle
{
    [[self.challengeButton titleLabel] setFont:[UIFont fontWithName:@"COCOGOOSE" size:35]];
    [[self.classicButton titleLabel] setFont:[UIFont fontWithName:@"COCOGOOSE" size:35]];
    [[self.storyButton titleLabel] setFont:[UIFont fontWithName:@"COCOGOOSE" size:35]];
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
