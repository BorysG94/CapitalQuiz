//
//  GameManagerVM.swift
//  Capital quiz
//
//  Created by Ola Adamus on 04/05/2023.
//

import Foundation
import SwiftUI
//its need to be Observabable that view  can subscribe from this file
class GameManagerVM: ObservableObject {
    
    static var currentIndex = 0 //if user will click correct answer it will automatically pass to next question
    
    static func createGameModel(i:Int) -> Quiz {
        return Quiz(currentQuestionindex: i, quizModel: quizData[i])
    }
    //also ViewModel need to have Publsihed to be observabale adn get subsricbed
    @Published var model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
    
    
    var timer = Timer()
    var maxProgress = 20
    @Published var progress = 0
    
    init() {
        self.start()
    }
    
    
    
    
    func verifyAnswer(selectedOption: QuizOption) {
        for index in model.quizModel.ListOfOption.indices {
            model.quizModel.ListOfOption[index].isMatched = false
            model.quizModel.ListOfOption[index].isSelected = false
        }
        
        if let index = model.quizModel.ListOfOption.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId == model.quizModel.answer {
                model.quizModel.ListOfOption[index].isMatched = true
                model.quizModel.ListOfOption[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (GameManagerVM.currentIndex  < 10) {
                        GameManagerVM.currentIndex = GameManagerVM.currentIndex + 1
                        self.model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
                    } else {
                        self.model.quizCompleted = true
                        self.model.quizWinnerStatus =  true
                        self.reset()
                    }
                }
            } else {
                model.quizModel.ListOfOption[index].isMatched = false
                model.quizModel.ListOfOption[index].isSelected = true
                
            }
        }
    }
    
    func restartGame() {
        GameManagerVM.currentIndex = 0
        model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizCompleted = true
                self.model.quizWinnerStatus = false
                self.reset()
            } else {
                self.progress += 1
        }
     })
  }
    
    func reset() {
        timer.invalidate()
        self.progress = 0
    }
}
                                     
extension GameManagerVM
{
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "What is the capital of Spain?",
                      answer: "C",
                      ListOfOption: [QuizOption(id: 1, optionId: "A", option: "Lisbon", color: Color.yellow),
                                     QuizOption(id: 2, optionId: "B", option: "Rome", color: Color.green),
                                     QuizOption(id: 3, optionId: "C", option: "Madrid", color: Color.red),
                                     QuizOption(id: 4, optionId: "D", option: "Paris", color: Color.purple)]),
            
            
            QuizModel(question: "What is the capital of Italy?",
                      answer: "B",
                      ListOfOption: [QuizOption(id: 5, optionId: "A", option: "Brussels", color: Color.yellow),
                                     QuizOption(id: 6, optionId: "B", option: "Rome", color: Color.red),
                                     QuizOption(id: 7, optionId: "C", option: "Vienna", color: Color.green),
                                     QuizOption(id: 8, optionId: "D", option: "Dublin", color: Color.purple)]),
            
            
            QuizModel(question: "What is the capital of Germany?",
                      answer: "A",
                      ListOfOption: [QuizOption(id: 9, optionId: "A", option: "Berlin", color: Color.red),
                                     QuizOption(id: 10, optionId: "B", option: "Amsterdam", color: Color.yellow),
                                     QuizOption(id: 11, optionId: "C", option: "Copenhagen", color: Color.green),
                                     QuizOption(id: 12, optionId: "D", option: "Bern", color: Color.purple)]),
            
            
            QuizModel(question: "What is the capital of France?",
                      answer: "D",
                      ListOfOption: [QuizOption(id: 13, optionId: "A", option: "Oslo", color: Color.yellow),
                                     QuizOption(id: 14, optionId: "B", option: "Helsinki", color: Color.green),
                                     QuizOption(id: 15, optionId: "C", option: "Stockholm", color: Color.purple),
                                     QuizOption(id: 16, optionId: "D", option: "Paris", color: Color.red)]),
            
            
            QuizModel(question: "What is the capital of Portugal?",
                      answer: "A",
                      ListOfOption: [QuizOption(id: 17, optionId: "A", option: "Lisbon", color: Color.red),
                                     QuizOption(id: 18, optionId: "B", option: "Rome", color: Color.yellow),
                                     QuizOption(id: 19, optionId: "C", option: "Madrid", color: Color.green),
                                     QuizOption(id: 20, optionId: "D", option: "Athens", color: Color.purple)]),
            
            QuizModel(question: "What is the capital of Belgium?",
                      answer: "C",
                      ListOfOption: [QuizOption(id: 21, optionId: "A", option: "Amsterdam", color: .yellow),
                                     QuizOption(id: 22, optionId: "B", option: "Paris", color: .red),
                                     QuizOption(id: 23, optionId: "C", option: "Brussels", color: .green),
                                     QuizOption(id: 24, optionId: "D", option: "Copenhagen", color: .purple)
                                    ]),
            
            
            QuizModel(question: "What is the capital of Albania?",
                      answer: "A",
                      ListOfOption: [QuizOption(id: 25, optionId: "A", option: "Tirana", color: .yellow),
                                     QuizOption(id: 26, optionId: "B", option: "Skopje", color: .red),
                                     QuizOption(id: 27, optionId: "C", option: "Riga", color: .green),
                                     QuizOption(id: 28, optionId: "D", option: "Tallinn", color: .purple)
                      ]),
            QuizModel(question: "What is the capital of Macedonia?",
                      answer: "B",
                      ListOfOption: [QuizOption(id: 29, optionId: "A", option: "Podgorica", color: .yellow),
                                     QuizOption(id: 30, optionId: "B", option: "Skopje", color: .red),
                                     QuizOption(id: 31, optionId: "C", option: "Vilnius", color: .green),
                                     QuizOption(id: 32, optionId: "D", option: "Riga", color: .purple)
                      ]),
            QuizModel(question: "What is the capital of Lithuania?",
                      answer: "C",
                      ListOfOption: [QuizOption(id: 33, optionId: "A", option: "Tallinn", color: .yellow),
                                     QuizOption(id: 34, optionId: "B", option: "Riga", color: .red),
                                     QuizOption(id: 35, optionId: "C", option: "Vilnius", color: .green),
                                     QuizOption(id: 36, optionId: "D", option: "Tirana", color: .purple)
                      ]),
            QuizModel(question: "What is the capital of Latvia?",
                      answer: "B",
                      ListOfOption: [QuizOption(id: 37, optionId: "A", option: "Tirana", color: .yellow),
                                     QuizOption(id: 38, optionId: "B", option: "Riga", color: .red),
                                     QuizOption(id: 39, optionId: "C", option: "Tallinn", color: .green),
                                     QuizOption(id: 40, optionId: "D", option: "Skopje", color: .purple)
                      ]),
            QuizModel(question: "What is the capital of Estonia?",
                      answer: "A",
                      ListOfOption: [QuizOption(id: 41, optionId: "A", option: "Tallinn", color: .yellow),
                                     QuizOption(id: 42, optionId: "B", option: "Riga", color: .red),
                                     QuizOption(id: 43, optionId: "C", option: "Vilnius", color: .green),
                                     QuizOption(id: 44, optionId: "D", option: "Podgorica", color: .purple)
                      ]),
            
            
            
            
        ]
    }
}
