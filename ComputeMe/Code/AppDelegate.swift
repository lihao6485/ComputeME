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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    
    var bgmPlayer: AVAudioPlayer!
    
    var isSoundEffectOn: Bool = true

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        println(NSURL(fileURLWithPath: "\(NSBundle.mainBundle().resourcePath)/Mining by Moonlight.mp3"))
        self.bgmPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: (NSBundle.mainBundle().pathForResource("Mining by Moonlight", ofType: "mp3"))!), error: nil)
        self.bgmPlayer.numberOfLoops = -1
        self.bgmPlayer.play()
        
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

}



