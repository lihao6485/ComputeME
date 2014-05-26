//
//  CMQuestionViewController.h
//  ComputeMe
//
//  Created by Lai Li Hao on 5/25/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

@import UIKit;
@class Result;

@interface CMQuestionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *option4Button;
@property (weak, nonatomic) IBOutlet UIButton *option1Button;
@property (weak, nonatomic) IBOutlet UIButton *option2Button;
@property (weak, nonatomic) IBOutlet UIButton *option3Button;
@property (weak, nonatomic) IBOutlet UILabel *countDownLabel;

- (id)initWithCategory:(NSString *)category
                  mode:(NSString *)mode;

@end
