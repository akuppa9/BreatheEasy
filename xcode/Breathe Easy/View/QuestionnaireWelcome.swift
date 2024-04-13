//
//  QuestionnaireWelcome.swift
//  Breathe Easy
//
//  Created by Nikhil Kumar on 4/13/24.
//

import SwiftUI

struct QuestionnaireWelcome: View {
    @AppStorage("progressPage") var progressPage = 0
    var body: some View {
        ZStack() {
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(519)
                    .offset(x: -130, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(508)
                    .offset(x: -43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(493)
                    .offset(x: 43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(484)
                    .offset(x: 130, y: 0)
            }
            .frame(width: 342, height: 6)
            .offset(x: 0.50, y: -363)
            ZStack() {
                Text("Welcome")
                    .font(Font.custom("Lufga", size: 30))
                    .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                    .offset(x: 0.50, y: -18)
                Text("Answer a few questions to help us\npersonalize your experience.")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: 0, y: 21.50)
                    .multilineTextAlignment(.center)
            }
            .offset(x: 0, y: -32.50)
            Button(action: cont){
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 320, height: 50)
                        .background(Color(red: 0, green: 0.32, blue: 0.27))
                        .cornerRadius(34)
                        .offset(x: 0, y: 0)
                    Text("Continue")
                        .font(Font.custom("Lufga", size: 18))
                        .foregroundColor(Color(red: 0.70, green: 0.95, blue: 0))
                        .offset(x: 0, y: 0.50)
                }
            }
            .frame(width: 1000, height: 1500)
            .offset(x: 0.50, y: 328)
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func cont(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            progressPage = 1
        }
    }
}

#Preview {
    QuestionnaireWelcome()
}
