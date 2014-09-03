//
//  GameModeSceneViewController.swift
//  ComputeME
//
//  Created by Li Hao on 8/19/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

class GameModeSceneViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var storyButton: UIButton!
    @IBOutlet var fbLoginView: FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fbLoginView.delegate = self
        fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    }
    
    @IBAction func selectMode(sender: UIButton!) {
        let categoryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CategorySelectionScene") as CategorySceneViewController
        
        switch sender.tag {
        case 34:
            categoryViewController.selectedGameMode = .Challenge
        case 35:
            categoryViewController.selectedGameMode = .Classic
        case 36:
            categoryViewController.selectedGameMode = .Story
        default:
            categoryViewController.selectedGameMode = .Unknown
        }
        
        self.navigationController?.pushViewController(categoryViewController, animated: true)
    }
    
    // MARK: FBLoginViewDelegate
    
    // Fetched FB user data
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
//        println(user.first_name + user.last_name)
    }
    
    // Logged in Experience
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        
    }
    
    // Logged out Experience
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        
    }
    
    // Handle FBLoginViewDelegate error
    func loginView(loginView: FBLoginView!, handleError error: NSError!) {
        var alertTitle = ""
        var alertMessage = ""
        
        switch (error) {
            case FBErrorUtility.shouldNotifyUserForError(error):
                alertTitle = "Facebook Error"
                alertMessage = FBErrorUtility.userMessageForError(error)
            
            case FBErrorUtility.errorCategoryForError(error) == FBErrorCategory.AuthenticationReopenSession:
                alertTitle = "Session Error"
                alertMessage = "Your current session is no longer valid. Please log in again."
            
            case FBErrorUtility.errorCategoryForError(error) == FBErrorCategory.UserCancelled:
                println("User Cancelled")
            
            default:
                alertTitle = "Something went wrong"
                alertMessage = "Please try again later"
        }
        
        var alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                println("Default")
                
            case .Cancel:
                println("Cancel")
                
            case .Destructive:
                println("Destructive")
            }
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
