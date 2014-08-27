//
//  GameModeSceneViewController.swift
//  ComputeME
//
//  Created by Li Hao on 8/19/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

class GameModeSceneViewController: UIViewController {
    
    @IBOutlet var storyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectMode(sender: UIButton!) {
        let categoryViewController = self.storyboard.instantiateViewControllerWithIdentifier("CategorySelectionScene") as CategorySceneViewController
        
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
        
        self.navigationController.pushViewController(categoryViewController, animated: true)
    }
}
