//
//  GenderView.swift
//  BreatheEasyFigma
//
//  Created by Nikhil Kumar on 3/11/24.
//

import SwiftUI

struct GenderView: View {
    var body: some View {
        ZStack() {
            Text("What’s your gender?")
                .font(Font.custom("Lufga", size: 24))
                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                .offset(x: 0.50, y: -240.50)
            Text("Pick which best describes you.")
                .font(Font.custom("Aeonik TRIAL", size: 14))
                .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                .offset(x: 0.50, y: -213)
            
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(519)
                    .offset(x: -130, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
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
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 320, height: 50)
                    .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .cornerRadius(34)
                    .offset(x: 0, y: 0)
                Text("Male")
                    .font(Font.custom("Lufga", size: 18))
                    .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                    .offset(x: -100.50, y: 0.50)
                Ellipse()
                    .foregroundColor(.clear)
                    .frame(width: 16, height: 16)
                    .overlay(
                        Ellipse()
                            .inset(by: 0.75)
                            .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                    )
                    .offset(x: 127, y: 0)
            }
            .frame(width: 320, height: 50)
            .offset(x: 0.50, y: -128)
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 320, height: 50)
                    .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .cornerRadius(34)
                    .offset(x: 0, y: 0)
                Ellipse()
                    .foregroundColor(.clear)
                    .frame(width: 16, height: 16)
                    .overlay(
                        Ellipse()
                            .inset(by: 0.75)
                            .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                    )
                    .offset(x: 127, y: 0)
                Text("Female")
                    .font(Font.custom("Lufga", size: 18))
                    .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                    .offset(x: -89.50, y: 0.50)
            }
            .frame(width: 320, height: 50)
            .offset(x: 0.50, y: -62)
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 320, height: 50)
                    .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .cornerRadius(34)
                    .offset(x: 0, y: 0)
                Ellipse()
                    .foregroundColor(.clear)
                    .frame(width: 16, height: 16)
                    .overlay(
                        Ellipse()
                            .inset(by: 0.75)
                            .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                    )
                    .offset(x: 127, y: 0)
                Text("Non-binary")
                    .font(Font.custom("Lufga", size: 18))
                    .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                    .offset(x: -72.50, y: 0.50)
            }
            .frame(width: 320, height: 50)
            .offset(x: 0.50, y: 4)
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
            .frame(width: 320, height: 50)
            .offset(x: 0.50, y: 327)
        }
        .frame(width: 375, height: 812)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
}

struct GenderSelected: View {
    @AppStorage("progressPage") var progressPage = 0
    @AppStorage("sex") var sex: String = ""
    @AppStorage("genderSelected")
    var genderSelected = 0
    @State private var showAlertGender = false
    var body: some View {
        ZStack() {
            Text("What’s your gender?")
                .font(Font.custom("Lufga", size: 24))
                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                .offset(x: 0.50, y: -240.50)
            Text("Pick which best describes you.")
                .font(Font.custom("Aeonik TRIAL", size: 14))
                .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                .offset(x: 0.50, y: -213)
            
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(519)
                    .offset(x: -130, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
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
            
            if (genderSelected == 0){
                // Male Button
                Button(action: malePress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .offset(x: 0, y: 0)
                        Text("Male")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -100.50, y: 0.50)
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 16, height: 16)
                            .overlay(
                                Ellipse()
                                    .inset(by: 0.75)
                                    .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                            )
                            .offset(x: 127, y: 0)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: -128)
                
                // Female button
                Button(action:femalePress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .offset(x: 0, y: 0)
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 16, height: 16)
                            .overlay(
                                Ellipse()
                                    .inset(by: 0.75)
                                    .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                            )
                            .offset(x: 127, y: 0)
                        Text("Female")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -89.50, y: 0.50)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: -62)
                
                // Non-binary button
                Button(action:nonBinaryPress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .offset(x: 0, y: 0)
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 16, height: 16)
                            .overlay(
                                Ellipse()
                                    .inset(by: 0.75)
                                    .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                            )
                            .offset(x: 127, y: 0)
                        Text("Non-binary")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -72.50, y: 0.50)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: 4)
            } else if (genderSelected == 1){
                // Male Button
                Button(action: malePress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .overlay(
                                RoundedRectangle(cornerRadius: 34)
                                    .inset(by: 0.50)
                                    .stroke(Color(red: 0, green: 0.32, blue: 0.27), lineWidth: 0.50)
                            )
                            .offset(x: 0, y: 0)
                        Text("Male")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -100.50, y: 0.50)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 19.50, height: 19.50)
                            .background(
                                Image("GreenCheck").resizable()
                                    .aspectRatio(contentMode: .fit)
                            )
                            .offset(x: 126.75, y: -0.25)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: -128)
                
                // Female button
                Button(action:femalePress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .offset(x: 0, y: 0)
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 16, height: 16)
                            .overlay(
                                Ellipse()
                                    .inset(by: 0.75)
                                    .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                            )
                            .offset(x: 127, y: 0)
                        Text("Female")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -89.50, y: 0.50)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: -62)
                
                // Non-binary button
                Button(action:nonBinaryPress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .offset(x: 0, y: 0)
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 16, height: 16)
                            .overlay(
                                Ellipse()
                                    .inset(by: 0.75)
                                    .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                            )
                            .offset(x: 127, y: 0)
                        Text("Non-binary")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -72.50, y: 0.50)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: 4)
            } else if (genderSelected == 2){
                // Male Button
                Button(action: malePress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .offset(x: 0, y: 0)
                        Text("Male")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -100.50, y: 0.50)
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 16, height: 16)
                            .overlay(
                                Ellipse()
                                    .inset(by: 0.75)
                                    .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                            )
                            .offset(x: 127, y: 0)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: -128)
                
                // Female button
                Button(action:femalePress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .overlay(
                                RoundedRectangle(cornerRadius: 34)
                                    .inset(by: 0.50)
                                    .stroke(Color(red: 0, green: 0.32, blue: 0.27), lineWidth: 0.50)
                            )
                            .offset(x: 0, y: 0)
                        Text("Female")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -89.50, y: 0.50)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 19.50, height: 19.50)
                            .background(
                                Image("GreenCheck").resizable()
                                    .aspectRatio(contentMode: .fit)
                            )
                            .offset(x: 126.75, y: -0.25)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: -62)
                
                // Non-binary button
                Button(action:nonBinaryPress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .offset(x: 0, y: 0)
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 16, height: 16)
                            .overlay(
                                Ellipse()
                                    .inset(by: 0.75)
                                    .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                            )
                            .offset(x: 127, y: 0)
                        Text("Non-binary")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -72.50, y: 0.50)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: 4)
            } else{
                // Male Button
                Button(action: malePress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .offset(x: 0, y: 0)
                        Text("Male")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -100.50, y: 0.50)
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 16, height: 16)
                            .overlay(
                                Ellipse()
                                    .inset(by: 0.75)
                                    .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                            )
                            .offset(x: 127, y: 0)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: -128)
                
                // Female button
                Button(action:femalePress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .offset(x: 0, y: 0)
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 16, height: 16)
                            .overlay(
                                Ellipse()
                                    .inset(by: 0.75)
                                    .stroke(Color(red: 0.72, green: 0.72, blue: 0.72), lineWidth: 0.75)
                            )
                            .offset(x: 127, y: 0)
                        Text("Female")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -89.50, y: 0.50)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: -62)
                
                // Non-binary button
                Button(action:nonBinaryPress){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 50)
                            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .cornerRadius(34)
                            .overlay(
                                RoundedRectangle(cornerRadius: 34)
                                    .inset(by: 0.50)
                                    .stroke(Color(red: 0, green: 0.32, blue: 0.27), lineWidth: 0.50)
                            )
                            .offset(x: 0, y: 0)
                        Text("Non-binary")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -72.50, y: 0.50)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 19.50, height: 19.50)
                            .background(
                                Image("GreenCheck").resizable()
                                    .aspectRatio(contentMode: .fit)
                            )
                            .offset(x: 126.75, y: -0.25)
                    }
                }
                .frame(width: 320, height: 50)
                .offset(x: 0.50, y: 4)
            }
            
            // Continue button
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
            .frame(width: 320, height: 50)
            .offset(x: 0.50, y: 327)
            .alert(isPresented: $showAlertGender) {
                Alert(
                    title: Text("Incomplete Information"),
                    message: Text("Please fill out this field"),
                    dismissButton: .default(Text("OK")) {
                        showAlertGender = false
                    }
                )
            }
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func cont(){
        if genderSelected == 0{
            showAlertGender = true
        } else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                progressPage = 3
            }
            genderSelected = 0
        }
    }
    
    func malePress(){
        guard genderSelected != 1 else { return }
        sex = "Male"
        genderSelected = 1
    }
    
    func femalePress(){
        guard genderSelected != 2 else { return }
        sex = "Female"
        genderSelected = 2
    }
    
    func nonBinaryPress(){
        guard genderSelected != 3 else { return }
        sex = "Female"
        genderSelected = 3
    }
}

#Preview {
    GenderSelected()
    //    GenderView()
}
