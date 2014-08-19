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
        let categoryViewController: CategorySceneViewController = self.storyboard.instantiateViewControllerWithIdentifier("CategorySelectionScene") as CategorySceneViewController
        categoryViewController.selectedCategory = sender.titleLabel.text
        self.navigationController.pushViewController(categoryViewController, animated: true)
    }
}
