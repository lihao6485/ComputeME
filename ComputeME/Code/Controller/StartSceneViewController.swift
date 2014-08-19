//
//  StartSceneViewController.swift
//  ComputeME
//
//  Created by Li Hao on 8/19/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

class StartSceneViewController: UIViewController {
    
    @IBOutlet var startLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController.navigationBarHidden = true
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.Repeat|UIViewAnimationOptions.Autoreverse,
            animations: { () -> Void in
            self.startLabel.alpha = 0.0}, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func handleTap(recognizer: UITapGestureRecognizer) {
        let gameModeSceneViewController: GameModeSceneViewController = self.storyboard.instantiateViewControllerWithIdentifier("GameModeSelectionScene") as GameModeSceneViewController
        self.navigationController.pushViewController(gameModeSceneViewController, animated: true)
    }
}
