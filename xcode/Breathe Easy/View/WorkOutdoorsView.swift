//
//  WorkOutdoorsView.swift
//  BreatheEasyFigma
//
//  Created by Nikhil Kumar on 3/11/24.
//

import SwiftUI

struct WorkOutdoorsView: View {
    @AppStorage("progressPage") var progressPage = 0
    @AppStorage("work") var work: String = ""
    @AppStorage("frequencySelected") var frequencySelected = 0
    @State private var showAlertWorkOutdoor = false
    var body: some View {
        ZStack() {
            Text("How often do you\nwork outdoors?")
                .font(Font.custom("Lufga", size: 24))
                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                .offset(x: 0.50, y: -232)
                .multilineTextAlignment(.center)
            
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
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
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
                
                if (frequencySelected == 0){
                    // Frequently button
                    Button(action: freqPress){
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 320, height: 50)
                                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                                .cornerRadius(34)
                                .offset(x: 0, y: 0)
                            Text("Frequently")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -75.50, y: 0.50)
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
                    .offset(x: 0, y: -66)
                    
                    // Occasionally button
                    Button(action: occPress){
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 320, height: 50)
                                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                                .cornerRadius(34)
                                .offset(x: 0, y: 0)
                            Text("Occasionally")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -65.50, y: 0.50)
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
                    .offset(x: 0, y: 0)
                    
                    // Rarely button
                    Button(action: rarePress){
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 320, height: 50)
                                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                                .cornerRadius(34)
                                .offset(x: 0, y: 0)
                            Text("Rarely")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -94.50, y: 0.50)
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
                    .offset(x: 0, y: 66)
                    
                }else if(frequencySelected == 1){
                    // Frequently button
                    Button(action: freqPress){
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
                            Text("Frequently")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -75.50, y: 0.50)
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
                    .offset(x: 0, y: -66)
                    
                    // Occasionally button
                    Button(action: occPress){
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 320, height: 50)
                                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                                .cornerRadius(34)
                                .offset(x: 0, y: 0)
                            Text("Occasionally")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -65.50, y: 0.50)
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
                    .offset(x: 0, y: 0)
                    
                    // Rarely button
                    Button(action: rarePress){
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 320, height: 50)
                                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                                .cornerRadius(34)
                                .offset(x: 0, y: 0)
                            Text("Rarely")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -94.50, y: 0.50)
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
                    .offset(x: 0, y: 66)
                } else if(frequencySelected == 2){
                    // Frequently button
                    Button(action: freqPress){
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 320, height: 50)
                                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                                .cornerRadius(34)
                                .offset(x: 0, y: 0)
                            Text("Frequently")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -75.50, y: 0.50)
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
                    .offset(x: 0, y: -66)
                    
                    // Occasionally button
                    Button(action: occPress){
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
                            Text("Occasionally")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -65.50, y: 0.50)
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
                    .offset(x: 0, y: 0)
                    
                    // Rarely button
                    Button(action: rarePress){
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 320, height: 50)
                                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                                .cornerRadius(34)
                                .offset(x: 0, y: 0)
                            Text("Rarely")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -94.50, y: 0.50)
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
                    .offset(x: 0, y: 66)
                    
                } else{
                    // Frequently button
                    Button(action: freqPress){
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 320, height: 50)
                                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                                .cornerRadius(34)
                                .offset(x: 0, y: 0)
                            Text("Frequently")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -75.50, y: 0.50)
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
                    .offset(x: 0, y: -66)
                    
                    // Occasionally button
                    Button(action: occPress){
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 320, height: 50)
                                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                                .cornerRadius(34)
                                .offset(x: 0, y: 0)
                            Text("Occasionally")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -65.50, y: 0.50)
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
                    .offset(x: 0, y: 0)
                    
                    // Rarely button
                    Button(action: rarePress){
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
                            Text("Rarely")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -94.50, y: 0.50)
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
                    .offset(x: 0, y: 66)
                }
            }
            .frame(width: 320, height: 182)
            .offset(x: 0.50, y: -62)
            
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
            .alert(isPresented: $showAlertWorkOutdoor) {
                Alert(
                    title: Text("Incomplete Information"),
                    message: Text("Please fill out this field"),
                    dismissButton: .default(Text("OK")) {
                        showAlertWorkOutdoor = false
                    }
                )
            }
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func cont(){
        if frequencySelected == 0{
            showAlertWorkOutdoor = true
        } else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                progressPage = 4
            }
            
            frequencySelected = 0
        }
    }
    
    func freqPress(){
        guard frequencySelected != 1 else { return }
        work = "Frequently"
        frequencySelected = 1
    }
    
    func occPress(){
        guard frequencySelected != 2 else { return }
        work = "Occasionally"
        frequencySelected = 2
    }
    
    func rarePress(){
        guard frequencySelected != 3 else { return }
        work = "Rarely"
        frequencySelected = 3
    }
}

#Preview {
    WorkOutdoorsView()
}
