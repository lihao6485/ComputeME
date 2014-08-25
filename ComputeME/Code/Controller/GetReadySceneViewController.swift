//
//  GetReadySceneViewController.swift
//  ComputeME
//
//  Created by Li Hao on 8/21/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

class GetReadySceneViewController: UIViewController {
    
    var selectedCatergory: String!
    var selectedGameMode: String!
    private var _timer: NSTimer!
    private var _currentTime = 3
    @IBOutlet var timeLabel: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        _timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countingTime:", userInfo: nil, repeats: true)
    }
    
    func countingTime(sender: NSTimer!) {
        
        _currentTime--
        
        if (_currentTime == 0) {
            timeLabel.text = "start"
            
        }
            
        else if (_currentTime == -1) {
            _timer.invalidate()
            let questionViewController = self.storyboard.instantiateViewControllerWithIdentifier("QuestionScene") as QuestionSceneViewController
            questionViewController.selectedGameMode = selectedGameMode
            questionViewController.selectedCatergory = selectedCatergory
            self.navigationController.pushViewController(questionViewController, animated: true)
        }
        
        else {
            timeLabel.text = String(_currentTime)
        }
    }
}
