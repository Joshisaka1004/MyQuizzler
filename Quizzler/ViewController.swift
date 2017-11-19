//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    var myQuestions = QuestionBank()
    var questionNumber = 0
    var userAnswer: Bool?
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        nextQuestion()
        print(myQuestions.list.count)
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            userAnswer = true
        } else {
            userAnswer = false
        }
        checkAnswer()
    }
    
    
    func updateUI() {
        progressBar.frame.size.width = (view.frame.size.width / 15) * CGFloat(questionNumber + 1)
        progressLabel.text = "\(questionNumber + 1) / 15"
        scoreLabel.text = "Score: \(score)"
        nextQuestion()
    }
    

    func nextQuestion() {
        questionLabel.text = myQuestions.list[questionNumber].questionText
    }
    
    
    func checkAnswer() {
        if userAnswer == myQuestions.list[questionNumber].answer {
            ProgressHUD.showSuccess("Super!")
            score += 1
            if questionNumber < 14 {
                questionNumber += 1
                updateUI()
            } else {
                questionNumber = 0
                startOver()
            }
            
        } else {
            ProgressHUD.showError("Leider falsch!")
            score -= 2
            updateUI()
        }
    }
    
    
    func startOver() {
        score = 0
        let myAC = UIAlertController(title: "Ende", message: "Neue Runde gefällig?", preferredStyle: .alert)
        let myAction = UIAlertAction(title: "OK", style: .default, handler: {
            (UIAlertAction) in self.updateUI()
        })
        myAC.addAction(myAction)
        present(myAC, animated: true)
    }
    
}
