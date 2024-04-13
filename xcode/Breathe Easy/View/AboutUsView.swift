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
Welcome to Breathe Easy, your personal asthma monitoring assistant. Breathe Easy utilizes Artificial Intelligence in order to monitor asthma control, generating a personalized Asthma Control Test (ACT) score in real time from environmental and physical data. Please read the following text in its entirety, as we will explain exactly how to use the app and how to interpret what you see.

So what is the Asthma Control Test? The Asthma Control Test (ACT) is a questionnaire commonly used by healthcare providers to assess how well a patient's asthma is controlled. The range of scores is between 5 and 25, with a higher score meaning better asthma control. We complete this questionnaire for you constantly using AI, so you do not need to worry about your asthma control and can easily check your score at any time during the day. To have controlled asthma typically means that your symptoms are mitigated and you are at a lower risk of a sudden onset of heightened symptoms or an asthma attack. Being able to easily monitor your score will allow you to be more aware of environmental and physical conditions around you that may lead to higher susceptibility of heightened symptoms.

How does Breathe Easy work and how do I best utilize it? As mentioned earlier, Breathe Easy serves as a tool to monitor asthma control, so you don’t need to worry about how certain environmental and physical factors affect the severity of your symptoms. Whenever a significant change in over 10 parameters is detected, from sudden humidity shifts to a drastic change in elevation, Breathe Easy automatically predicts a new personalized ACT score for you to view in real time. This can provide a valuable insight for you, as you can instantly know when your asthma control changes. To effectively use Breathe Easy, be sure to open the app throughout the day to view your updated score, especially when you notice that the environmental conditions around you have changed. We will notify you throughout the day to remind you as well.

What does my score actually mean? We split the various scores into 3 sub groups, being high, moderate, and low control. You will be able to see what level of control you fall into based on the color of the lung meter. A green meter indicates high control, meaning that the conditions around you put you at low risk of heightened symptoms. Moderate and low control indicate moderate and high risk of heightened symptoms, respectively. However, do not panic if your ACT score is low! This is simply an indicator of how the environment you are in could impact your symptoms, and this certainly does not mean you will have an asthma attack. Interpret your score as a gentle warning, so you can take appropriate actions to put yourself in an environment that keeps your asthma symptoms happy.

You now know everything you need to know to use Breathe Easy! For any clarifications regarding the Asthma Control Test, be sure to refer to the American Lung Association’s website. For any app specific inquiries, email help.breatheeasy@gmail.com. You can now Breathe Easy!
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
