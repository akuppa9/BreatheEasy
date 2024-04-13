//
//  LoginView.swift
//  BreatheEasyFigma
//
//  Created by Nikhil Kumar on 3/11/24.
//

import SwiftUI
import Firebase
import GoogleSignIn
import AuthenticationServices
import CryptoKit

struct LoginView: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    
    @AppStorage("page") var page = 1
    
    // Loading Indicator
    @State var isLoading: Bool = false
    
    // For Google Sign In
    @AppStorage("log_Status") var log_Status = false
    @AppStorage("fullname") var fullname = ""
    @AppStorage("uid") var uid = ""
    @AppStorage("tracked") var tracked = false
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
    
    // For Apple Sign In
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        ZStack() {
            VStack {
                Text("By signing up, you agree to the ")
                    .font(Font.custom("Helvetica Neue", size: 12).weight(.medium))
                    .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                
                HStack (spacing: 0) {
                    Link("Terms of Service", destination: URL(string: "https://breatheeasytos.netlify.app/")!)
                        .font(Font.custom("Helvetica Neue", size: 12).weight(.medium))
                        .foregroundColor(Color(red: 0.165, green: 0.788, blue: 0.639))
                    Text(" and ")
                        .font(Font.custom("Helvetica Neue", size: 12).weight(.medium))
                        .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                    Link("Privacy Policy", destination: URL(string: "https://breatheeasyprivacy.netlify.app/")!)
                        .font(Font.custom("Helvetica Neue", size: 12).weight(.medium))
                        .foregroundColor(Color(red: 0.165, green: 0.788, blue: 0.639))
                }
            }
            .offset(x: 0, y: 340)
            
            // Google Sign In Button
            Button (action: handleLogin){
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 320, height: 50)
                        .cornerRadius(34)
                        .overlay(
                            RoundedRectangle(cornerRadius: 34)
                                .inset(by: 0.50)
                                .stroke(Color(red: 0, green: 0.32, blue: 0.27), lineWidth: 0.50)
                        )
                        .offset(x: 0, y: 0)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 24, height: 24)
                            .background(
                                Image("Google24")
                                    .resizable() // Make the image resizable
                                    .aspectRatio(contentMode: .fit)
                            )
                            .offset(x: -99.50, y: 0)
                        Text("Continue with Google")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                            .offset(x: 17, y: -0.50)
                    }
                    .frame(width: 223, height: 24)
                    .offset(x: 0.50, y: 0)
                }
            }
            .frame(width: 320, height: 50)
            .offset(x: 0.50, y: 207)
            
            // Apple Sign In Button
            Button (action: loginViewModel.signInWithApple){
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 320, height: 50)
                        .cornerRadius(34)
                        .overlay(
                            RoundedRectangle(cornerRadius: 34)
                                .inset(by: 0.50)
                                .stroke(Color(red: 0, green: 0.32, blue: 0.27), lineWidth: 0.50)
                        )
                        .offset(x: 0, y: 0)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 24, height: 24)
                            .background(
                                Image("Apple24")
                                    .resizable() // Make the image resizable
                                    .aspectRatio(contentMode: .fit)
                            )
                            .offset(x: -94, y: 0)
                        Text("Continue with Apple")
                            .font(Font.custom("Lufga", size: 18))
                            .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                            .offset(x: 17, y: 0.50)
                    }
                    .frame(width: 212, height: 24)
                    .offset(x: 0, y: 0)
                }
            }
            .frame(width: 320, height: 50)
            .offset(x: 0.50, y: 275)
            
//            ZStack() {
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(width: 320, height: 50)
//                    .background(Color(red: 0, green: 0.32, blue: 0.27))
//                    .cornerRadius(34)
//                    .offset(x: 0, y: 0)
//                Text("Create Account")
//                    .font(Font.custom("Lufga", size: 18))
//                    .foregroundColor(Color(red: 0.70, green: 0.95, blue: 0))
//                    .offset(x: 0, y: 0.50)
//            }
//            .frame(width: 320, height: 50)
//            .offset(x: 0.50, y: 275)
            
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 24, height: 24)
                    .background(
                        Image("LungIcon")
                            .resizable() // Make the image resizable
                            .aspectRatio(contentMode: .fit) // Maintain the image's aspect ratio
                            .frame(width: 100, height: 100)
                            .offset(x: -74, y: -68)
                    )
                VStack(alignment: .leading, spacing: 0) {
                    Text("Breathe")
                        .font(Font.custom("Lufga", size: 36).weight(.medium))
                        .lineSpacing(38)
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: 59, y: 2)
                    Text("Easy")
                        .font(Font.custom("Lufga", size: 36).weight(.regular))
                        .lineSpacing(38)
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: 59, y: 2)
                    ZStack() { }
                        .frame(width: 0, height: 0)
                        .offset(x: -99.50, y: -35)
                }
                .frame(width: 237, height: 78)
                .offset(x: 0, y: -68)
            }
            
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    // handle login
    func handleLogin(){
        
        // google sign in
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        isLoading = true
        
        GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) {[] result, error in
            
            if let error = error{
                isLoading = false
                print(error.localizedDescription)
                return
            }
            
            guard
                let user = result?.user,
                let idToken = user.idToken?.tokenString
            else {
                isLoading = false
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            // Firebase Auth
            Auth.auth().signIn(with: credential){ result2, error in
                isLoading = false
                if let error = error{
                    print(error.localizedDescription)
                    return
                }
                
                // displaying user name
                guard let user2 = result2?.user else{
                    return
                }
                
                print(user2.displayName ?? "Success!")
                fullname = user2.displayName ?? "Name Undefined"
                uid = user2.uid
                
                // updating user as logged in
                
                log_Status = true
                let db = Firestore.firestore()
                
                db.collection("users").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        var count = 0;
                        //                            tracked = false
                        for document in querySnapshot!.documents {
                            
                            if document.documentID == uid{
                                count = count + 1
                                sliderValue = fetchAge()
                                sex = fetchSex()
                                work = fetchWork()
                                activity = fetchActivity()
                            }
                        }
                        
                        if count == 1{
                            page = 3
                        }else{
                            page = 2
                        }
                    }
                }
                
            }
            
        }
        
    }
    
    func fetchAge()->Int{
        let db = Firestore.firestore()
        let docRef = db.collection("users").document("\(uid)")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                if let name = data?["age"] as? Int {
                    sliderValue = name
                }
            } else {
                print("Document does not exist")
            }
        }
        return sliderValue;
    }
    
    func fetchSex()->String{
        let db = Firestore.firestore()
        let docRef = db.collection("users").document("\(uid)")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                if let name = data?["sex"] as? String {
                    sex = name
                }
            } else {
                print("Document does not exist")
            }
        }
        return sex;
    }
    
    func fetchWork()->String{
        let db = Firestore.firestore()
        let docRef = db.collection("users").document("\(uid)")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                if let name = data?["work"] as? String {
                    work = name
                }
            } else {
                print("Document does not exist")
            }
        }
        return work;
    }
    
    func fetchActivity()->String{
        let db = Firestore.firestore()
        let docRef = db.collection("users").document("\(uid)")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                if let name = data?["activity"] as? String {
                    activity = name
                }
            } else {
                print("Document does not exist")
            }
        }
        return activity;
    }
    
}

#Preview {
    LoginView()
}
