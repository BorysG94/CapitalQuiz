//
//  QuizModel.swift
//  Capital quiz
//
//  Created by Ola Adamus on 01/05/2023.
//

import Foundation
import SwiftUI

struct Quiz {
    var currentQuestionindex: Int
    var quizModel: QuizModel
    var quizCompleted: Bool = false
    var quizWinnerStatus: Bool = false
  
}


struct QuizModel {
    var question: String
    var answer: String
    var ListOfOption: [QuizOption]
}


struct QuizOption : Identifiable {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected: Bool = false
    var isMatched: Bool = false
}
