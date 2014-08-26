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
    
    var selectedCategory: QuestionCategory!
    var selectedGameMode: GameMode!
    private lazy var questions:[Question] = []
    private var currentQuestion = 0
    private var correctAnswers = 0
    private var countingSeconds: CGFloat = 0.0
    private var lifeCount = 3
    private var MAX_SECONDS: CGFloat = 30.0
    
    //  FIX: not the right way to do this
    private var lifeArrayImage:[UIImageView!] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (selectedGameMode == GameMode.Challenge) {
            self.configureAsChallengeMode()
        }
        else if (selectedGameMode == GameMode.Classic) {
            self.configureAsClassicMode()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    private func configureAsChallengeMode() {
        let timer = NSTimer(timeInterval: 0.1, target: self, selector: "finishCounting:", userInfo: nil, repeats: true)
        countingSeconds = MAX_SECONDS
        self.challengeView.hidden = false
        self.classicView.hidden = true
    }
    
    func finishCounting(timer:NSTimer!) {
        countingSeconds -= 0.1
        self.countDownLabel.text = NSString(format: "%.2f", countingSeconds)
        if (countingSeconds <= 0) {
            timer.invalidate()
            self.navigateToResultScene()
        } else if (countingSeconds <= 10) {
            self.countDownLabel.textColor = UIColor(red: 1.0, green: 19/255, blue: 0, alpha: 1.0)
        } else if (countingSeconds <= 15) {
            self.countDownLabel.textColor = UIColor (red: 1.0, green: 94/255, blue: 58/255, alpha: 1.0);
        }
    }
    
    private func configureAsClassicMode() {
        lifeCount = 3;
        lifeArrayImage = [self.lifeImageView0, self.lifeImageView1, self.lifeImageView2]
        self.challengeView.hidden = true
        self.classicView.hidden = false
    }
    
    private func minusLifeOnClassicMode() {
        lifeCount--
        lifeArrayImage[lifeCount].image = UIImage(named: "Cross")
        if (lifeCount == 0) {
            self.navigateToResultScene()
        }
    }
    
    private func navigateToResultScene() {
        //TODO implement it
    }
    


}
