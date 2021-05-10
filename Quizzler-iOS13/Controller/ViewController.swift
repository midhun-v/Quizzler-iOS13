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
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
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
        choice1.setTitle(quizBrain.getChoice1(), for: .normal)
        choice2.setTitle(quizBrain.getChoice2(), for: .normal)
        choice3.setTitle(quizBrain.getChoice3(), for: .normal)
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = quizBrain.getScore()
    }
    
    
}

