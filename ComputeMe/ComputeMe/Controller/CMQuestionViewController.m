//
//  CMQuestionViewController.m
//  ComputeMe
//
//  Created by Lai Li Hao on 5/25/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMQuestionViewController.h"
#import "CMAppDelegate.h"
#import "CMQuestionWithoutImageView.h"
#import "Question.h"
#import "Options.h"

@interface CMQuestionViewController ()

@end

@implementation CMQuestionViewController {
    @private
    NSArray *_questions;
    NSUInteger _currentQuestion;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCategory:(NSString *)category
                  mode:(NSString *)mode
{
    UIStoryboard *questionStoryboard = [UIStoryboard storyboardWithName:@"QuestionStoryboard" bundle:[NSBundle mainBundle]];
    self = [questionStoryboard instantiateViewControllerWithIdentifier:@"CMQuestionViewController"];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CMAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Question" inManagedObjectContext:context];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(category LIKE[c] %@)",@"Programming Language"];
    [request setPredicate:predicate];
    _questions = [[NSArray alloc] init];
    NSError *error;
    
    _questions = [context executeFetchRequest:request error:&error];
    _currentQuestion = 0;
    
    if ([_questions count] != 0)
    {
        NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:@"QuestionWithoutImageView" owner:self options:nil];
        CMQuestionWithoutImageView *questionView = nibViews[0];
        [self.contentView addSubview:questionView];
        Question *question = _questions[_currentQuestion];
        [[questionView question] setText:question.content];
    }
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
