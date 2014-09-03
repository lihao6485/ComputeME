//
//  GetReadySceneViewController.swift
//  ComputeME
//
//  Created by Li Hao on 8/21/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

class GetReadySceneViewController: UIViewController {
    
    var selectedCategory: QuestionCategory!
    var selectedGameMode: GameMode!
    private var timer: NSTimer!
    private var currentTime = 3
    @IBOutlet var timeLabel: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countingTime:", userInfo: nil, repeats: true)
    }
    
    func countingTime(sender: NSTimer!) {
        
        currentTime--
        
        if (currentTime == 0) {
            timeLabel.text = "start"
        } else if (currentTime == -1) {
            sender.invalidate()
            performSegueWithIdentifier("QuizViewSegue", sender: sender)
        }
        
        else {
            timeLabel.text = String(currentTime)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "QuizViewSegue" {
            let vc = segue.destinationViewController as QuestionSceneViewController
            vc.selectedGameMode = selectedGameMode
            vc.selectedCategory = selectedCategory
            
        }
    }
}
