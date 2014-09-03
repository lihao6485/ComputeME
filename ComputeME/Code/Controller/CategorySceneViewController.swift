//
//  CategorySceneViewController.swift
//  ComputeME
//
//  Created by Li Hao on 8/19/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

class CategorySceneViewController: UIViewController {
    
    var selectedGameMode: GameMode!
    @IBOutlet var programmingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        programmingButton.titleLabel?.textAlignment = .Center
    }
    
    @IBAction func backToModeSelectionScene(sender: UIButton!) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func selectCategory(sender: UIButton!) {
        self.performSegueWithIdentifier("GameGetReadySegue", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "GameGetReadySegue" {
            if let button = sender as? UIButton {
                let getReadyViewController = segue.destinationViewController as GetReadySceneViewController
                switch button.tag {
                    case 100:
                        getReadyViewController.selectedCategory = .Hardware
                    case 101:
                        getReadyViewController.selectedCategory = .ProgrammingLanguage
                    case 102:
                        getReadyViewController.selectedCategory = .History
                    case 103:
                        getReadyViewController.selectedCategory = .Networking
                    default:
                        getReadyViewController.selectedCategory = .Unknown
                }
                
                
                getReadyViewController.selectedGameMode = selectedGameMode
            }
        }
    }
}
