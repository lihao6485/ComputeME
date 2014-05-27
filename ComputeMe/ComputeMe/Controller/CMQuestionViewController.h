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

@property(weak, nonatomic) IBOutlet UIView *contentView;
@property(weak, nonatomic) IBOutlet UIButton *option4Button;
@property(weak, nonatomic) IBOutlet UIButton *option1Button;
@property(weak, nonatomic) IBOutlet UIButton *option2Button;
@property(weak, nonatomic) IBOutlet UIButton *option3Button;
@property(weak, nonatomic) IBOutlet UILabel *countDownLabel;
@property(weak, nonatomic) IBOutlet UIView *challengeView;
@property(weak, nonatomic) IBOutlet UIImageView *lifeImageView0;
@property(weak, nonatomic) IBOutlet UIImageView *lifeImageView1;
@property(weak, nonatomic) IBOutlet UIImageView *lifeImageView2;
@property(weak, nonatomic) IBOutlet UIView *classicView;
@property(strong, nonatomic) Result *result;

- (id)initWithCategory:(NSString *)category
                  mode:(NSString *)mode;

@end
