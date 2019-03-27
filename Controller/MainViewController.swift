//
//  MainViewController.swift
//  CitiesQuiz
//
//  Created by Duale on 3/13/19.
//  Copyright © 2019 Duale. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //Place your instance variables here
    @IBOutlet weak var textLableFun: UILabel!
    
    @IBOutlet weak var onClickOne: UIButton!
    @IBOutlet weak var onClickTwo: UIButton!
    
    @IBOutlet weak var FunLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    var questionNumber : Int = 0
    var pickedAnswer : Bool = false
    var Score : Int = 0
    let allQuestions = QuestionList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
//        FunLabel.textAlignment = NSTextAlignment.center
        self.makeCircular(onClickOne)
        self.makeCircular(onClickTwo)
    }
    
    func makeCircular (_ object: AnyObject) {
        if #available(iOS 12.0, *) {
            object.layer.cornerRadius = object.frame.size.width / 2
        } else {
            // Fallback on earlier versions
        }
        object.layer?.masksToBounds = true
        
    }
    
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if ( sender.tag == 1 ) {
            pickedAnswer = true
        } else if (sender.tag == 2 ) {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        updateUI()
    }
    
    @IBOutlet weak var textField: UITextField!
    
    func updateUI() {
        scoreLabel.text = "Score: " + String(Score)
        progressLabel.text = String(Score) + "/14"
//        textField.text = allQuestions.list[questionNumber].fun
        //        progressBar.frame.size.width = (view.frame.size.width / 14) * CGFloat(questionNumber)
        nextQuestion()
        progressBarColor()
    }
    
    
    @IBAction func onPressedButtonBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func nextQuestion() {
        if (questionNumber <= 13 ) {
            questionLabel.text = allQuestions.list[questionNumber].city
           
            
            //              FunLabel.text = allQuestions.list[questionNumber].fun
        } else {
            let alert = UIAlertController(title: "Game Over",
                                          message: "Congratulations! Score = \(Score) / \(14)", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correct = allQuestions.list[questionNumber].answer
        if (pickedAnswer == correct) {
            Score+=1
            ProgressHUD.showSuccess("Correct!")
             textLableFun.text = allQuestions.list[questionNumber].fun
             allQuestions.list.shuffle()
            
        } else {
            let alert = UIAlertController(title: "Wrong",
                                          message: "\(allQuestions.list[questionNumber].city) guess is not right. Score = \(Score) / \(14) ", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            textLableFun.text = ""
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        Score = 0
        updateUI()
    }
    
    func progressBarColor () {
        //        if (Score <= 3 ) {
        //            progressBar.backgroundColor = UIColor.red
        //        } else if (Score >= 4 && Score <= 7 ){
        //            progressBar.backgroundColor = UIColor.lightGray
        //        } else if (Score >= 8  && Score <= 11 ){
        //           progressBar.backgroundColor = UIColor.darkGray
        //        } else {
        //             progressBar.backgroundColor = UIColor.green
        //        }
        
        if (Score <= 7 ) {
            scoreLabel.textColor = UIColor.red
            progressLabel.textColor = UIColor.red
        } else {
            scoreLabel.textColor = UIColor.green
            progressLabel.textColor = UIColor.green
        }
    }
    
    

}
