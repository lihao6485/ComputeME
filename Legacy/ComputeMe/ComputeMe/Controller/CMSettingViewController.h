//
//  CMSettingViewController.h
//  ComputeMe
//
//  Created by Lai Li Hao on 5/24/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMSettingViewController : UIViewController

@property(weak, nonatomic) IBOutlet UIButton *resetAllButton;
@property(weak, nonatomic) IBOutlet UISwitch *soundEffectSwitch;
@property(weak, nonatomic) IBOutlet UISwitch *backgroundMusicSwitch;

@end
