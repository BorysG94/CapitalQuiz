//
//  AnswersGridView.swift
//  Capital quiz
//
//  Created by Ola Adamus on 04/05/2023.
//

import Foundation
import SwiftUI

struct AnswersGridView: View {
    var gameManagerVM: GameManagerVM
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 20), count: 2)
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(gameManagerVM.model.quizModel.ListOfOption) { quizOption in
                AnswersCardView(quizOption: quizOption)
                    .onTapGesture {
                        gameManagerVM.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }
    }
}
struct AnswersCardView: View {
    var quizOption: QuizOption
    var body: some View {
        VStack {
            if (quizOption.isMatched) && (quizOption.isSelected) {
                OptionStatusImageView(imageName: "checkmark.seal") // if left site equal right side we show image "checkmark"
            } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
                OptionStatusImageView(imageName: "xmark.seal")
            } else {
                OptionView(quizOption: quizOption)
            }
        }.frame(width:150, height:150)
            .background(setBackgroundColor())
            .cornerRadius(40)
    }
    
    func setBackgroundColor() ->  Color {
        if(quizOption.isMatched) && (quizOption.isSelected) {
            return Color.green
        } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
            return Color.red
        } else {
            return Color.white
        }
    }
}
        
struct  OptionView: View {
    var quizOption: QuizOption
    var body: some View {
        VStack {
            Text(quizOption.option)
                .frame(width: 150, height: 30)
                .font(.system(size: 26, weight: .bold, design: .rounded))
            
            ZStack { // zstack is doin what is 
                Circle()
                    .foregroundColor(quizOption.color)
                    .frame(width: 60, height: 60)
                Text(quizOption.optionId) // it pass text from optionid
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .frame(width: 50, height: 50)
                    .backgroundStyle(quizOption.color)
                    .foregroundColor(Color.white)
                    .cornerRadius(25)
            }
        }
    }
}
        struct OptionStatusImageView: View {
            var imageName: String
            var body: some View {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            }
        }
    
