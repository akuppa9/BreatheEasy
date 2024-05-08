//
//  ProfileView.swift
//  Breathe Easy
//
//  Created by Nikhil Kumar on 4/13/24.
//

import SwiftUI

struct Profile: View {
    @AppStorage("mainViewNum") var mainViewNum = 0
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
    @AppStorage("genderSelected") var genderSelected = 0
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
                    .frame(width: 20, height: 23)
                    .offset(x: -132.50, y: 0.50)
                }
                .frame(width: 325, height: 56)
                .offset(x: 1, y: -206)
                Text("QUESTIONNAIRE")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: -108.50, y: -47)
                Text("Edit")
                    .font(Font.custom("Lufga", size: 18))
                    .underline()
                    .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                    .offset(x: 146.50, y: -341.50)
            }; Group {
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 325, height: 56)
                        .background(.white)
                        .cornerRadius(15)
                        .offset(x: 0, y: 0)
                    if(genderSelected == 3){
                        Text("Non-binary")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                            .offset(x: -121, y: 0.50)
                    }else{
                        Text("\(sex)")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                            .offset(x: -121, y: 0.50)
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
//            settingsTransition = "fromAbout"
            mainViewNum = 1
        }
    }
}

struct AgeEdit: View{
    @AppStorage("page") var page = 1
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("progressPage") var progressPage = 0
    @State private var showAlertAge = false
    @State private var showAlertAge1 = false
    @State private var numberInput: String = ""
    var body: some View {
        ZStack() {
            
            // Prompt text
            Text("For accurate results,\nwhat’s your age?")
                .font(Font.custom("Lufga", size: 24))
                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                .offset(x: 0, y: -232)
                .multilineTextAlignment(.center)
            
            // Continue Button
            Button (action: save){
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 320, height: 50)
                        .background(Color(red: 0, green: 0.32, blue: 0.27))
                        .cornerRadius(34)
                        .offset(x: 0, y: 0)
                    Text("Save")
                        .font(Font.custom("Lufga", size: 18))
                        .foregroundColor(Color(red: 0.70, green: 0.95, blue: 0))
                        .offset(x: 0, y: 0.50)
                }
            }
            .frame(width: 320, height: 50)
            .offset(x: 0.50, y: 327)
            .alert(isPresented: $showAlertAge) {
                Alert(
                    title: Text("Incomplete Information"),
                    message: Text("Please fill out this field with an age of atleast 12"),
                    dismissButton: .default(Text("OK")) {
                        showAlertAge = false
                    }
                )
            }
            .alert(isPresented: $showAlertAge1) {
                Alert(
                    title: Text("Invalid Information"),
                    message: Text("Must be atleast 12 years old to continue"),
                    dismissButton: .default(Text("OK")) {
                        showAlertAge1 = false
                    }
                )
            }
            
            
            // Type age here
            CustomTextField(placeholder: "Type here", text: $numberInput, fontSize: 30)
                .font(Font.custom("Lufga", size: 30))
                .frame(width: 0, height: 50)
                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23).opacity(0.25))
                .offset(x: -1, y: -96.50)
                .keyboardType(.numberPad)
                .padding()
                .multilineTextAlignment(.center)
            
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func save(){
        sliderValue = Int(numberInput) ?? 0
        if sliderValue == 0{
            showAlertAge = true
        }
        else if sliderValue < 12 && sliderValue != 0{
            showAlertAge1 = true
        }
        else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                progressPage = 2
            }
        }
    }
}

#Preview {
    Profile()
//    AgeEdit()
}
