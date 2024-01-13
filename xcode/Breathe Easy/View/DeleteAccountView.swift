import SwiftUI
import Firebase
import GoogleSignIn

struct DeleteAccountView: View {
    @AppStorage("page") var page = 1
    @AppStorage("uid") var uid = ""
    @AppStorage("log_Status") var log_Status = false
    @AppStorage("log_Status2") var log_Status2 = false
    @AppStorage("fullname") var fullname = ""
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                Color(.darkGray)
                    .ignoresSafeArea()
                VStack{
                    Text("Are you sure?").foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                        .font(.system(size: UIScreen.main.bounds.height / 15, design: .rounded))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                    Text("This action cannot be undone and all data will be permanently deleted").foregroundStyle(Color(UIColor.systemGray5))
                        .font(.system(size: UIScreen.main.bounds.height / 25, design: .rounded))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("NOTE: If you are signed in with Apple, navigate to Settings -> Your Apple ID -> Sign-in & Security -> Sign in with Apple -> Breathe Easy -> Stop Using Apple ID to successfully delete your account, otherwise errors will occur ").foregroundStyle(Color(UIColor.systemGray5))
                        .font(.system(size: UIScreen.main.bounds.height / 38, design: .rounded))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    Button(action: {
                        page = 3
                    }, label: {
                        Text("Keep Account")
                            .padding()
                            .frame(width: geometry.size.width * 0.6)
                            .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                    }) .background(Color(red: 72/255, green: 72/255, blue: 72/255))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color(red: 72/255, green: 72/255, blue: 72/255)))
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
                        
                    }, label: {
                        Text("Delete Account")
                            .padding()
                            .frame(width: geometry.size.width * 0.6)
                            .foregroundStyle(Color(.red))
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                    }).background(Color(red: 72/255, green: 72/255, blue: 72/255))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color(red: 72/255, green: 72/255, blue: 72/255)))
                        .padding(.leastNonzeroMagnitude)
                    
                }
            }
        }
    }
}

struct DeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccountView()
    }
}
