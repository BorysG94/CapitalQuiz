//
//  ContentView.swift
//  Capital quiz
//
//  Created by Ola Adamus on 01/05/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameManagerVM: GameManagerVM // here need to be observed
    var body: some View {
        ZStack {
            Image("bb1")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .padding(.trailing, 44.0)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.black.opacity(0.1), .white.opacity(0.2)], startPoint: .center, endPoint: .topTrailing)
                .ignoresSafeArea()
            if (gameManagerVM.model.quizCompleted) {
                QuizCompletedView(gameManagerVM: gameManagerVM  )
            } else {
                VStack {
                    
                    TextModifier(text: "Europe Quiz", size: 40)
                    
                    TextModifier(text: gameManagerVM.model.quizModel.question, size: 24)
                        .lineLimit(3)
                        .frame(width: UIScreen.main.bounds.size.width - 5, height: 20, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 20)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        
                        Circle()
                            .trim(from: 0.0, to: min(CGFloat((Double(gameManagerVM.progress) * Double(gameManagerVM.maxProgress))/250),1.0))
                            .stroke(LinearGradient(colors: [.white, .blue],
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomLeading),
                                    style: StrokeStyle(lineWidth: 20,
                                                       lineCap: .round, lineJoin: .round)
                            )
                            .rotationEffect(Angle (degrees: 270))
                            .animation(Animation.easeIn(duration: Double(gameManagerVM.progress)), value: gameManagerVM.progress)
                        
                        
                        
                        TextModifier(text: String(gameManagerVM.progress), size: 30)
                    }.frame(width: 150, height: 150)
                
                    
                    Spacer()
                    
                    AnswersGridView(gameManagerVM: gameManagerVM)
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(gameManagerVM: GameManagerVM())
        }
    }
}


