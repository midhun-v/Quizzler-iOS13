//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Midhun V on 04/05/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let questions = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(answer userAnswer: String) -> Bool {
        if userAnswer == questions[questionNumber].correctAnswer {
            score+=1
            return true
        }
        else{
            return false
        }
    }
    
    func getQuestionText () -> String {
        return questions[questionNumber].q
    }
    
    func getChoice1() -> String {
        return questions[questionNumber].a[0]
    }
    
    func getChoice2() -> String {
        return questions[questionNumber].a[1]
    }
    
    func getChoice3() -> String {
        return questions[questionNumber].a[2]
    }
    
    func getProgress () -> Float{
        return Float(questionNumber+1)/Float(questions.count)
    }
    
    mutating func questionCount() {
        if ((questions.count-1) > questionNumber) {
            questionNumber += 1
        }
        else if ((questions.count-1) == questionNumber) {
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> String {
        return "Score : \(score) / \(questions.count)"
    }
    
}


