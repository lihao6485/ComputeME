//
//  QuestionSceneViewController.swift
//  ComputeME
//
//  Created by Kok Hong on 8/25/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

class QuestionSceneViewController: UIViewController {


    @IBOutlet var countDownLabel: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet var challengeView: UIView!
    @IBOutlet var classicView: UIView!
    @IBOutlet var option1Button: UIButton!
    @IBOutlet var option2Button: UIButton!
    @IBOutlet var option3Button: UIButton!
    @IBOutlet var option4Button: UIButton!
    @IBOutlet var lifeImageView0: UIImageView!
    @IBOutlet var lifeImageView1: UIImageView!
    @IBOutlet var lifeImageView2: UIImageView!
    var selectedCatergory: String?
    var selectedGameMode: String?
    private var _questions:[Question] = []
    private var _currentQuestion: NSInteger?
    private var _correctAnswers: NSInteger = 0
    private var _countingSeconds: float_t = 0.0
    private var _lifeCount: NSInteger = 3
    private var _MAX_SECONDS: float_t = 30.0
    private var _lifeArrayImage:[UIImageView!] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (selectedGameMode == "challenge") {
            self.initChallnge()
        }
        else if (selectedGameMode == "classic") {
            self.initClassic()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func initChallnge() {
        let timer = NSTimer(timeInterval: 0.1, target: self, selector: "finishCounting:", userInfo: nil, repeats: true)
        _countingSeconds = _MAX_SECONDS
        self.challengeView.hidden = false
        self.classicView.hidden = true
    }
    
    func finishCounting(timer:NSTimer!) {
        _countingSeconds -= 0.1
        self.countDownLabel.text = NSString(format: "%.2f", _countingSeconds)
        if (_countingSeconds <= 0) {
            timer .invalidate()
            self.navigateToResultScene()
        }
        else if (_countingSeconds <= 10) {
            self.countDownLabel.textColor = UIColor (red: 1.0, green: 19/255, blue: 0, alpha: 1.0)
        }
        else if (_countingSeconds <= 15) {
            self.countDownLabel.textColor = UIColor (red: 1.0, green: 94/255, blue: 58/255, alpha: 1.0);
        }
    }
    
    func initClassic() {
        _lifeCount = 3;
        _lifeArrayImage = [self.lifeImageView0, self.lifeImageView1, self.lifeImageView2]
        self.challengeView.hidden = true
        self.classicView.hidden = false
    }
    
    func minusLifeOnClassicMode() {
        _lifeCount--
        _lifeArrayImage[_lifeCount].image = UIImage(named: "Cross")
        if (_lifeCount == 0) {
            self.navigateToResultScene()
        }
    }
    
    func navigateToResultScene() {
        //TODO implement it
    }
    


}
