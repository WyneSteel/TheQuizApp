//
//  ViewController.swift
//  TheQuizApp
//
//  Created by Wynelher Tagayuna on 3/6/23.
//

import UIKit

class ChoiceViewController: UIViewController {

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
        if questionLabel.text == "finish"{// When final question is done
            questionLabel.text = quizBrain.questionsAndAnswers[0].question// Reset label to starting question
            performSegue(withIdentifier: "goToScore", sender: self)
        }
    }
    
    @objc func changeButtonColor(){
        quizBrain.clearColor()//Clear color change and revert back to original
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToScore"{
            let destinationVC = segue.destination as! ScoreViewController
            destinationVC.finalScore = String(quizBrain.finalScore)
        }
    }
}

