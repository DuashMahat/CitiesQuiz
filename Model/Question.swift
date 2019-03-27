//
//  Question.swift
//  CitiesQuiz
//
//  Created by Duale on 3/13/19.
//  Copyright © 2019 Duale. All rights reserved.
//

import Foundation

class Question {
    
    var city : String
    var answer : Bool
    var fun : String
    init(city : String , answer : Bool , fun : String ) {
        self.city = city
        self.answer = answer
        self.fun = fun
    }
    
}
