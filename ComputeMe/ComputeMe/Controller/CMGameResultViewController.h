//
//  CMGameResultViewController.h
//  ComputeMe
//
//  Created by Kok Hong on 5/25/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

@import UIKit;

@interface CMGameResultViewController : UIViewController
@property(weak, nonatomic) IBOutlet UILabel *gameModeLabel;
@property(copy, nonatomic) NSDictionary *gameDetails;
@property(weak, nonatomic) IBOutlet UILabel *correctAnswerLabel;
@property (weak, nonatomic) IBOutlet UILabel *bestResultLabel;

@end
