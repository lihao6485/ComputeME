//
//  Result.h
//  ComputeMe
//
//  Created by Kok Hong on 5/26/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Result : NSManagedObject

@property (nonatomic, retain) NSNumber * correctAnswer;
@property (nonatomic, retain) NSString * gameMode;
@property (nonatomic, retain) NSString * gameCategory;

@end
