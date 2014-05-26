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
#import <QuartzCore/QuartzCore.h>
#import <PTUIKitAdditions/PTUIKitAdditions.h>

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
        [self setUpOptionButtonWithOptions:question.options];
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

- (void)setUpOptionButtonWithOptions:(Options *)options
{
    [self.option1Button setEnabled:YES];
    [self.option2Button setEnabled:YES];
    [self.option3Button setEnabled:YES];
    [self.option4Button setEnabled:YES];
    [self.option1Button setBackgroundColor:[UIColor whiteColor]];
    [self.option2Button setBackgroundColor:[UIColor whiteColor]];
    [self.option3Button setBackgroundColor:[UIColor whiteColor]];
    [self.option4Button setBackgroundColor:[UIColor whiteColor]];
    [self.option1Button.layer setCornerRadius:9.0f];
    [self.option2Button.layer setCornerRadius:9.0f];
    [self.option3Button.layer setCornerRadius:9.0f];
    [self.option4Button.layer setCornerRadius:9.0f];
    [self.option1Button setTitle:options.option1 forState:UIControlStateNormal];
    [self.option2Button setTitle:options.option2 forState:UIControlStateNormal];
    [self.option3Button setTitle:options.option3 forState:UIControlStateNormal];
    [self.option4Button setTitle:options.option4 forState:UIControlStateNormal];
}

- (IBAction)selectOption:(id)sender
{
    [self.option1Button setEnabled:NO];
    [self.option2Button setEnabled:NO];
    [self.option3Button setEnabled:NO];
    [self.option4Button setEnabled:NO];
    
    Question *question = _questions[_currentQuestion];
    Options *options = question.options;
    
    if ([[[(UIButton *)sender titleLabel] text] isEqualToString:options.answer])
    {
        [(UIButton *)sender setBackgroundColor:[@"4CD964" toColor]];
    }
    
    else
    {
        [(UIButton *)sender setBackgroundColor:[@"FF6A6E" toColor]];
        
        if ([[[self.option1Button titleLabel] text] isEqualToString:options.answer])
        {
            [self.option1Button setBackgroundColor:[@"4CD964" toColor]];
        }
        
        else if ([[[self.option2Button titleLabel] text] isEqualToString:options.answer])
        {
            [self.option2Button setBackgroundColor:[@"4CD964" toColor]];
        }
        
        else if ([[[self.option3Button titleLabel] text] isEqualToString:options.answer])
        {
            [self.option3Button setBackgroundColor:[@"4CD964" toColor]];
        }
        
        else if ([[[self.option4Button titleLabel] text] isEqualToString:options.answer])
        {
            [self.option4Button setBackgroundColor:[@"4CD964" toColor]];
        }
    }
    
    _currentQuestion++;
    
    [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(finishSelectedAnswer:) userInfo:nil repeats:NO];
    
}

- (void)finishSelectedAnswer:(NSTimer *)sender
{
    if ([_questions count] > _currentQuestion)
    {
        [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self setUpNextQuestion];
        } completion:nil];
    }
    
    else
    {
        // go to the result page and need result object.
    }
}

- (void)setUpNextQuestion
{
    Question *question = _questions[_currentQuestion];
    [self.contentView removeAllSubviewsExceptSubview:nil];
    [self.contentView addSubview:[self loadContentViewWithQuestion:question]];
    [self setUpOptionButtonWithOptions:question.options];
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
