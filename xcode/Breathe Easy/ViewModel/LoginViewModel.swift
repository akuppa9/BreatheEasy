//
//  LoginViewModel.swift
//  Breathe Easy
//
//  Created by Nikhil Kumar on 11/25/23.
//

import SwiftUI
import CryptoKit
import AuthenticationServices
import Firebase

class LoginViewModel: ObservableObject{
    
    @Published var nonce = ""
    @AppStorage("log_Status2") var log_Status2 = false
    @AppStorage("tracked") var tracked = false
    @AppStorage("uid") var uid = ""
    @AppStorage("page") var page = 1
    @AppStorage("name") var name = ""
    
    func authenticate(credential: ASAuthorizationAppleIDCredential){
        
        // getting Token
        guard let token = credential.identityToken else{
            print("error with firebase")
            
            return
        }
        
        // Token string
        guard let tokenString = String(data: token, encoding: .utf8) else{
            print("error with token")
            return
        }
        
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: nonce)
        
        Auth.auth().signIn(with: firebaseCredential){
            (result, err) in
            
            if let error = err{
                print(error.localizedDescription)
                return
            }
            
            // user successfully logged in to firebase
            print("Logged in with apple success")
            
            // displaying user name
            guard let user2 = result?.user else{
                return
            }
            
            self.uid = user2.uid
            self.name = user2.displayName ?? "Name Undefined"
            
//            if let newUser = result?.additionalUserInfo?.isNewUser, newUser,
//                       let appleFullName = credential.fullName {
//                        let formatter = PersonNameComponentsFormatter()
//                        let nameString = formatter.string(from: appleFullName)
//
//                        // Set the displayName in Firebase Auth
//                        let changeRequest = result?.user.createProfileChangeRequest()
//                        changeRequest?.displayName = nameString
//                        changeRequest?.commitChanges { error in
//                            if let error = error {
//                                print("Error setting display name: \(error.localizedDescription)")
//                            } else {
//                                // Successfully set the display name
//                                self.name = nameString
//                            }
//                        }
//                    } else {
//                        // For existing users or if fullName is not available
//                        self.name = user2.displayName ?? "Name Undefined"
//                    }
            
            
            
            // Directing user to home page
            withAnimation {
                self.log_Status2 = true
                
                let db = Firestore.firestore()
                
                db.collection("users").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        var count = 0;
//                            tracked = false
                        for document in querySnapshot!.documents {
                            
                            if document.documentID == self.uid{
                                count = count + 1
//                                    tracked = true
                            }
        //                        print("\(document.documentID) => \(document.data())")
                        }
                        
                        if count == 1{
                            withAnimation{
                                self.page = 3
                            }
                        }else{
                            withAnimation{
                                self.page = 2
                            }
                        }
                    }
                }
            }
        }
        
    }
}

// helpers for apple login with firebase

 func sha256(_ input: String) -> String {
  let inputData = Data(input.utf8)
  let hashedData = SHA256.hash(data: inputData)
  let hashString = hashedData.compactMap {
    String(format: "%02x", $0)
  }.joined()

  return hashString
}

 func randomNonceString(length: Int = 32) -> String {
  precondition(length > 0)
  var randomBytes = [UInt8](repeating: 0, count: length)
  let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
  if errorCode != errSecSuccess {
    fatalError(
      "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
    )
  }

  let charset: [Character] =
    Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")

  let nonce = randomBytes.map { byte in
    // Pick a random character from the set, wrapping around if needed.
    charset[Int(byte) % charset.count]
  }

  return String(nonce)
}

    
