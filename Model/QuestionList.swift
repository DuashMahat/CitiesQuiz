//
//  QuestionList.swift
//  CitiesQuiz
//
//  Created by Duale on 3/13/19.
//  Copyright © 2019 Duale. All rights reserved.
//

import Foundation

import Foundation

class QuestionList {
    var list = [Question]()
    init() {
        
        list.append(Question(city: "Sydney" , answer: false , fun : "Great start. Sydney is Done !"))
        list.append(Question(city: "Nairobi" , answer: true , fun : "You got it ! Nairobi hosts UNEP headquarters "))
        list.append(Question(city: "Zagreb" , answer: true , fun : "What! This is insane "))
        list.append(Question(city: "London" , answer: true , fun : "Amazing!"))
        list.append(Question(city: "New York" , answer: false ,fun : "You are just great"))
        list.append(Question(city: "Toronto" , answer: false,fun : "What the hell!"))
        list.append(Question(city: "Addis Ababa" , answer: true, fun : "How did you do this? "))
        list.append(Question(city: "Rome" , answer: true, fun : "Shiiit !!! "))
        list.append(Question(city: "Barcelona" , answer: false, fun : "Great"))
        list.append(Question(city: "Zurich" , answer: false, fun: "Bro !"))
        list.append(Question(city: "Johanesburg" , answer: false, fun : "Sis you did it ! "))
        list.append(Question(city: "Cairo" , answer: true , fun : "Just two remaining"))
        list.append(Question(city: "Mogadishu" , answer: true, fun : "What the f**c !"))
        list.append(Question(city: "Berlin" , answer: true, fun : "Wow! big respect"))
        
        
    }
}
