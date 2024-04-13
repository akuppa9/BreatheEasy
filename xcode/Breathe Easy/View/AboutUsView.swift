//
//  AboutUsView.swift
//  Breathe Easy
//
//  Created by Nikhil Kumar on 3/23/24.
//

import SwiftUI

struct AboutUsView: View {
    @AppStorage("mainViewNum") var mainViewNum = 0
//    @AppStorage("settingsTransition") var settingsTransition = ""
    var body: some View {
        ZStack() {
            Button(action: goToSettings){
                Image("BackArrowSettings").resizable().aspectRatio(contentMode: .fit) // Maintain the image's aspect ratio
                    .frame(width: 20, height: 20)
            }
            .offset(x: -150, y: -340.50)
            Group {
                Text("About Us")
                    .font(Font.custom("Lufga", size: 24))
                    .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                    .offset(x: 0.50, y: -340.50)
                ZStack() {
                    HStack(spacing: 0) {
                        Image("IconLung").resizable()
                            .aspectRatio(contentMode: .fit).frame(width:90,height:80)
                        
                    }
                    .padding(EdgeInsets(top: 26, leading: 25, bottom: 31, trailing: 25))
                    .frame(width: 128, height: 128)
                    .background(Color(red: 0, green: 0.32, blue: 0.27))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(red: 0.91, green: 0.91, blue: 0.91), lineWidth: 0.50)
                    )
                    .offset(x: 0, y: -39)
                    Text("Breathe Easy")
                        .font(Font.custom("Lufga", size: 24))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: 0, y: 67.50)
                    Text("Version 1.0")
                        .font(Font.custom("Aeonik TRIAL", size: 14))
                        .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                        .offset(x: 0.50, y: 95)
                }
                .frame(width: 154, height: 206)
                .offset(x: 0.50, y: -161)
                Text("ABOUT US")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: -128.50, y: -52)
                Text("DEVELOPMENT TEAM")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: -94, y: 217)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 345, height: 236)
                        .background(.white)
                        .cornerRadius(15)
                        .offset(x: 0, y: 0)
                    ScrollView{
                        Text("""
Welcome to Breathe Easy, your trusted companion in the management of asthma. This documentation serves as an in-app guide to help you maximize the benefits of our application, designed to assist you in monitoring your peak flow and preventing asthma attacks.
                 
Breathe Easy boasts several key features that empower you in managing your asthma effectively. It provides real-time peak flow predictions powered by a machine learning regression model. The app leverages heart rate data from your Apple Watch and takes into account factors such as air quality and temperature to offer personalized insights.
                 
Breathe Easy is designed to deliver timely alerts and notifications, all seamlessly integrated with AWS for machine learning predictions.

To get started with Breathe Easy, simply sign in using your existing account credentials. If you're a new user, you can effortlessly create an account to access all the app's features.

Once you're inside the app, you'll be greeted by a user-friendly home screen displaying your current peak flow prediction and other essential information. You can review your past predictions and health insights in the trends tab. Breathe Easy continuously monitors your heart rate through watchOS data, and additionally measures other relevant factors with Apple’s WeatherKit to provide real-time peak flow predictions. It offers immediate feedback and compares your current peak flow to your maximum predicted value. It will alert you if your peak flow drops significantly, potentially indicating an asthma attack.

You can easily customize your alert thresholds and notification preferences to suit your needs. The app will send timely alerts to your iOS device and Apple Watch, ensuring you're well-informed and can take necessary actions in the event your peak flow is at risk.

Breathe Easy is here to provide you with the tools you need to manage your asthma with confidence and peace of mind. Thank you for choosing Breathe Easy.
""")
                        .font(Font.custom("Aeonik TRIAL", size: 14))
                        .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                        .offset(x: 0.50, y: 0)
                    }
                    .frame(width: 325, height: 216)
                }
                .frame(width: 325, height: 216)
                .offset(x: 0, y: 80)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 325, height: 158)
                        .background(.white)
                        .cornerRadius(15)
                        .offset(x: 0, y: 0)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 300, height: 1)
                            .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                            .offset(x: 0, y: -26.50)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 300, height: 1)
                            .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                            .offset(x: 0, y: 26.50)
                        ZStack() {
                            Text("Amogh")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                .offset(x: -111.50, y: 0)
                            Text("App Developer")
                                .font(Font.custom("Aeonik TRIAL", size: 14))
                                .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                                .offset(x: 96.50, y: 0.50)
                        }
                        .frame(width: 286, height: 23)
                        .offset(x: -4, y: -54.50)
                        ZStack() {
                            Text("App Developer")
                                .font(Font.custom("Aeonik TRIAL", size: 14))
                                .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                                .offset(x: 96.50, y: -26)
                            Text("UI/UX Designer")
                                .font(Font.custom("Aeonik TRIAL", size: 14))
                                .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                                .offset(x: 95.50, y: 27)
                            Text("Nikhil Kumar")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                .offset(x: -89, y: -26.50)
                            Text("Kyara Valdez")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                .offset(x: -86, y: 26.50)
                        }
                        .frame(width: 286, height: 76)
                        .offset(x: -4, y: 28)
                    }
                }
                .frame(width: 325, height: 108)
                .offset(x: 0, y: 319)
            }
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
    }
    
    func goToSettings(){
        withAnimation{
//            settingsTransition = "fromAbout"
            mainViewNum = 1
        }
    }
}

#Preview {
    AboutUsView()
}
