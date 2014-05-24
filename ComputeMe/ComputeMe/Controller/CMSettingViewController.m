//
//  CMSettingViewController.m
//  ComputeMe
//
//  Created by Lai Li Hao on 5/24/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMSettingViewController.h"

@interface CMSettingViewController ()

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
                                        [UIFont fontWithName:@"COCOGOOSE" size:17], NSFontAttributeName,
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
