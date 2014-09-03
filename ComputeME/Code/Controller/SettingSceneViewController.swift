//
//  SettingSceneViewController.swift
//  ComputeME
//
//  Created by Kok Hong on 9/3/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

class SettingSceneViewController: UIViewController ,UIAlertViewDelegate{
    
    @IBOutlet var backgroundSwitch: UISwitch!
    @IBOutlet var soundEffectSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func resetAllButtonAction(sender: AnyObject) {
        var alert = UIAlertView(title: "Reset All", message: "Are you sure want to reset all scores and settings?", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Ok" , "")
        alert.show()
        
    }
    
    @IBAction func modeButtonAction(sender: AnyObject) {
        self.navigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func soundEffectSwitchAction(sender: UISwitch) {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.isSoundEffectOn = sender.on
    }
    
    @IBAction func backgroundSwitchAction(sender: UISwitch) {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if(sender.on) {
            appDelegate.bgmPlayer.play()
        }
        else {
            appDelegate.bgmPlayer.stop()
        }
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        if(buttonIndex == 1) {
            self.deleteAllData()
            self.backgroundSwitch.setOn(true, animated: true)
            self.soundEffectSwitch.setOn(true, animated: true)
        }
    }
    
    private func deleteAllData() {
        //TODO reset all data
    }
    
}
