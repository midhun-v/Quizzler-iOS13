//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionFunc()
        progressBar.progress = (1.0 / Float(quizBrain.questions.count))
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let answer = sender.currentTitle!
        let result = quizBrain.checkAnswer(answer: answer)
        
        if result {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
                
        quizBrain.questionCount()
            
        //Delays to execute the function in the time
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(questionFunc), userInfo: nil, repeats: false)

    }
    
    @objc func questionFunc() {
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = quizBrain.getScore()
    }
    
    
}

