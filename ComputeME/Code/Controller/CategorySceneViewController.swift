//
//  CategorySceneViewController.swift
//  ComputeME
//
//  Created by Li Hao on 8/19/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

class CategorySceneViewController: UIViewController {
    
    var selectedGameMode: String?
    @IBOutlet var programmingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        programmingButton.titleLabel.textAlignment = .Center
    }

    @IBAction func backToModeSelectionScene(sender: UIButton!) {
        self.navigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func selectCategory(sender: UIButton!) {
        let getReadyViewController = self.storyboard.instantiateViewControllerWithIdentifier("GetReadyScene") as GetReadySceneViewController
        getReadyViewController.selectedCatergory = sender.titleLabel.text
        getReadyViewController.selectedGameMode = selectedGameMode
        self.navigationController.pushViewController(getReadyViewController, animated: true)
    }
}
