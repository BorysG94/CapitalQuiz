//
//  Capital_quizApp.swift
//  Capital quiz
//
//  Created by Ola Adamus on 01/05/2023.
//

import SwiftUI

@main
struct Capital_quizApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(gameManagerVM: GameManagerVM())
        }
    }
}
