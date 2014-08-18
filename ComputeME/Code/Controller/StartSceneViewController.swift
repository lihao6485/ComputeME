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
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.Repeat|UIViewAnimationOptions.CurveEaseIn|UIViewAnimationOptions.Autoreverse|UIViewAnimationOptions.AllowUserInteraction,
            animations: { () -> Void in
            self.startLabel.alpha = 0.0
            println("bello");
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
