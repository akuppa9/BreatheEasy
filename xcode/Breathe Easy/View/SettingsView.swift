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
    @AppStorage("progressPage") var progressPage = 1
    @AppStorage("mainViewNum") var mainViewNum = 0
    @AppStorage("uid") var uid = ""
    @AppStorage("log_Status") var log_Status = false
    @AppStorage("log_Status2") var log_Status2 = false
    @AppStorage("fullname") var fullname = ""
    @State private var showLogoutAlert = false
    var body: some View {
        ZStack() {
            Group {
                Button(action: goToHome){
                    Image("BackArrowSettings").resizable().aspectRatio(contentMode: .fit) // Maintain the image's aspect ratio
                        .frame(width: 20, height: 20)
                }
                .offset(x: -150, y: -339.50)
                Text("Settings")
                    .font(Font.custom("Lufga", size: 30))
                    .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                    .offset(x: 0.50, y: -339.50)
                //                Text("PERSONALIZATION")
                //                    .font(Font.custom("Aeonik TRIAL", size: 14))
                //                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                //                    .offset(x: -102.50, y: -248)
                Text("ACCOUNT")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    .offset(x: -129.50, y: -248)
                //                Rectangle()
                //                    .foregroundColor(.clear)
                //                    .frame(width: 325, height: 56)
                //                    .background(.white)
                //                    .cornerRadius(15)
                //                    .offset(x: 0, y: -198)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 325, height: 160)
                        .background(.white)
                        .cornerRadius(15)
                        .offset(x: 0, y: 0)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 300, height: 1)
                            .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                            .offset(x: 0, y: -25.50)
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 28, height: 28)
                                .background(
                                    Image("SettingsEdit").resizable()
                                        .aspectRatio(contentMode: .fit)
                                )
                                .offset(x: -133, y: 0)
                            Text("Edit Profile")
                                .font(Font.custom("Lufga", size: 20))
                                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                .offset(x: -49.50, y: 0)
                        }
                        .frame(width: 294, height: 28)
                        .offset(x: -3, y: -52)
                        
                        Button(action: {
                            showLogoutAlert = true
                        }) {
                            ZStack() {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 28, height: 28)
                                    .background(
                                        Image("SettingsLogout").resizable()
                                            .aspectRatio(contentMode: .fit)
                                    )
                                    .offset(x: -133, y: 0)
                                Text("Sign Out")
                                    .font(Font.custom("Lufga", size: 20))
                                    .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                                    .offset(x: -60.50, y: 0)
                            }
                            .frame(width: 294, height: 28)
                        }
                        .offset(x: -3, y: 1)
                        .alert(isPresented: $showLogoutAlert) {
                            Alert(title: Text("Confirmation"),
                                  message: Text("Are you sure you want to sign out?"),
                                  primaryButton: .destructive(Text("Yes"), action: {
                                logOut()
                            }),
                                  secondaryButton: .cancel(Text("No")))
                        }
                        
                        
                        Button(action: deleteAccount){
                            ZStack() {
                                Text("Delete Account")
                                    .font(Font.custom("Lufga", size: 20))
                                    .foregroundColor(Color(red: 0.73, green: 0.15, blue: 0.10))
                                    .offset(x: -27, y: 0)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 24, height: 24)
                                    .background(
                                        Image("SettingsDelete").resizable()
                                            .aspectRatio(contentMode: .fit)
                                    )
                                    .offset(x: -134, y: 0)
                            }
                            .frame(width: 292, height: 26)
                        }
                        .offset(x: -2, y: 53)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 300, height: 1)
                            .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                            .offset(x: 0, y: 27.50)
                    }
                    .frame(width: 300, height: 132)
                    .offset(x: 0.50, y: 0)
                }
                .frame(width: 325, height: 160)
                .offset(x: 0, y: -145)
            }
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func goToHome(){
        withAnimation{
            mainViewNum = 0
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
        progressPage = 1
        mainViewNum = 0
    }
    
    func logOut(){
        
        if log_Status{
            GIDSignIn.sharedInstance.signOut()
            try? Auth.auth().signOut()
            log_Status = false
            page = 1
            fullname = ""
            progressPage = 1
            mainViewNum = 0
            
        } else if log_Status2{
            DispatchQueue.global(qos: .background).async {
                
                try? Auth.auth().signOut()
            }
            
            log_Status2 = false
            page = 1
            fullname = ""
            progressPage = 1
            mainViewNum = 0
        }
    }
}

struct Settings: View {
    @AppStorage("page") var page = 1
    @AppStorage("progressPage") var progressPage = 1
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
    @Binding var navigationDirection: NavigationDirection
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
                        }
                        .frame(width: 285, height: 23)
                        .offset(x: -0.50, y: 26.50)
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
            navigationDirection = .backward
            mainViewNum = 0
        }
    }
    
    func goToAbout(){
        withAnimation{
            navigationDirection = .forward
            mainViewNum = 2
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
        progressPage = 1
        mainViewNum = 0
    }
    
    func logOut(){
        
        if log_Status{
            GIDSignIn.sharedInstance.signOut()
            try? Auth.auth().signOut()
            log_Status = false
            page = 1
            progressPage = 1
            mainViewNum = 0
            
        } else if log_Status2{
            DispatchQueue.global(qos: .background).async {
                
                try? Auth.auth().signOut()
            }
            
            log_Status2 = false
            page = 1
            progressPage = 1
            mainViewNum = 0
        }
        
        fullname = ""
        sex = ""
        work = ""
        activity = ""
        sliderValue = 50
    }
}

//#Preview {
    //    SettingsView()
//    Settings(navigationDirection: $navigationDirection)
//}
