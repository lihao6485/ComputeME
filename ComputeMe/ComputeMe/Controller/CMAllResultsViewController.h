//
//  CMAllResultsViewController.h
//  ComputeMe
//
//  Created by Lai Li Hao on 5/27/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMAllResultsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *challengeAndClassicSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *hardwareScores;
@property (weak, nonatomic) IBOutlet UILabel *programmingScores;
@property (weak, nonatomic) IBOutlet UILabel *historyScores;
@property (weak, nonatomic) IBOutlet UILabel *networkingScores;
@property (weak, nonatomic) IBOutlet UILabel *digitalMediaScores;


@end
