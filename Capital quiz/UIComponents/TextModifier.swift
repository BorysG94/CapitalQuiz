//
//  TextModifier.swift
//  Capital quiz
//
//  Created by Ola Adamus on 04/05/2023.
//

import Foundation
import SwiftUI


// below i created a struct it modify my text so i dont neet to copy all this code i just need to put TextModifier and fill what i want to show its important to conform in Text the (text) and size in size so it will be copy what i write and implement changes

struct TextModifier: View {
    var text: String
    var size: Int
    var body: some View {
        Text(text)
            .font(.system(size: CGFloat(size), weight:.bold))
            .foregroundColor(.white)
            .shadow(color: Color.gray, radius: 2 , x:0, y:3)
            .padding()
    }
}
