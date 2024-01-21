import SwiftUI
import Firebase
import GoogleSignIn
import AuthenticationServices

struct LoginPage: View {
    
    @AppStorage("page") var page = 1
    
    // Loading Indicator
    @State var isLoading: Bool = false
    
    // For Google Sign In
    @AppStorage("log_Status") var log_Status = false
    @AppStorage("fullname") var fullname = ""
    @AppStorage("uid") var uid = ""
    @AppStorage("tracked") var tracked = false
    @Binding var sliderValue: Int
    @Binding var sex: String
    @Binding var work: String
    @Binding var activity: String
    
    // For Apple Sign In
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            VStack(spacing: 1){
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text("Welcome to").foregroundStyle(Color(UIColor.systemGray5))
                    .font(.system(size: UIScreen.main.bounds.height / 15, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                Text("Breathe Easy").foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                    .font(.system(size: UIScreen.main.bounds.height / 15, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                Text("your personal asthma assistant").foregroundStyle(Color(UIColor.systemGray5))
                    .font(.system(size: UIScreen.main.bounds.height / 35, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Image("BreatheEasy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .cornerRadius(14)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text("Sign in to get started").foregroundStyle(Color(UIColor.systemGray5))
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Spacer()
                Button{
                    handleLogin()
                } label: {
                    HStack(spacing: 0){
                        Image("colorG")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28)
                            .cornerRadius(14)
                        Text("Sign in with Google")
                            .font(.system(size: 21))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    }
//                    .padding()
                    .frame(width: geometry.size.width * 0.9, height: 55)
                }
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white))
                
                Spacer()
                Spacer()
                
                // Put Apple Sign In button here
                
                SignInWithAppleButton { (request) in
                    
                    // requesting parameters from apple login
                    loginData.nonce = randomNonceString()
                    request.requestedScopes = [.email, .fullName]
                    request.nonce = sha256(loginData.nonce)
                    
                } onCompletion: { (result) in
                    
                    // getting error or success
                    
                    switch result{
                    case .success(let user):
                        print("success")
                        
                        // do login with firebase
                        guard let credential = user.credential as? ASAuthorizationAppleIDCredential else{
                            print("error with firebase")
                            return
                        }
                        
                        loginData.authenticate(credential: credential)
                    case.failure(let error):
                        print(error.localizedDescription)
                    }
                }
                .signInWithAppleButtonStyle(.black)
                .frame(width: geometry.size.width * 0.9)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black))
                .frame(height: 55)
                
                VStack(alignment: .center){
                    Color(UIColor.darkGray).ignoresSafeArea()
                }
            }
            .overlay(
                ZStack{
                    
                    if isLoading{
                        Color.black.opacity(0.25).ignoresSafeArea()
                        
                        ProgressView()
                            .font(.title2)
                            .frame(width: 60, height: 60)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                }
            )

            
        }
        .background(Color(UIColor.darkGray))
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
            
//            guard error == nil else {
//                print(error.localizedDescription)
//                return
//            }
            
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
                                //                                    tracked = true
                            }
                            //                        print("\(document.documentID) => \(document.data())")
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
    
}

//#Preview {
//    LoginPage(sliderValue: $sliderValue, sex: $sex, work: $work, activity: $activity)
//}

// extending view to get screen bounds
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    // retrieving root view controller
    func getRootViewController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        
        return root
    }
}
