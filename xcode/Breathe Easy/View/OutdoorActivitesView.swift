//
//  OutdoorActivitesView.swift
//  BreatheEasyFigma
//
//  Created by Nikhil Kumar on 3/11/24.
//

import SwiftUI
import Firebase

struct OutdoorActivitesView: View {
    @AppStorage("page") var page = 1
    @AppStorage("progressPage") var progressPage = 1
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
    @AppStorage("tracked") var tracked = false
    @State private var showAlertActivityOutdoor = false
    @AppStorage("uid") var uid = ""
    @AppStorage("frequencySelectedActivity") var frequencySelectedActivity = 0
    var body: some View {
        ZStack() {
            Text("How frequently do you\nengage in outdoor activities?")
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
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(484)
                    .offset(x: 130, y: 0)
            }
            .frame(width: 342, height: 6)
            .offset(x: 0.50, y: -363)
            
            Button(action: startTracking){
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 320, height: 50)
                        .background(Color(red: 0, green: 0.32, blue: 0.27))
                        .cornerRadius(34)
                        .offset(x: 0, y: 0)
                    Text("Start Tracking")
                        .font(Font.custom("Lufga", size: 18))
                        .foregroundColor(Color(red: 0.70, green: 0.95, blue: 0))
                        .offset(x: 0.50, y: 0.50)
                }
            }
            .frame(width: 320, height: 50)
            .offset(x: 0.50, y: 327)
            .alert(isPresented: $showAlertActivityOutdoor) {
                Alert(
                    title: Text("Incomplete Information"),
                    message: Text("Please fill out this field"),
                    dismissButton: .default(Text("OK")) {
                        showAlertActivityOutdoor = false
                    }
                )
            }
            
            ZStack() {
                
                if(frequencySelectedActivity == 0){
                    // Frequently button
                    Button(action:freqPress){
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
                    Button(action:occPress){
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
                    Button(action:rarePress){
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
                    
                } else if(frequencySelectedActivity == 1){
                    // Frequently button
                    Button(action:freqPress){
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
                    Button(action:occPress){
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
                    Button(action:rarePress){
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
                } else if(frequencySelectedActivity == 2){
                    // Frequently button
                    Button(action:freqPress){
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
                    Button(action:occPress){
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
                    Button(action:rarePress){
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
                    Button(action:freqPress){
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
                    Button(action:occPress){
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
                    Button(action:rarePress){
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
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func startTracking(){
//        if frequencySelectedActivity == 0{
//            showAlertActivityOutdoor = true
//        } else{
            let db = Firestore.firestore()
            
            let docRef = db.document("users/\(uid)")
            
            let docData: [String: Any] = [
                "age": sliderValue,
                "sex": sex,
                "work": work,
                "activity": activity
            ]
            
            docRef.setData(docData)
//            sex = "";
//            work = "";
//            activity = "";
//            sliderValue = 50;
            
            tracked = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                page = 3
            }
            
            // Schedule the update to happen after a 2-second delay so transition doesn't get messed up
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                frequencySelectedActivity = 0
            }
//        }
    }
    
    func freqPress(){
        guard frequencySelectedActivity != 1 else { return }
        activity = "Frequently"
        frequencySelectedActivity = 1
    }
    
    func occPress(){
        guard frequencySelectedActivity != 2 else { return }
        activity = "Occasionally"
        frequencySelectedActivity = 2
    }
    
    func rarePress(){
        guard frequencySelectedActivity != 3 else { return }
        activity = "Rarely"
        frequencySelectedActivity = 3
    }
}

#Preview {
    OutdoorActivitesView()
}
