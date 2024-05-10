//
//  SettingsView.swift
//  BreatheEasyFigma
//
//  Created by Nikhil Kumar on 3/11/24.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct SettingsView: View {
    @AppStorage("page") var page = 1
    @AppStorage("progressPage") var progressPage = 0
    @AppStorage("mainViewNum") var mainViewNum = 0
    @AppStorage("uid") var uid = ""
    @AppStorage("log_Status") var log_Status = false
    @AppStorage("log_Status2") var log_Status2 = false
    @AppStorage("fullname") var fullname = ""
    @State private var showLogoutAlert = false
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
    @AppStorage("tracked") var tracked = false
    @State private var showAlertActivityOutdoor = false
    @AppStorage("frequencySelectedActivity") var frequencySelectedActivity = 0
    @AppStorage("frequencySelected") var frequencySelected = 0
    @AppStorage("genderSelected") var genderSelected = 0
    @AppStorage("fromAbout") var fromAbout = 0
//    @Binding var navigationDirection: NavigationDirection
    var body: some View {
        ZStack() {
            Button(action: goToHome){
                Image("BackArrowSettings").resizable().aspectRatio(contentMode: .fit) // Maintain the image's aspect ratio
                    .frame(width: 20, height: 20)
            }
            .offset(x: -150, y: -340.50)
            Text("Settings")
                .font(Font.custom("Lufga", size: 24))
                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                .offset(x: 0, y: -340.50)
            ZStack() {
                Text("PERSONALIZATION")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: -103, y: -202.50)
                Text("ACCOUNT")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: -129, y: 56.50)
                
                Button(action: goToProfile){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 325, height: 109)
                            .background(.white)
                            .cornerRadius(15)
                            .offset(x: 0, y: 0)
                        ZStack() {
                            ZStack() {
                                Text("Appearance")
                                    .font(Font.custom("Lufga", size: 18))
                                    .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                    .offset(x: -87.50, y: 0)
                                Text("Coming soon").font(Font.custom("Lufga", size: 12))
                                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51)).offset(x:110)
                            }
                            .frame(width: 285, height: 23)
                            .offset(x: -0.50, y: -26.50)
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 300, height: 1)
                                .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                                .offset(x: 0, y: -0.50)
                            
                            ZStack() {
                                Text("Profile")
                                    .font(Font.custom("Lufga", size: 18))
                                    .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                    .offset(x: -115, y: 0)
                                Image("RightArrow").resizable()
                                    .aspectRatio(contentMode: .fit).frame(width:15,height:15).offset(x: 130)
                                
                            }
                            .frame(width: 285, height: 23)
                            .offset(x: -0.50, y: 26.50)
                        }
                        .frame(width: 300, height: 76)
                        .offset(x: 0.50, y: 0.50)
                    }
                }
                .frame(width: 325, height: 109)
                .offset(x: 0.50, y: -126)
                
                Button(action: {
                    showLogoutAlert = true
                }) {
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 325, height: 56)
                            .background(.white)
                            .cornerRadius(15)
                            .offset(x: 0, y: 0)
                        ZStack() {
                            Text("Sign Out")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                .offset(x: -106, y: 0)
                            Image("RightArrow").resizable()
                                .aspectRatio(contentMode: .fit).frame(width:15,height:15).offset(x: 130)
                        }
                        .frame(width: 285, height: 23)
                        .offset(x: 0, y: 0.50)
                    }
                }
                .frame(width: 325, height: 56)
                .offset(x: 0.50, y: 109.50)
                .alert(isPresented: $showLogoutAlert) {
                    Alert(title: Text("Confirmation"),
                          message: Text("Are you sure you want to sign out?"),
                          primaryButton: .destructive(Text("Yes"), action: {
                        logOut()
                    }),
                          secondaryButton: .cancel(Text("No")))
                }
                
                
                ZStack() {
                    Text("INFORMATION")
                        .font(Font.custom("Aeonik TRIAL", size: 14))
                        .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                        .offset(x: -117.50, y: -35)
                    
                    Button(action:goToAbout){
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 325, height: 56)
                                .background(.white)
                                .cornerRadius(15)
                                .offset(x: 0, y: 0)
                            ZStack() {
                                Text("About Us")
                                    .font(Font.custom("Lufga", size: 18))
                                    .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                    .offset(x: -102.50, y: 0)
                                Image("RightArrow").resizable()
                                    .aspectRatio(contentMode: .fit).frame(width:15,height:15).offset(x: 130)
                            }
                            .frame(width: 285, height: 23)
                            .offset(x: 0, y: 0.50)
                        }
                    }
                    .frame(width: 325, height: 56)
                    .offset(x: 0, y: 15)
                }
                .frame(width: 325, height: 86)
                .offset(x: 0.50, y: -11.50)
                
                Button(action:deleteAccount){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 325, height: 56)
                            .background(.white)
                            .cornerRadius(15)
                            .offset(x: 0, y: 0)
                        Text("Delete Account")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0.73, green: 0.15, blue: 0.10))
                            .offset(x: 0, y: -0.50)
                    }
                }
                .frame(width: 325, height: 56)
                .offset(x: 0.50, y: 182.50)
                
            }
            .frame(width: 326, height: 421)
            .offset(x: -0.50, y: -53.50)
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func goToHome(){
        withAnimation{
//            navigationDirection = .backward
            mainViewNum = 0
        }
    }
    
    func goToAbout(){
        withAnimation{
//            navigationDirection = .forward
            mainViewNum = 2
        }
    }
    
    func goToProfile(){
        withAnimation{
            mainViewNum = 3
        }
    }
    
    func deleteAccount(){
        let user = Auth.auth().currentUser
        user?.delete { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Deletion Success")
            }
        }
        
        GIDSignIn.sharedInstance.signOut()
        try? Auth.auth().signOut()
        
        log_Status = false
        log_Status2 = false
        page = 1
        
        let db = Firestore.firestore()
        let documentRef = db.collection("users").document(uid)
        
        documentRef.delete { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
        
        fullname = ""
        sex = ""
        work = ""
        activity = ""
        genderSelected = 0
        sliderValue = 50
        progressPage = 0
        mainViewNum = 0
        frequencySelected = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            frequencySelectedActivity = 0
        }
    }
    
    func logOut(){
        
        if log_Status{
            GIDSignIn.sharedInstance.signOut()
            try? Auth.auth().signOut()
            log_Status = false
            page = 1
            progressPage = 0
            mainViewNum = 0
            
        } else if log_Status2{
            DispatchQueue.global(qos: .background).async {
                
                try? Auth.auth().signOut()
            }
            
            log_Status2 = false
            page = 1
            progressPage = 0
            mainViewNum = 0
        }
        
        fullname = ""
        sex = ""
        work = ""
        activity = ""
        sliderValue = 50
    }
}

struct Settings: View {
    @AppStorage("genderSelected") var genderSelected = 0
    @AppStorage("page") var page = 1
    @AppStorage("progressPage") var progressPage = 0
    @AppStorage("mainViewNum") var mainViewNum = 0
    @AppStorage("uid") var uid = ""
    @AppStorage("log_Status") var log_Status = false
    @AppStorage("log_Status2") var log_Status2 = false
    @AppStorage("fullname") var fullname = ""
    @State private var showLogoutAlert = false
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
    @AppStorage("tracked") var tracked = false
    @State private var showAlertActivityOutdoor = false
    @AppStorage("frequencySelectedActivity") var frequencySelectedActivity = 0
    @AppStorage("fromAbout") var fromAbout = 0
    //@Binding var navigationDirection: NavigationDirection
    var body: some View {
        ZStack() {
            Button(action: goToHome){
                Image("BackArrowSettings").resizable().aspectRatio(contentMode: .fit) // Maintain the image's aspect ratio
                    .frame(width: 20, height: 20)
            }
            .offset(x: -150, y: -340.50)
            Text("Settings")
                .font(Font.custom("Lufga", size: 24))
                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                .offset(x: 0, y: -340.50)
            ZStack() {
                Text("PERSONALIZATION")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: -103, y: -202.50)
                Text("ACCOUNT")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: -129, y: 56.50)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 325, height: 109)
                        .background(.white)
                        .cornerRadius(15)
                        .offset(x: 0, y: 0)
                    ZStack() {
                        ZStack() {
                            Text("Appearance")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                .offset(x: -87.50, y: 0)
                            Text("Coming soon").font(Font.custom("Lufga", size: 12))
                                .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51)).offset(x:110)
                        }
                        .frame(width: 285, height: 23)
                        .offset(x: -0.50, y: -26.50)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 300, height: 1)
                            .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                            .offset(x: 0, y: -0.50)
                        
                        Button(action: goToProfile){
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear).cornerRadius(15).frame(width:325,height:64).offset(x:0,y:26)
                                ZStack() {
                                    Text("Profile")
                                        .font(Font.custom("Lufga", size: 18))
                                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                        .offset(x: -115, y: -23)
                                    Image("RightArrow").resizable()
                                        .aspectRatio(contentMode: .fit).frame(width:15,height:15).offset(x: 130, y: -23)
                                    
                                }
                                .frame(width: 285, height: 23)
                                .offset(x: -0.50, y: 26.50)
                            }
                        }
                        .offset(x:0,y:26)
                        
                    }
                    .frame(width: 300, height: 76)
                    .offset(x: 0.50, y: 0.50)
                }
                .frame(width: 325, height: 109)
                .offset(x: 0.50, y: -126)
                Button(action: {
                    showLogoutAlert = true
                }) {
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 325, height: 56)
                            .background(.white)
                            .cornerRadius(15)
                            .offset(x: 0, y: 0)
                        ZStack() {
                            Text("Sign Out")
                                .font(Font.custom("Lufga", size: 18))
                                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                .offset(x: -106, y: 0)
                            Image("RightArrow").resizable()
                                .aspectRatio(contentMode: .fit).frame(width:15,height:15).offset(x: 130)
                        }
                        .frame(width: 285, height: 23)
                        .offset(x: 0, y: 0.50)
                    }
                }
                .frame(width: 325, height: 56)
                .offset(x: 0.50, y: 109.50)
                .alert(isPresented: $showLogoutAlert) {
                    Alert(title: Text("Confirmation"),
                          message: Text("Are you sure you want to sign out?"),
                          primaryButton: .destructive(Text("Yes"), action: {
                        logOut()
                    }),
                          secondaryButton: .cancel(Text("No")))
                }
                
                
                ZStack() {
                    Text("INFORMATION")
                        .font(Font.custom("Aeonik TRIAL", size: 14))
                        .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                        .offset(x: -117.50, y: -35)
                    
                    Button(action:goToAbout){
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 325, height: 56)
                                .background(.white)
                                .cornerRadius(15)
                                .offset(x: 0, y: 0)
                            ZStack() {
                                Text("About Us")
                                    .font(Font.custom("Lufga", size: 18))
                                    .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                                    .offset(x: -102.50, y: 0)
                                Image("RightArrow").resizable()
                                    .aspectRatio(contentMode: .fit).frame(width:15,height:15).offset(x: 130)
                            }
                            .frame(width: 285, height: 23)
                            .offset(x: 0, y: 0.50)
                        }
                    }
                    .frame(width: 325, height: 56)
                    .offset(x: 0, y: 15)
                }
                .frame(width: 325, height: 86)
                .offset(x: 0.50, y: -11.50)
                
                Button(action:goToDelete){
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 325, height: 56)
                            .background(.white)
                            .cornerRadius(15)
                            .offset(x: 0, y: 0)
                        Text("Delete Account")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0.73, green: 0.15, blue: 0.10))
                            .offset(x: 0, y: -0.50)
                    }
                }
                .frame(width: 325, height: 56)
                .offset(x: 0.50, y: 182.50)
                
            }
            .frame(width: 326, height: 421)
            .offset(x: -0.50, y: -53.50)
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func goToHome(){
        withAnimation{
           // navigationDirection = .backward
            mainViewNum = 0
        }
    }
    
    func goToAbout(){
        withAnimation{
          //  navigationDirection = .forward
            mainViewNum = 2
        }
    }
    
    func goToProfile(){
        withAnimation{
          //  navigationDirection = .forward
            mainViewNum = 3
        }
    }
    
    func goToDelete(){
        withAnimation{
          //  navigationDirection = .forward
            mainViewNum = 4
        }
    }
    
    func deleteAccount(){
        let user = Auth.auth().currentUser
        user?.delete { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Deletion Success")
            }
        }
        
        GIDSignIn.sharedInstance.signOut()
        try? Auth.auth().signOut()
        
        log_Status = false
        log_Status2 = false
        page = 1
        
        let db = Firestore.firestore()
        let documentRef = db.collection("users").document(uid)
        
        documentRef.delete { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
        
        fullname = ""
        sex = ""
        work = ""
        activity = ""
        sliderValue = 50
        progressPage = 0
        mainViewNum = 0
    }
    
    func logOut(){
        
        if log_Status{
            GIDSignIn.sharedInstance.signOut()
            try? Auth.auth().signOut()
            log_Status = false
            page = 1
            progressPage = 0
            mainViewNum = 0
            
        } else if log_Status2{
            DispatchQueue.global(qos: .background).async {
                
                try? Auth.auth().signOut()
            }
            
            log_Status2 = false
            page = 1
            progressPage = 0
            mainViewNum = 0
        }
        
        fullname = ""
        sex = ""
        work = ""
        activity = ""
        genderSelected = 0
        sliderValue = 50
    }
}

#Preview {
        //SettingsView()
    Settings()
}
