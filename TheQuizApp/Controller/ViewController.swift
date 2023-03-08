//
//  ViewController.swift
//  TheQuizApp
//
//  Created by Wynelher Tagayuna on 3/6/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!//Question label
    @IBOutlet weak var progressBar: UIProgressView!//Progress
    
    var quizBrain = TheQuizAppBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = quizBrain.questionsAndAnswers[0].question//Display first question
        progressBar.progress = quizBrain.getProgress()//Current progress
    }
    
    @IBAction func trueOrFalseButtons(_ sender: UIButton) {
        quizBrain.button = sender
        quizBrain.checkAnswer(sender.currentTitle!)//Check if answer is correct
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeButtonColor), userInfo: nil, repeats: false)//Delay color change of button
        questionLabel.text = quizBrain.getQuestion()//Get and display question
        progressBar.progress = quizBrain.getProgress()//Current progress
    }
    
    @objc func changeButtonColor(){
        quizBrain.clearColor()//Clear color change and revert back to original
    }
}

