//
//  ProfileView.swift
//  Breathe Easy
//
//  Created by Nikhil Kumar on 4/13/24.
//

import SwiftUI

struct Profile: View {
    @Binding var ACTScore: Double
    @Binding var mainViewNum: Int
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
    @AppStorage("genderSelected") var genderSelected = 0
    @AppStorage("progressPage") var progressPage = 0
    @AppStorage("page") var page = 1
    var body: some View {
        ZStack() {
            Button(action: goToSettings){
                Image("BackArrowSettings").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
            .offset(x: -150, y: -340.50)
            
            Group {
                Text("Profile")
                    .font(Font.custom("Lufga", size: 24))
                    .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                    .offset(x: 0, y: -340.50)
                Text("AGE")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: -148.50, y: -256)
                Text("GENDER")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: -134.50, y: -153)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 325, height: 194)
                        .background(.white)
                        .cornerRadius(15)
                        .offset(x: 0, y: 0)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 300, height: 1)
                            .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                            .offset(x: 0, y: -10)
                        ZStack(alignment: .leading) {
                            Text("How often do you work outdoors?")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                .offset(y: -11.50)
                            Text("\(work)")
                                .font(Font.custom("Aeonik TRIAL", size: 14))
                                .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                                .offset(y: 15)
                        }
                        
                        .frame(width: 292, height: 46)
                        .offset(x: 0, y: -54.50)
                        ZStack(alignment: .leading) {
                            Text("How frequently do you\nengage in outdoor activities?")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                .offset(y: -11.50)
                            Text("\(activity)")
                                .font(Font.custom("Aeonik TRIAL", size: 14))
                                .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                                .offset(y: 26.50)
                        }
                        .frame(width: 251, height: 69)
                        .offset(x: -20.50, y: 43)
                    }
                    .frame(width: 300, height: 155)
                    .offset(x: 0.50, y: 0.50)
                }
                .frame(width: 325, height: 194)
                .offset(x: 1, y: 75)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 325, height: 56)
                        .background(.white)
                        .cornerRadius(15)
                        .offset(x: 0, y: 0)
                    ZStack() {
                        Text("\(sliderValue)")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                            .offset(x: 0, y: 0)
                    }
                    .frame(width: 100, height: 100)
                    .offset(x: -132.50, y: 0.50)
                }
                .frame(width: 325, height: 56)
                .offset(x: 1, y: -206)
                Text("QUESTIONNAIRE")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: -108.50, y: -47)
                Button(action:{
                    progressPage = 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        page = 2
                    }
                }) {
                    Text("Edit")
                        .font(Font.custom("Lufga", size: 18))
                        .underline()
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        
                }
                .offset(x: 146.50, y: -341.50)
            }; Group {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 325, height: 56)
                        .background(.white)
                        .cornerRadius(15)
                        .offset(x: 0, y: 0)
                    
                    GeometryReader { geometry in
                        let textWidth = geometry.size.width
                        Text(genderSelected == 3 ? "Non-binary" : "\(sex)")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                            .frame(width: textWidth, alignment: .leading)
                            .offset(x: 18, y: 15)
                    }
                }
                .frame(width: 325, height: 56)
                .offset(x: 1, y: -100)
            }
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func goToSettings(){
        withAnimation{
            mainViewNum = 1
        }
    }
}

struct Profile2: View{
    var body: some View{
        ProgressView()
    }
}

//#Preview {
//    Profile()
////    Profile2().offset(x: 100, y:50)
//}
