//
//  CMAllResultsViewController.m
//  ComputeMe
//
//  Created by Lai Li Hao on 5/27/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMAllResultsViewController.h"
#import "CMAppDelegate.h"
#import "Result.h"
#import "UIFont+CMFont.h"

@interface CMAllResultsViewController ()

@end

@implementation CMAllResultsViewController

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
    [self loadResultsData:@"Challenge"];
    [self.challengeAndClassicSegmentedControl addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    
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
}

- (void)segmentedControlAction:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    
    if (control.selectedSegmentIndex == 0)
    {
        [self loadResultsData:@"Challenge"];
    }
    
    else if (control.selectedSegmentIndex == 1)
    {
        [self loadResultsData:@"Classic"];
    }
}

- (void)loadResultsData:(NSString *)category
{
    NSArray *challengePL = [self loadResultWithCategory:@"Programming Language" mode:category];
    
    if (challengePL.count != 0)
    {
        [self.programmingScores setText:((Result *)challengePL.lastObject).correctAnswers.stringValue];
    }
    
    else
    {
        [self.programmingScores setText:@"0"];
    }
    
    NSArray *challengeHI = [self loadResultWithCategory:@"History" mode:category];
    
    if (challengeHI.count != 0)
    {
        [self.historyScores setText:((Result *)challengeHI.lastObject).correctAnswers.stringValue];
    }
    
    else
    {
        [self.historyScores setText:@"0"];
    }
    
    NSArray *challengeHW = [self loadResultWithCategory:@"Hardware" mode:category];
    
    if (challengeHW.count != 0)
    {
        [self.hardwareScores setText:((Result *)challengeHW.lastObject).correctAnswers.stringValue];
    }
    
    else
    {
        [self.hardwareScores setText:@"0"];
    }
}

- (NSArray *)loadResultWithCategory:(NSString *)category
                               mode:(NSString *)mode
{
    NSArray *result = [[NSArray alloc] init];
    CMAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Result" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"gameCategory LIKE[c] %@ AND gameMode LIKE[c] %@",category, mode];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"correctAnswers" ascending:YES];
    [request setEntity:entity];
    [request setPredicate:predicate];
    [request setSortDescriptors:@[sortDescriptor]];
    NSError *error;
    
    return result = [context executeFetchRequest:request error:&error];
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
