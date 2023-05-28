//
//  QuizCompletedView.swift
//  Capital quiz
//
//  Created by Ola Adamus on 06/05/2023.
//

import Foundation
import SwiftUI


struct QuizCompletedView: View {
    var gameManagerVM: GameManagerVM
    var body: some View {
        VStack {
            Image(systemName: "trophy.fill")
                .foregroundColor(Color.yellow)
                .font(.system(size: 80))
                .padding()
            
            TextModifier(text: gameManagerVM.model.quizWinnerStatus ?
                         "Congratulations!" :
                            "GAME OVER",
                         size: 40)
                .padding()
            TextModifier(text: gameManagerVM.model.quizWinnerStatus ?
                         "Thanks for playing!" :
                            "BETTER LUCK NEXT TIME",
                         size: 30)
                .padding()
            
            Button {
                gameManagerVM.restartGame()
            } label: {
                HStack {
                    Image(systemName: "play.circle.fill")
                        .foregroundColor(Color.white.opacity(0.7))
                        .font(.system(size: 80))
                        .padding()
                        
                
                    Text("Try Again")
                        .font(.system(size: 30))
                        .foregroundColor(.white.opacity(0.7))
                        .cornerRadius(30)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            } .frame(width: 300, height: 80, alignment: .center)
                .backgroundStyle(.white.opacity(0.7))
                .cornerRadius(30)
            
        }
        
    }
}
