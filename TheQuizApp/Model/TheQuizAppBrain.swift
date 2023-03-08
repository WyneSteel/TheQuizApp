//
//  TheQuizAppBrain.swift
//  TheQuizApp
//
//  Created by Wynelher Tagayuna on 3/7/23.
//

import Foundation
import UIKit

struct TheQuizAppBrain{
    var index = 0
    var score = 0//For system ongoing
    var button: UIButton?// The TRUE and FALSE buttons
    
    //Questions and thier correct answers
    let questionsAndAnswers = [Questions(question: "Sharks are mammals.", answer: "FALSE"),Questions(question: "Sea otters have a favorite rock they use to break open food.", answer: "TRUE"),Questions(question: "The blue whale is the biggest animal to have ever lived.", answer: "TRUE"),Questions(question: "The hummingbird egg is the world's smallest bird egg.", answer: "TRUE"),Questions(question: "Pigs roll in the mud because they don’t like being clean.", answer: "FALSE"),Questions(question: "Bats are blind.", answer: "FALSE"),Questions(question: "A dog sweats by panting its tongue.", answer: "FALSE"),Questions(question: "It takes a sloth two weeks to digest a meal.", answer: "TRUE"),Questions(question: "The largest living frog is the Goliath frog of West Africa.", answer: "TRUE"),Questions(question: "An ant can lift 1,000 times its body weight.", answer: "FALSE"),Questions(question: "When exiting a cave, bats always go in the direction of the wind.", answer: "FALSE"),Questions(question: "Galapagos tortoises sleep up to 16 hours a day.", answer: "TRUE"),Questions(question: "An octopus has seven hearts.", answer: "FALSE"),Questions(question: "The goat is the national animal of Scotland.", answer: "FALSE"),Questions(question: "Herbivores are animal eaters.", answer: "FALSE"),Questions(question: "A monkey was the first non-human to go into space.", answer: "FALSE")]
    
    //Get and return question
    mutating func getQuestion() -> String{
        var question = ""
        index += 1
        
        if index <= questionsAndAnswers.count-1{
            question = questionsAndAnswers[index].question
        }else{
            index = 0
            question = questionsAndAnswers[index].question
        }
            
        return question
    }
    
    //Check if answer is correct
    mutating func checkAnswer(_ answer: String){
        if let checkedButton = button{
            if questionsAndAnswers[index].answer == answer{
                score += 1
                //Change color on button press
                checkedButton.backgroundColor = UIColor.systemBlue
                checkedButton.setTitleColor(.white, for: .normal)
            }else{
                //Change color on button press
                checkedButton.backgroundColor = UIColor.systemRed
                checkedButton.setTitleColor(.white, for: .normal)
            }
        }
    }
    
    //Calculate and return progress
    func getProgress() -> Float{
        Float(index+1)/Float(questionsAndAnswers.count)
    }
    
    //Clear color change and revert back to original
    mutating func clearColor(){
        if let checkedButton = button{
            checkedButton.backgroundColor = UIColor.white
            checkedButton.setTitleColor(.systemGreen, for: .normal)
        }
    }
}
