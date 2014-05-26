//
//  Result.m
//  ComputeMe
//
//  Created by Kok Hong on 5/26/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "Result.h"


@implementation Result

@dynamic correctAnswers;
@dynamic gameMode;
@dynamic gameCategory;

@end

NSString *const ResultKeyGameModeChallenge = @"Challenge";
NSString *const ResultKeyGameModeClassic = @"Classic";
NSString *const ResultKeyGameModeStory = @"Story";
NSString *const ResultKeyGameCategoryHistory = @"History";
NSString *const ResultKeyGameCategoryDigitalMedia = @"Digital Media";
NSString *const ResultKeyGameCategoryProgrammingLanguage = @"Programming Language";
NSString *const ResultKeyGameCategoryNetworking = @"Networking";
NSString *const ResultKeyGameCategoryHardware = @"Hardware";