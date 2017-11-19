//
//  Question.swift
//  Quizzler
//
//  Created by Joachim Vetter on 19.11.17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import UIKit

class Question {
    let questionText: String
    let answer: Bool
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
