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
    @IBOutlet weak var QuestionLabel2: UILabel!
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
        centerAlign()
    }
    
    
    @IBAction func onPressedButtonBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func nextQuestion() {
        if (questionNumber <= 27 ) {
            QuestionLabel2.text = allQuestions.list[questionNumber].city

            
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
        if ( QuestionLabel2.text == "Sydney") {
            citiesImage.image = UIImage(named: "sydney")
        } else if ( QuestionLabel2.text == "Nairobi" ) {
            citiesImage.image = UIImage(named: "nairobi")
        } else if ( QuestionLabel2.text == "New York") {
            citiesImage.image = UIImage(named: "newyork")
        }
        else if ( QuestionLabel2.text == "Addis Ababa") {
            citiesImage.image = UIImage(named: "addis")
        }
        else if ( QuestionLabel2.text == "London") {
            citiesImage.image = UIImage(named: "london")
        }
        else if ( QuestionLabel2.text == "Djibouti") {
            citiesImage.image = UIImage(named: "djib")
        }else if ( QuestionLabel2.text == "Barcelona") {
            citiesImage.image = UIImage(named: "barcelona")
        }
        else if ( QuestionLabel2.text == "Mogadishu") {
            citiesImage.image = UIImage(named: "mogadishu")
        }else if ( QuestionLabel2.text == "Toronto") {
            citiesImage.image = UIImage(named: "toronto")
        }
        else if ( QuestionLabel2.text == "Munich") {
            citiesImage.image = UIImage(named: "munich")
        }
        else if ( QuestionLabel2.text == "Rome") {
            citiesImage.image = UIImage(named: "rome")
        }
        else if ( QuestionLabel2.text == "Zagreb") {
            citiesImage.image = UIImage(named: "zaqreb")
        }else if ( QuestionLabel2.text == "Dubai") {
            citiesImage.image = UIImage(named: "dubai")
        }
        else if ( QuestionLabel2.text == "Kampala") {
            citiesImage.image = UIImage(named: "kampala")
        }else if ( QuestionLabel2.text == "Zurich") {
            citiesImage.image = UIImage(named: "zurich")
        }
        else if ( QuestionLabel2.text == "Montreal") {
            citiesImage.image = UIImage(named: "montreal")
        }
        else if ( QuestionLabel2.text == "Dresden") {
            citiesImage.image = UIImage(named: "dresden")
        }
        else if ( QuestionLabel2.text == "Bamako") {
            citiesImage.image = UIImage(named: "bamako")
        }else if ( QuestionLabel2.text == "Shanghai") {
            citiesImage.image = UIImage(named: "shanghai")
        }
        else if ( QuestionLabel2.text == "Paris") {
            citiesImage.image = UIImage(named: "paris")
        }else if ( QuestionLabel2.text == "Munich") {
            citiesImage.image = UIImage(named: "munich")
        }
        else if ( QuestionLabel2.text == "Manila") {
            citiesImage.image = UIImage(named: "manila")
        }
        else if ( QuestionLabel2.text == "Bangkok") {
            citiesImage.image = UIImage(named: "bank")
        }else if ( QuestionLabel2.text == "Algiers") {
            citiesImage.image = UIImage(named: "algiers")
        }
        else if ( QuestionLabel2.text == "Lagos") {
            citiesImage.image = UIImage(named: "lagos")
        }
        else if ( QuestionLabel2.text == "Berlin") {
            citiesImage.image = UIImage(named: "berlin")
        }else if ( QuestionLabel2.text == "Cairo") {
            citiesImage.image = UIImage(named: "cairo")
        }
        else if ( QuestionLabel2.text == "Lisbon") {
            citiesImage.image = UIImage(named: "lisbon")
        }else if ( QuestionLabel2.text == "Johanesburg") {
            citiesImage.image = UIImage(named: "johan")
        }
        else {
            citiesImage.image = UIImage(named: "")
        }
    }
    
    func questionLabelText () {
     QuestionLabel2.textColor = UIColor.green
    }
    
    func centerAlign() {
        QuestionLabel2.textAlignment = .center
    }
    
}
