//
//  GetReadySceneViewController.swift
//  ComputeME
//
//  Created by Li Hao on 8/21/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

class GetReadySceneViewController: UIViewController {
    
    var selectedCatergory: String?
    var selectedGameMode: String?
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
            _timer.invalidate()
        }
            
        else if (_currentTime == -1) {
            // push to question scene
        }
        
        else {
            timeLabel.text = String(_currentTime)
        }
    }
}
