import SwiftUI
import Firebase
import GoogleSignIn

struct DeleteAccountView: View {
    @AppStorage("page") var page = 1
    @AppStorage("uid") var uid = ""
    @AppStorage("log_Status") var log_Status = false
    @AppStorage("log_Status2") var log_Status2 = false
    
    var body: some View {
        ZStack {
            Color(.darkGray)
                .ignoresSafeArea()
            VStack{
                Text("Are you sure you want to delete your account? This action cannot be undone").foregroundStyle(Color(UIColor.systemGray5))
                    .font(.system(size: UIScreen.main.bounds.height / 25, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Deleting this account will permanently delete all existing data associated with this account ").foregroundStyle(Color(UIColor.systemGray5))
                    .font(.system(size: UIScreen.main.bounds.height / 25, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                Text("NOTE: If you are signed in with Apple, navigate to Settings -> Your Apple ID -> Sign-in & Security -> Sign in with Apple -> Breathe Easy -> Stop Using Apple ID to successfully delete your account, otherwise errors will occur ").foregroundStyle(Color(UIColor.systemGray5))
                    .font(.system(size: UIScreen.main.bounds.height / 38, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Button(action: {
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
                    
                    withAnimation {
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
                    }
                }, label: {
                    Text("Delete Account")
                        .foregroundStyle(Color(.red))
                        .font(.system(size: UIScreen.main.bounds.height / 30))
                })
                .padding(.leastNonzeroMagnitude)
                Button(action: {
                    page = 3
                }, label: {
                    Text("Cancel")
                        .foregroundStyle(Color(UIColor.systemGray5))
                        .font(.system(size: UIScreen.main.bounds.height / 35))
                })
            }
        }
    }
}

struct DeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccountView()
    }
}
