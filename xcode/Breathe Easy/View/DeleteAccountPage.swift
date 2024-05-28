//
//  DeleteAccountPage.swift
//  Breathe Easy
//
//  Created by Nikhil Kumar on 4/13/24.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct DeleteAccountPage: View {
    @AppStorage("genderSelected") var genderSelected = 0
    @AppStorage("page") var page = 1
    @AppStorage("progressPage") var progressPage = 0
    @Binding var mainViewNum: Int
    @Binding var ACTScore: Double
    @AppStorage("uid") var uid = ""
    @AppStorage("log_Status") var log_Status = false
    @AppStorage("log_Status2") var log_Status2 = false
    @AppStorage("fullname") var fullname = ""
    @State private var showLogoutAlert = false
    @State private var showDeleteAlert = false
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
    @AppStorage("tracked") var tracked = false
    @State private var showAlertActivityOutdoor = false
    @AppStorage("frequencySelectedActivity") var frequencySelectedActivity = 0
    @AppStorage("frequencySelected") var frequencySelected = 0
    @AppStorage("fromAbout") var fromAbout = 0
    
    var body: some View {
        ZStack() {
            Button(action: goToSettings){
                Image("BackArrowSettings").resizable().aspectRatio(contentMode: .fit) // Maintain the image's aspect ratio
                    .frame(width: 20, height: 20)
            }
            .offset(x: -150, y: -340.50)
            Text("Delete Account")
                .font(Font.custom("Lufga", size: 24))
                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                .offset(x: 0, y: -340.50)
            Text("Are you sure you want to \ndelete your account?")
                .multilineTextAlignment(.center)
                .font(Font.custom("Lufga", size: 24))
                .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                .offset(x: 0, y: -225)
            Text("By clicking the Delete Account button,\nall the data associated with \nyour account will automatically\nbe deleted and cannot be recovered.")
                .font(Font.custom("Aeonik TRIAL", size: 14))
                .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                .offset(x: 0, y: -140)
                .multilineTextAlignment(.center)
            Button(action: {showDeleteAlert = true}){
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 320, height: 50)
                        .background(Color(red: 0.76, green: 0.06, blue: 0))
                        .cornerRadius(34)
                        .offset(x: 0, y: 0)
                    Text("Delete Account")
                        .font(Font.custom("Lufga", size: 18))
                        .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .offset(x: 0.50, y: 0.50)
                }
            }
            .frame(width: 320, height: 50)
            .offset(x: 0.50, y: 327)
            .alert(isPresented: $showDeleteAlert) {
                Alert(title: Text("Confirmation"),
                      message: Text("Are you sure you want to delete your account?"),
                      primaryButton: .destructive(Text("Delete"), action: {
                    deleteAccount()
                }),
                      secondaryButton: .cancel(Text("Keep")))
            }
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
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
    
    func goToSettings(){
        withAnimation{
            mainViewNum = 1
        }
    }
}

//#Preview {
//    DeleteAccountPage()
//}
