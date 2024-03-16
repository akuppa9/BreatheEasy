//
//  HomeView.swift
//  BreatheEasyFigma
//
//  Created by Nikhil Kumar on 3/11/24.
//

import SwiftUI

struct HomeView2: View {
    @AppStorage("mainViewNum") var mainViewNum = 0
    var body: some View {
            ZStack() {
                Group {
                    ZStack() {
                        Text("Insights")
                            .font(Font.custom("Lufga", size: 30))
                            .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                            .offset(x: -108, y: 0.50)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 42, height: 42)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/42x42"))
                            )
                            .offset(x: 141.50, y: 0)
                    }
                    .offset(x: 0, y: -338)
                    ZStack() { }
                        .frame(width: 0, height: 0)
                        .offset(x: -187.50, y: -406)
                    Text("ACT Score")
                        .font(Font.custom("Lufga", size: 30))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: -87.50, y: 19.50)
                    Text("Predicted Asthma Control Test")
                        .font(Font.custom("Aeonik TRIAL", size: 14))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: -67, y: 56)
                };Group {
                    Text("FAQ")
                        .font(Font.custom("Lufga", size: 30))
                        .foregroundColor(.clear)
                        .offset(x: -133, y: 208.50)
                    Rectangle()
                        .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .frame(width: 375, height: 60)
                        .background(Color(red: 1, green: 1, blue: 1).opacity(0.75))
                        .offset(x: 0, y: 376)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 42, height: 42)
                            .background(
                                Image("HomeHome").resizable()
                                    .aspectRatio(contentMode: .fit)
                            )
                            .offset(x: -100, y: 0)
                        
                        Button(action: goToSettings){
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 42, height: 42)
                                .background(
                                    Image("HomeSettings").resizable()
                                        .aspectRatio(contentMode: .fit)
                                )
                        }
                        .offset(x: 0, y: 0)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 42, height: 42)
                            .background(
                                Image("HomeHelp").resizable()
                                    .aspectRatio(contentMode: .fit)
                            )
                            .offset(x: 100, y: 0)
                    }
                    .frame(height: 42)
                    .offset(x: 0.50, y: 376)
                    ZStack() {
                        ZStack() {
                            ZStack() {
                                ZStack() { }
                                    .frame(width: 287, height: 191)
                                    .offset(x: 8, y: 39.59)
                            }
                            .frame(width: 215, height: 199.82)
                            .offset(x: 0, y: 0)
                        }
                        .frame(width: 215, height: 199.82)
                        .offset(x: 0, y: 0)
                        Image("HomeLung").resizable()
                        Text("25")
                            .font(Font.custom("Lufga", size: 30))
                            .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                            .offset(x: 0.50, y: 120.59)
                    }
                    .frame(width: 215, height: 199.82)
                    .offset(x: 0, y: -153.09)
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

struct HomeView: View {
    @AppStorage("mainViewNum") var mainViewNum = 0
    var body: some View {
        ZStack() {
            Group {
                ZStack() {
                    Text("Insights")
                        .font(Font.custom("Lufga", size: 30))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: -108, y: 0.50)
                    Button(action: goToSettings){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 42, height: 42)
                            .background(
                                Image("HomeSettings").resizable()
                                    .aspectRatio(contentMode: .fit)
                            )
                    }
                    .offset(x: 141.50, y: 0)
                }
                .offset(x: 0, y: -338)
                ZStack() { }
                    .frame(width: 0, height: 0)
                    .offset(x: -187.50, y: -406)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 325, height: 111)
                        .background(Color(red: 0, green: 0.32, blue: 0.27))
                        .cornerRadius(15)
                        .offset(x: 0, y: 0)
                    ZStack() {
                        Text("25")
                            .font(Font.custom("Lufga", size: 30))
                            .foregroundColor(Color(red: 0.70, green: 0.95, blue: 0))
                            .offset(x: -100.50, y: -8.50)
                        Text("Predicted Asthma Control Test Score")
                            .font(Font.custom("Aeonik TRIAL", size: 14))
                            .foregroundColor(Color(red: 0.54, green: 0.73, blue: 0))
                            .offset(x: 0, y: 20)
                    }
                    .frame(width: 235, height: 56)
                    .offset(x: -18, y: -2.50)
                }
                .frame(width: 325, height: 111)
                .offset(x: 0, y: 107.50)
                ZStack() {
                    Text("ACT Score")
                        .font(Font.custom("Lufga", size: 30))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: 0, y: 0)
                }
                .offset(x: -87.50, y: 12.50)
            };Group {
                ZStack() {
                    ZStack() {
                        ZStack() {
                            ZStack() { }
                                .frame(width: 287, height: 191)
                                .offset(x: 8, y: 39.59)
                        }
                        .frame(width: 215, height: 199.82)
                        .offset(x: 0, y: 0)
                    }
                    .frame(width: 215, height: 199.82)
                    .offset(x: 0, y: 0)
                    Text("25")
                        .font(Font.custom("Lufga", size: 30))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: 0.50, y: 6.59)
                }
                .frame(width: 215, height: 199.82)
                .offset(x: 0, y: -153.09)
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

struct MainViewNew: View{
    @AppStorage("mainViewNum") var mainViewNum = 0
    var body: some View{
        ZStack{
            if (mainViewNum == 0){
                HomeView().transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }else{
                SettingsView().transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
        }
        .animation(.default, value: mainViewNum)
    }
}

#Preview {
    MainViewNew()
}
