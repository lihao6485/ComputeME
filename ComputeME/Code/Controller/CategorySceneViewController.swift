//
//  CategorySceneViewController.swift
//  ComputeME
//
//  Created by Li Hao on 8/19/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

class CategorySceneViewController: UIViewController {
    
    var selectedCategory: String?
    @IBOutlet var programmingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        programmingButton.titleLabel.textAlignment = .Center
    }

    @IBAction func backToModeSelectionScene(sender: UIButton!) {
        self.navigationController.popViewControllerAnimated(true)
    }
}
