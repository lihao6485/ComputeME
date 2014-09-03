//
//  QuestionSceneViewController.swift
//  ComputeME
//
//  Created by Kok Hong on 8/25/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class QuestionSceneViewController: UIViewController {


    @IBOutlet var countDownLabel: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var classicView: UIView!
    @IBOutlet weak var challengeView: UIView!
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
        self.loadQuestion()
        // Do any additional setup after loading the view.
        if (selectedGameMode == GameMode.Challenge) {
            self.configureAsChallengeMode()
        }
        else if (selectedGameMode == GameMode.Classic) {
            self.configureAsClassicMode()
        }
        
        if (questions.count != 0) {
            let question = questions[currentQuestion] as Question!
            self.contentView.addSubview(self.loadContentViewWithQuestion(question))
            self.setUpOptionButtonsWithOptions(question.optionSet.allOptions)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //MARK: - Challenge Mode
    
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
    
    //MARK: - Classic Mode
    
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
    
    //MARK: - Utility
    
    private func setUpOptionButtonsWithOptions(options:[Option!]) {
        self.option1Button.enabled = true
        self.option2Button.enabled = true
        self.option3Button.enabled = true
        self.option4Button.enabled = true
        self.option1Button.backgroundColor = UIColor.whiteColor()
        self.option2Button.backgroundColor = UIColor.whiteColor()
        self.option3Button.backgroundColor = UIColor.whiteColor()
        self.option4Button.backgroundColor = UIColor.whiteColor()
        self.option1Button.layer.cornerRadius = 9.0
        self.option2Button.layer.cornerRadius = 9.0
        self.option3Button.layer.cornerRadius = 9.0
        self.option4Button.layer.cornerRadius = 9.0
        self.option1Button.setTitle(options[0].stringContent, forState: UIControlState.Normal)
        self.option2Button.setTitle(options[1].stringContent, forState: UIControlState.Normal)
        self.option3Button.setTitle(options[2].stringContent, forState: UIControlState.Normal)
        self.option4Button.setTitle(options[3].stringContent, forState: UIControlState.Normal)
        self.option1Button.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.option2Button.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.option3Button.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.option4Button.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
    }
    
    private func setUpNextQuestion() {
        let question = questions[currentQuestion] as Question
        self.contentView.removeAllSubviews()
        self.contentView.addSubview(self.loadContentViewWithQuestion(question))
        self.setUpOptionButtonsWithOptions(question.optionSet.allOptions)
    }
    
    private func navigateToResultScene() {
        //TODO implement it
    }
    
    private func loadQuestion() {
        
    }
    
    private func playSoundEffect(fileName:String , fileFormat:String) {
        var soundPath = NSBundle.mainBundle().pathForResource(fileName, ofType: fileFormat)
        var soundID: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(NSURL(fileURLWithPath: soundPath!), &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    //MARK: - Load Content View
    
    private func loadContentViewWithQuestion(question:Question!)->UIView {
        if (question.image.length != 0) {
            var nibViews = NSBundle.mainBundle().loadNibNamed("QuestionWithImageView", owner: self, options: nil)
            let questionView = nibViews[0] as QuestionWithImageView
            questionView.textLabel.text = question.content
            questionView.imageView.image = UIImage(data: question.image)
            
            return questionView;
        }

        var nibViews = NSBundle.mainBundle().loadNibNamed("QuestionWithoutImageView", owner: self, options: nil)
        let questionView = nibViews[0] as QuestionWithoutImageView
        questionView.textLabel.text = question.content
        
        return questionView
    }
    
    //MARK : Selct Option Action
    
    @IBAction func selectOption(sender: UIButton) {
        self.option1Button.enabled = false
        self.option2Button.enabled = false
        self.option3Button.enabled = false
        self.option4Button.enabled = false
        
        let question = questions[currentQuestion] as Question!
        var options = question.optionSet
        
        var correctColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1.0)
        var wrongColor = UIColor(red: 1.0, green: 106/255, blue: 110/255, alpha: 1.0)
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        if (sender.titleLabel?.text == options.correctOption.stringContent) {
            sender.backgroundColor = correctColor
            correctAnswers++
            
            if(appDelegate.isSoundEffectOn)
            {
                self.playSoundEffect("Ka-Ching", fileFormat: "wav")
            }
            
        }
        else {
            sender.backgroundColor = wrongColor
            if(appDelegate.isSoundEffectOn)
            {
                 self.playSoundEffect("Comedy Wap", fileFormat: "caf")
            }
            
            switch(options.correctOption.stringContent) {
                case self.option1Button.titleLabel?.text! :
                    self.option1Button.backgroundColor = correctColor
                
                case self.option2Button.titleLabel?.text :
                    self.option2Button.backgroundColor = correctColor
                
                case self.option3Button.titleLabel?.text :
                    self.option3Button.backgroundColor = correctColor
                
                case self.option4Button.titleLabel?.text :
                    self.option4Button.backgroundColor = correctColor
                
                default: println("There are no correct text. Please debug it.")
            }
            
            self.minusLifeOnClassicMode()
        }
        
        currentQuestion++
        
        NSTimer(timeInterval: 0.5, target: self, selector: "finishSelectedAnswer:", userInfo: nil, repeats: false)
    }
    
    private func finishSelectedAnswer(sender:NSTimer!) {
        if( self.questions.count > currentQuestion) {
            UIView.animateWithDuration(0.5, animations: {
                self.setUpNextQuestion()
            })
        }
    }

}

