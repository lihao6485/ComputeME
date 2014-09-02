//
//  AppDelegate.swift
//  ComputeME
//
//  Created by Ryne Cheow on 8/14/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    var managedObjectContext:NSManagedObjectContext!
    var managedObjectModel:NSManagedObjectModel!
    var persistentStoreCoordinator: NSPersistentStoreCoordinator!
    
    var bgmPlayer: AVAudioPlayer!
    
    var isSoundEffectOn: Bool {
        get {
            if self.bgmPlayer != nil {
                return self.bgmPlayer.playing
            }
            return false
        }
    }

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
//        self.bgmPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: "\(NSBundle.mainBundle().resourcePath)/Mining by Moonlight.mp3"), error: nil)
//        self.bgmPlayer.numberOfLoops = -1
//        self.bgmPlayer.play()
        
        FBLoginView.self
        
        return true
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String, annotation: AnyObject?) -> Bool {
        var wasHandled = FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication)

        return wasHandled
    }

    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func applicationDocumentsDirectory() -> NSURL? {
        return NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last as? NSURL
    }
    
    // Returns the managed object context for the application.
    // If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
    func getManagedObjectContext() ->NSManagedObjectContext
    {
    
        let coordinator = getPersistentStoreCoordinator() as NSPersistentStoreCoordinator
        
        managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        
        return managedObjectContext;
    }
    
    // Returns the managed object model for the application.
    // If the model doesn't already exist, it is created from the application's model.
    func getManagedObjectModel()-> NSManagedObjectModel
    {
    
        let modelURL = NSBundle.mainBundle().URLForResource("DataModel" ,withExtension:"momd") as NSURL!
        managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL)
        return managedObjectModel;
    }
    
    // Returns the persistent store coordinator for the application.
    // If the coordinator doesn't already exist, it is created and the application's store added to it.
    func getPersistentStoreCoordinator() ->NSPersistentStoreCoordinator
    {
    
        let storeURL = NSFileManager.applicationSupportDirectoryURL()?.URLByAppendingPathComponent("DataModel.sqlite") as NSURL!
    
        if(!NSFileManager.defaultManager().fileExistsAtPath(storeURL.path!)) {
            let preloadURL = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("ImportUtility", ofType: "sqlite")!) as NSURL!
    
            var err:NSErrorPointer = nil
            if(!NSFileManager.defaultManager().copyItemAtPath(preloadURL.path!, toPath: storeURL.path!, error: err))
            {
                NSLog("Oops, could copy preloaded data")
            }
        }
        
    
        var error:NSErrorPointer = nil;
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel:managedObjectModel)

        if ((persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil, error: error)) == nil) {
            /*
            Replace this implementation with code to handle the error appropriately.
        
            abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
            Typical reasons for an error here include:
            * The persistent store is not accessible;
            * The schema for the persistent store is incompatible with current managed object model.
            Check the error message to determine what the actual problem was.
            
        
            If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
        
            If you encounter schema incompatibility errors during development, you can reduce their frequency by:
            * Simply deleting the existing store:
            [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
        
            * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
            @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
        
            Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
        
            */
            NSLog("Unresolved error %@", error.debugDescription)
            abort()
        }
    
        return persistentStoreCoordinator
    }

}



