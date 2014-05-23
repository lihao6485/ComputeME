//
//  Options.h
//  ComputeMe
//
//  Created by Lai Li Hao on 5/24/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Options : NSManagedObject

@property (nonatomic, retain) NSString * answer;
@property (nonatomic, retain) NSString * option1;
@property (nonatomic, retain) NSString * option2;
@property (nonatomic, retain) NSString * option3;
@property (nonatomic, retain) NSString * option4;
@property (nonatomic, retain) NSManagedObject *question;

@end
