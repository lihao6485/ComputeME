//
//  Question.h
//  ComputeMe
//
//  Created by Lai Li Hao on 5/24/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Options;

@interface Question : NSManagedObject

@property(nonatomic, retain) NSString *category;
@property(nonatomic, retain) NSString *content;
@property(nonatomic, retain) NSData *image;
@property(nonatomic, retain) NSNumber *isImage;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) Options *options;

@end
