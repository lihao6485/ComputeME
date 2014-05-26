//
//  CMGetReadyViewController.h
//  ComputeMe
//
//  Created by Kok Hong on 5/25/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

@import UIKit;
@class Result;

@interface CMGetReadyViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UILabel *getReadyLabel;
@property (weak, nonatomic) IBOutlet UILabel *countDownLabel;

@property (copy, nonatomic) NSDictionary *gameDetailDictionary;

@end
