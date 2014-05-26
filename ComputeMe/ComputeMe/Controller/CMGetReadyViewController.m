//
//  CMGetReadyViewController.m
//  ComputeMe
//
//  Created by Kok Hong on 5/25/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "CMGetReadyViewController.h"
#undef MAX_COUNTDOWN

@interface CMGetReadyViewController ()
{
@private
    NSTimer *_timer;
    NSInteger _countingSecond;
}

@end

@implementation CMGetReadyViewController

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
    [self.getReadyLabel setFont:[UIFont fontWithName:@"COCOGOOSE" size:36]];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(finishCounting:) userInfo:nil repeats:YES];
    _countingSecond = 3;
}

- (void)finishCounting:(NSTimer*)theTimer
{
    if(_countingSecond <= 1)
    {
        //TODO Go to quiz game page.
        [self.countDownLabel setFrame:CGRectMake(53.0f, 234.0f, 215.0f, 137.0f)];
        [self.countDownLabel setText:@"start"];
    }
    else
    {
        _countingSecond--;
        [self.countDownLabel setText:[NSString stringWithFormat:@"%ld",(long)_countingSecond]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
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
