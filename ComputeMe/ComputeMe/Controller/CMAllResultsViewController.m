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
    [self loadResultsData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadResultsData
{
    NSArray *challengePL = [self loadResultWithCategory:@"Programming Language" mode:@"Challenge"];
    NSLog(@"%@",challengePL.lastObject);
    NSArray *challengeHI = [self loadResultWithCategory:@"History" mode:@"Challenge"];
    NSLog(@"%@",challengeHI.lastObject);
    NSArray *challengeHW = [self loadResultWithCategory:@"Hardware" mode:@"Challenge"];
    NSLog(@"%@",challengeHW.lastObject);
    NSArray *classicPL = [self loadResultWithCategory:@"Programming Language" mode:@"Classic"];
    NSLog(@"%@",classicPL.lastObject);
    NSArray *classicHI = [self loadResultWithCategory:@"History" mode:@"Classic"];
    NSLog(@"%@",classicHI.lastObject);
    NSArray *classicHW = [self loadResultWithCategory:@"Hardware" mode:@"Classic"];
    NSLog(@"%@",classicHW.lastObject);
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
