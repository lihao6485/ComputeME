//
//  CMAppDelegate.h
//  ComputeMe
//
//  Created by Kok Hong on 5/16/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

@interface CMAppDelegate : UIResponder <UIApplicationDelegate>

@property(strong, nonatomic) UIWindow *window;
@property(readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property(readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property(readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
