//
//  StartSceneViewController.swift
//  ComputeME
//
//  Created by Li Hao on 8/19/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit
import CloudKit

class StartSceneViewController: UIViewController {
    
    @IBOutlet var startLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        
        UIView.animateWithDuration(0.5, options: .Repeat | .Autoreverse | .AllowUserInteraction | .CurveEaseIn) {
            self.startLabel.alpha = 0.0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func handleTap(recognizer: UITapGestureRecognizer) {
        let gameModeSceneViewController = self.storyboard?.instantiateViewControllerWithIdentifier("GameModeSelectionScene") as GameModeSceneViewController
        self.navigationController?.pushViewController(gameModeSceneViewController, animated: true)
    }
}
