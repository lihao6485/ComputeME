//
//  CMGameCategoryViewController.m
//  ComputeMe
//
//  Created by Kok Hong on 5/24/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMGameCategoryViewController.h"

@interface CMGameCategoryViewController ()

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

- (void)initButtonTitle
{
    [[self.historyButton titleLabel] setFont:[UIFont fontWithName:@"COCOGOOSE" size:25]];
    [[self.programmingButton titleLabel] setFont:[UIFont fontWithName:@"COCOGOOSE" size:25]];
    self.programmingButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.programmingButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.programmingButton setTitle: @"programming\nlanguage" forState: UIControlStateNormal];
    [[self.hardwareButton titleLabel] setFont:[UIFont fontWithName:@"COCOGOOSE" size:25]];
    [[self.networkingButton titleLabel] setFont:[UIFont fontWithName:@"COCOGOOSE" size:25]];
    [[self.digitalMediaButton titleLabel] setFont:[UIFont fontWithName:@"COCOGOOSE" size:25]];
 
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
