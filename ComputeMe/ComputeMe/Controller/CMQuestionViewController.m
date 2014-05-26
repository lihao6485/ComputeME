//
//  CMQuestionViewController.m
//  ComputeMe
//
//  Created by Lai Li Hao on 5/25/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMQuestionViewController.h"
#import "CMAppDelegate.h"
#import "CMQuestionWithImageView.h"
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
        [self loadDataByCategory:category];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // testing only remove when linking
    [self loadDataByCategory:@"Programming Language"];
    
    if ([_questions count] != 0)
    {
        Question *question = _questions[_currentQuestion];
        [self.contentView addSubview:[self loadContentViewWithQuestion:question]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Load data from Core Data

- (void)loadDataByCategory:(NSString *)category
{
    CMAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Question" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(category LIKE[c] %@)",@"Programming Language"];
    [request setEntity:entity];
    [request setPredicate:predicate];
    
    NSError *error;
    _questions = [[NSArray alloc] init];
    _questions = [context executeFetchRequest:request error:&error];
    _currentQuestion = 0;
}

#pragma mark - Load content view

- (UIView *)loadContentViewWithQuestion:(Question *)question
{
    if (![question isImage])
    {
        NSLog(@"%@", question.isImage);
        NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:@"QuestionWithImageView" owner:self options:nil];
        CMQuestionWithImageView *questionView = nibViews[0];
        
        // TODO: implement load image
        
        return questionView;
    }
    
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:@"QuestionWithoutImageView" owner:self options:nil];
    CMQuestionWithoutImageView *questionView = nibViews[0];
    [[questionView question] setText:question.content];
    
    return questionView;
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
