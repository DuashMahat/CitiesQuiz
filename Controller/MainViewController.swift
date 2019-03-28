//
//  MainViewController.swift
//  CitiesQuiz
//
//  Created by Duale on 3/13/19.
//  Copyright © 2019 Duale. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var citiesImage: UIImageView!
    //Place your instance variables here
    @IBOutlet weak var textLableFun: UILabel!
    @IBOutlet weak var onClickOne: UIButton!
    @IBOutlet weak var onClickTwo: UIButton!
    @IBOutlet weak var MidLabel: UILabel!
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
        
        
//        progressLabel.text = String(Score) + "/28"
//        textField.text = allQuestions.list[questionNumber].fun
        //        progressBar.frame.size.width = (view.frame.size.width / 14) * CGFloat(questionNumber)
        nextQuestion()
        progressBarColor()
        midQuessesScore()
        updateCities()
        questionLabelText()
    }
    
    
    @IBAction func onPressedButtonBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func nextQuestion() {
        if (questionNumber <= 27 ) {
            questionLabel.text = allQuestions.list[questionNumber].city

            
            //              FunLabel.text = allQuestions.list[questionNumber].fun
        } else {
            let alert = UIAlertController(title: "Game Over",
                                          message: "Congratulations! Score = \(Score) / \(28)", preferredStyle: .alert)
            
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
//             textLableFun.text = allQuestions.list[questionNumber].fun
             allQuestions.list.shuffle()
            
        } else {
            let alert = UIAlertController(title: "Wrong",
                                          message: "\(allQuestions.list[questionNumber].city) guess is not right. Score = \(Score) / \(28) ", preferredStyle: .alert)
            
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
        
        if (Score <= 14 ) {
            scoreLabel.textColor = UIColor.red
//            progressLabel.textColor = UIColor.red
            
        }
       else {
            scoreLabel.textColor = UIColor.green
//            progressLabel.textColor = UIColor.green
        }
    }
    
    func midQuessesScore() {
        if ( Score == 14 )  {
            
                let alert = UIAlertController(title: "Wow",
                                              message: "You are halfway", preferredStyle: .alert)
                
                let restartAction = UIAlertAction(title: "Continue", style: .default, handler: { UIAlertAction in
                    self.nextQuestion()
                })
                
                alert.addAction(restartAction)
                
                present(alert, animated: true, completion: nil)
            
            
        }
    }
    
    func updateCities () {
        if (questionLabel.text == "Sydney") {
            citiesImage.image = UIImage(named: "sydney")
        } else if (questionLabel.text == "Nairobi" ) {
            citiesImage.image = UIImage(named: "nairobi")
        } else if (questionLabel.text == "New York") {
            citiesImage.image = UIImage(named: "newyork")
        }
        else if (questionLabel.text == "Addis Ababa") {
            citiesImage.image = UIImage(named: "addis")
        }
        else if (questionLabel.text == "London") {
            citiesImage.image = UIImage(named: "london")
        }
        else if (questionLabel.text == "Djibouti") {
            citiesImage.image = UIImage(named: "djib")
        }else if (questionLabel.text == "Barcelona") {
            citiesImage.image = UIImage(named: "barcelona")
        }
        else if (questionLabel.text == "Mogadishu") {
            citiesImage.image = UIImage(named: "mogadishu")
        }else if (questionLabel.text == "Toronto") {
            citiesImage.image = UIImage(named: "toronto")
        }
        else if (questionLabel.text == "Munich") {
            citiesImage.image = UIImage(named: "munich")
        }
        else if (questionLabel.text == "Rome") {
            citiesImage.image = UIImage(named: "rome")
        }
        else if (questionLabel.text == "Zagreb") {
            citiesImage.image = UIImage(named: "zaqreb")
        }else if (questionLabel.text == "Dubai") {
            citiesImage.image = UIImage(named: "dubai")
        }
        else if (questionLabel.text == "Kampala") {
            citiesImage.image = UIImage(named: "kampala")
        }else if (questionLabel.text == "Zurich") {
            citiesImage.image = UIImage(named: "zurich")
        }
        else if (questionLabel.text == "Montreal") {
            citiesImage.image = UIImage(named: "montreal")
        }
        else if (questionLabel.text == "Dresden") {
            citiesImage.image = UIImage(named: "dresden")
        }
        else if (questionLabel.text == "Bamako") {
            citiesImage.image = UIImage(named: "bamako")
        }else if (questionLabel.text == "Shanghai") {
            citiesImage.image = UIImage(named: "shanghai")
        }
        else if (questionLabel.text == "Paris") {
            citiesImage.image = UIImage(named: "paris")
        }else if (questionLabel.text == "Munich") {
            citiesImage.image = UIImage(named: "munich")
        }
        else if (questionLabel.text == "Manila") {
            citiesImage.image = UIImage(named: "manila")
        }
        else if (questionLabel.text == "Bangkok") {
            citiesImage.image = UIImage(named: "bank")
        }else if (questionLabel.text == "Algiers") {
            citiesImage.image = UIImage(named: "algiers")
        }
        else if (questionLabel.text == "Lagos") {
            citiesImage.image = UIImage(named: "lagos")
        }
        else if (questionLabel.text == "Berlin") {
            citiesImage.image = UIImage(named: "berlin")
        }else if (questionLabel.text == "Cairo") {
            citiesImage.image = UIImage(named: "cairo")
        }
        else if (questionLabel.text == "Lisbon") {
            citiesImage.image = UIImage(named: "lisbon")
        }else if (questionLabel.text == "Johanesburg") {
            citiesImage.image = UIImage(named: "johan")
        }
        else {
            citiesImage.image = UIImage(named: "")
        }
    }
    
    func questionLabelText () {
     questionLabel.textColor = UIColor.green
    }
    
}
