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
                        
                        Button(action: logOut){
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
                
//                ZStack() {
//                    // fix the selector to be a circle
//                    Rectangle()
//                        .foregroundColor(.clear)
//                        .frame(width: 28, height: 28)
//                        .background(
//                            Image("SettingsMoon").resizable()
//                                .aspectRatio(contentMode: .fit)
//                        )
//                        .offset(x: -62, y: 0)
//                    Text("Dark Mode")
//                        .font(Font.custom("Lufga", size: 20))
//                        .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
//                        .offset(x: 23, y: 0)
//                }
//                .offset(x: -73.50, y: -198)
                
//                ZStack() {
//                    Rectangle()
//                        .foregroundColor(.clear)
//                        .frame(width: 38, height: 20)
//                        .background(Color(red: 0.94, green: 0.94, blue: 0.94))
//                        .cornerRadius(34)
//                        .offset(x: 0, y: 0)
//                    Ellipse()
//                        .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
//                        .frame(width: 16, height: 16)
//                        .background(.clear)
//                        .offset(x: 9, y: 0)
//                }
//                .frame(width: 38, height: 20)
//                .offset(x: 125.50, y: -198)
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

#Preview {
    SettingsView()
}
