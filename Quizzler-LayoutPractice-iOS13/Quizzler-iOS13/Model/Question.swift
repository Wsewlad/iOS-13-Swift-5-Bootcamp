//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by  Vladyslav Fil on 13.04.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let choices: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.choices = a
        self.answer = correctAnswer
    }
 }
