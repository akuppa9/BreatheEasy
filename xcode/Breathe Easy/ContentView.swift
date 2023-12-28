import Foundation
import SwiftUI
import Charts
import Firebase
import GoogleSignIn
struct Pf:Codable{
    let value:Float
}
enum GHError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
}

struct MyVars {
    var DataPoints: [Double]
}

struct SliderComponent: View {
    @Binding var sliderValue: Int
    var sliderWidth: CGFloat
    var body: some View {
        VStack {
            Text("Age: \(sliderValue)")
                .foregroundStyle(Color.white)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)

            Slider(value: Binding(
                get: { Double(sliderValue) },
                set: { sliderValue = Int($0) }
                ),
                in: 0...100, step: 1.0)
                .accentColor(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                .frame(width: sliderWidth)
        }
    }
}

struct DropMenu: Identifiable {
    var id = UUID()
    var title = String()
}
let drop = [
    DropMenu(title: "Male"),
    DropMenu(title: "Female")
]
let drop1 = [
    DropMenu(title: "Frequently"),
    DropMenu(title: "Occasionally"),
    DropMenu(title: "Rarely")
]
struct DropdownMenuComponentGender: View {
    @State var show = false
    @Binding var name: String
    var body: some View {
            VStack {
                ZStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        ScrollView {
                            VStack(spacing: 17){
                                ForEach(drop) { item in Button {
                                    withAnimation {
                                        name =  item.title
                                        show.toggle()
                                    }
                                } label: {
                                    Text(item.title).foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                                        .bold()
                                    Spacer()
                                }
                                }
                                .padding(.horizontal)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 15)
                        }
                    }
                    .frame(height: show ? 65 : 0)
                    .offset(y: show ? 0 : -105)
                    .foregroundStyle(Color((UIColor.gray)))
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).frame(height: 60)
                            .foregroundStyle(Color(red: 0.55, green: 0.55, blue: 0.55))
                        HStack {
                            Text(name).font(.title2)
                                .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(show ? 90 : 0))
                                .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                            
                        }
                        .bold()
                        .padding(.horizontal)
                        .foregroundStyle(Color(.white))
                    }
                    .offset(y: -75)
                    .onTapGesture {
                        withAnimation {
                            show.toggle()
                    }
                }
                
            }
        }
        .padding()
        .frame(height: 60).offset(y: 30)
    }
}


struct DropdownMenuComponentJob: View {
    @State var show = false
    @Binding var name: String
    var body: some View {
            VStack {
                ZStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        ScrollView {
                            VStack(spacing: 17){
                                ForEach(drop1) { item in Button {
                                    withAnimation {
                                        name =  item.title
                                        show.toggle()
                                    }
                                } label: {
                                    Text(item.title).foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                                        .bold()
                                    Spacer()
                                }
                                }
                                .padding(.horizontal)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 15)
                        }
                    }
                    .frame(height: show ? 65 : 0)
                    .offset(y: show ? 0 : -105)
                    .foregroundStyle(Color((UIColor.gray)))
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).frame(height: 60)
                            .foregroundStyle(Color(red: 0.55, green: 0.55, blue: 0.55))
                        HStack {
                            Text(name).font(.title2)
                                .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(show ? 90 : 0))
                                .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                            
                        }
                        .bold()
                        .padding(.horizontal)
                        .foregroundStyle(Color(.white))
                    }
                    .offset(y: -75)
                    .onTapGesture {
                        withAnimation {
                            show.toggle()
                    }
                }
                
            }
        }
        .padding()
        .frame(height: 60).offset(y: 30)
    }
}

struct DropdownMenuComponentActivity: View {
    @State var show = false
    @Binding var name: String
    var body: some View {
            VStack {
                ZStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        ScrollView {
                            VStack(spacing: 17){
                                ForEach(drop1) { item in Button {
                                    withAnimation {
                                        name =  item.title
                                        show.toggle()
                                    }
                                } label: {
                                    Text(item.title).foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                                        .bold()
                                    Spacer()
                                }
                                }
                                .padding(.horizontal)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 15)
                        }
                    }
                    .frame(height: show ? 65 : 0)
                    .offset(y: show ? 0 : -105)
                    .foregroundStyle(Color((UIColor.gray)))
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).frame(height: 60)
                            .foregroundStyle(Color(red: 0.55, green: 0.55, blue: 0.55))
                        HStack {
                            Text(name).font(.title2)
                                .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(show ? 90 : 0))
                                .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                            
                        }
                        .bold()
                        .padding(.horizontal)
                        .foregroundStyle(Color(.white))
                    }
                    .offset(y: -75)
                    .onTapGesture {
                        withAnimation {
                            show.toggle()
                    }
                }
                
            }
        }
        .padding()
        .frame(height: 60).offset(y: 30)
    }
}


struct StartTracking: View{
    @AppStorage("page") var page = 1
    @AppStorage("tracked") var tracked = false
    @AppStorage("uid") var uid = ""
    @Binding var sliderValue: Int
    @State private var sliderWidth: CGFloat = 300.0
    @State private var showAlert = false
    @Binding var sex: String
    @Binding var work: String
    @Binding var activity: String
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Color(UIColor.darkGray).ignoresSafeArea()
                VStack (spacing: 50){
                    Color(UIColor.darkGray)
                        .frame(height: 0.1)
                    ScrollView {
                        Text("Maximize the accuracy and quality of your predictions by answering a few questions: ")
                            .padding()
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.white)
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                        
                        SliderComponent(sliderValue: $sliderValue,
                                        sliderWidth: sliderWidth)
                        .padding()
                        .padding()
                        .padding()
                        Text("What is your biological sex?")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.white)
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                            
                        DropdownMenuComponentGender(name: $sex)
                            .padding()
                            .padding()
                            .padding()
                        Text("How often do you work outdoors?")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.white)
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                        DropdownMenuComponentJob(name: $work)
                            .padding()
                            .padding()
                            .padding()
                        
                        Text("How often do you participate in outdoor activity?")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.white)
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                        
                        DropdownMenuComponentActivity(name: $activity)
                            .padding()
                            .padding()
                            .padding()
                        Button{
                            if (sex == "" || work == "" || activity == ""){
                                showAlert = true;
                            }
                            else if(sex != "" && work != "" && activity != ""){
                                
                                let db = Firestore.firestore()
                                
                                let docRef = db.document("users/\(uid)")
                                
                                let docData: [String: Any] = [
                                    "age": sliderValue,
                                    "sex": sex,
                                    "work": work,
                                    "activity": activity
                                ]
                                
                                docRef.setData(docData)
                                sex = "";
                                work = "";
                                activity = "";
                                sliderValue = 50;
                                
                                tracked = true
                                
                                withAnimation{
                                    page = 3
                                }
                            }
                        }
                        label: {
                            Text("Start Tracking")
                                .padding()
                                .frame(width: geometry.size.width * 0.6)
                                .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.bold)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Incomplete Information"),
                                message: Text("One or more fields are empty"),
                                dismissButton: .default(Text("OK")) {
                                    showAlert = false
                                }
                            )
                        }
                        .background(Color(red: 72/255, green: 72/255, blue: 72/255))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color(red: 72/255, green: 72/255, blue: 72/255)))
                        
                        Spacer().frame(width: .infinity, height: 30)
                           
                    }
                }

            }
        }
    }
}

struct Home: View{
    func getPf(url: String) async throws -> Pf{
        let endpoint = url
        
        guard let url=URL(string:endpoint) else{
            throw GHError.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from:url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw GHError.invalidResponse}
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Pf.self, from:data)
        }catch {
            throw GHError.invalidData
        }
    }
    
    @State private var user: Pf?
    
    var body: some View {
        ZStack{
            Color(UIColor.darkGray).ignoresSafeArea()
            VStack(alignment: .center){
                if user?.value ?? 0 >= 0 && user?.value ?? 0 < 0.50{
                    Text("Peak Flow")
                        .font(.system(size: 55, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center).foregroundStyle(Color(UIColor.systemGray5))
                    Image("redt").resizable().frame(width: 300, height: 300)
                    Text(String(format: "%.0f%%",(user?.value ?? 0)*100))
                        .font(.system(size: 55, weight: .bold)).foregroundStyle(Color(UIColor.systemGray5))
                    Text("of predicted maximum peak flow value")
                        .font(.system(size: 15, weight: .bold)).foregroundStyle(Color(UIColor.systemGray5))
                        .padding()
                    Text("You may be at severe risk of an asthma attack")
                        .font(.system(size: 15, weight: .bold)).foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                }
                else if user?.value ?? 0 >= 0.50 && user?.value ?? 0 < 0.60{
                    Text("Peak Flow")
                        .font(.system(size: 55, weight: .bold, design: .rounded)).multilineTextAlignment(.center).foregroundStyle(Color(UIColor.systemGray5))
                    Image("oranget").resizable().frame(width: 300, height: 300)
                    Text(String(format: "%.0f%%",(user?.value ?? 0)*100))
                        .font(.system(size: 55, weight: .bold)).foregroundStyle(Color(UIColor.systemGray5))
                    Text("of predicted maximum peak flow value")
                        .font(.system(size: 15, weight: .bold)).foregroundStyle(Color(UIColor.systemGray5))
                        .padding()
                    Text("You may be at moderate-severe risk of an asthma attack")
                        .font(.system(size: 15, weight: .bold)).foregroundStyle(.orange)
                        .multilineTextAlignment(.center)
                }
                else if user?.value ?? 0 >= 0.60 && user?.value ?? 0 < 0.70{
                    Text("Peak Flow")
                        .font(.system(size: 55, weight: .bold, design: .rounded)).multilineTextAlignment(.center).foregroundStyle(Color(UIColor.systemGray5))
                    Image("yellowt").resizable().frame(width: 300, height: 300)
                    Text(String(format: "%.0f%%",(user?.value ?? 0)*100))
                        .font(.system(size: 55, weight: .bold)).foregroundStyle(Color(UIColor.systemGray5))
                    Text("of predicted maximum peak flow value")
                        .font(.system(size: 15, weight: .bold)).foregroundStyle(Color(UIColor.systemGray5))
                        .padding()
                    Text("You may be at moderate risk of an asthma attack")
                        .font(.system(size: 15, weight: .bold)).foregroundStyle(.yellow)
                        .multilineTextAlignment(.center)
                }
                else if user?.value ?? 0 >= 0.70 && user?.value ?? 0 < 0.80{
                    Text("Peak Flow")
                        .font(.system(size: 55, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center).foregroundStyle(Color(UIColor.systemGray5))
                    Image("lightgreent").resizable().frame(width: 300, height: 300)
                    Text(String(format: "%.0f%%",(user?.value ?? 0)*100))
                        .font(.system(size: 55, weight: .bold)).foregroundStyle(Color(UIColor.systemGray5))
                    Text("of predicted maximum peak flow value")
                        .font(.system(size: 15, weight: .bold)).foregroundStyle(Color(UIColor.systemGray5))
                        .padding()
                    Text("You may be at slight risk of an asthma attack")
                        .font(.system(size: 15, weight: .bold)).foregroundStyle(Color(UIColor.systemGreen))
                        .multilineTextAlignment(.center)
                }else if user?.value ?? 0 >= 0.80 {
                    Text("Peak Flow")
                        .font(.system(size: 55, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center).foregroundStyle(Color(UIColor.systemGray5))
                    Image("greent").resizable().frame(width: 300, height: 300)
                    Text(String(format: "%.0f%%",(user?.value ?? 0)*100))
                        .font(.system(size: 55, weight: .bold)).foregroundStyle(Color(UIColor.systemGray5))
                    Text("of predicted maximum peak flow value")
                        .font(.system(size: 15, weight: .bold)).foregroundStyle(Color(UIColor.systemGray5))
                        .padding()
                    Text("You can breathe easy!")
                        .font(.system(size: 15, weight: .bold)).foregroundStyle(.green)
                        .multilineTextAlignment(.center)
                }
            }
        }
        
        .task{
            do{
                user = try await getPf(url: "https://paktion.pythonanywhere.com/22.0/15.0/15.0/9.0/1040.0/98.0/1.51/0.0/2.0/292.72/20.39/11.54/2.27/11.64/16.40/0.39/83.0")
                try await Task.sleep(nanoseconds: 3_000_000_000)
            } catch GHError.invalidURL{
                print("invalid URL")
            }catch GHError.invalidResponse{
                print("invalid response")
            }catch GHError.invalidData{
                print("invalid data")
            }catch{
                print("Error")
            }
            
            do{
                user = try await getPf(url: "https://paktion.pythonanywhere.com/22.0/15.0/15.0/12.0/1040.0/98.0/2.51/0.0/2.0/283.72/20.39/21.99/2.27/11.64/16.40/0.39/83.0")
                try await Task.sleep(nanoseconds: 2_500_000_000)
            } catch GHError.invalidURL{
                print("invalid URL")
            }catch GHError.invalidResponse{
                print("invalid response")
            }catch GHError.invalidData{
                print("invalid data")
            }catch{
                print("Error")
            }
            
            do{
                user = try await getPf(url: "https://paktion.pythonanywhere.com/22.0/15.0/15.0/14.0/1040.0/98.0/2.51/0.0/2.0/283.72/20.39/21.99/2.27/11.64/16.40/0.39/83.0")
                try await Task.sleep(nanoseconds: 2_500_000_000)
            } catch GHError.invalidURL{
                print("invalid URL")
            }catch GHError.invalidResponse{
                print("invalid response")
            }catch GHError.invalidData{
                print("invalid data")
            }catch{
                print("Error")
            }
            
            
            do{
                user = try await getPf(url: "https://paktion.pythonanywhere.com/22.0/15.0/15.0/11.0/1040.0/98.0/2.51/0.0/2.0/283.72/20.39/21.99/2.27/11.64/16.40/0.39/83.0")
                try await Task.sleep(nanoseconds: 2_500_000_000)
            } catch GHError.invalidURL{
                print("invalid URL")
            }catch GHError.invalidResponse{
                print("invalid response")
            }catch GHError.invalidData{
                print("invalid data")
            }catch{
                print("Error")
            }
            
            do{
                user = try await getPf(url: "https://paktion.pythonanywhere.com/22.0/15.0/15.0/15.0/1040.0/98.0/2.51/0.0/2.0/283.72/20.39/21.99/2.27/11.64/16.40/0.39/83.0")
                try await Task.sleep(nanoseconds: 2_500_000_000)
            } catch GHError.invalidURL{
                print("invalid URL")
            }catch GHError.invalidResponse{
                print("invalid response")
            }catch GHError.invalidData{
                print("invalid data")
            }catch{
                print("Error")
            }
            
            do{
                user = try await getPf(url: "https://paktion.pythonanywhere.com/22.0/15.0/15.0/17.0/1040.0/98.0/2.51/0.0/2.0/283.72/20.39/21.99/2.27/11.64/16.40/0.39/83.0")
                try await Task.sleep(nanoseconds: 2_500_000_000)
            } catch GHError.invalidURL{
                print("invalid URL")
            }catch GHError.invalidResponse{
                print("invalid response")
            }catch GHError.invalidData{
                print("invalid data")
            }catch{
                print("Error")
            }
            
            do{
                user = try await getPf(url: "https://paktion.pythonanywhere.com/22.0/15.0/15.0/22.0/1040.0/98.0/2.51/0.0/2.0/283.72/20.39/21.99/2.27/11.64/16.40/0.39/83.0")
                try await Task.sleep(nanoseconds: 2_500_000_000)
            } catch GHError.invalidURL{
                print("invalid URL")
            }catch GHError.invalidResponse{
                print("invalid response")
            }catch GHError.invalidData{
                print("invalid data")
            }catch{
                print("Error")
            }
            
        }
        
    }
}

struct ViewAbout: View{
    var body: some View{
        ZStack(alignment: .center){
                Color(UIColor.darkGray)
                    .ignoresSafeArea()
                ScrollView{
                    Text("""
Welcome to Breathe Easy, your trusted companion in the management of asthma. This documentation serves as an in-app guide to help you maximize the benefits of our application, designed to assist you in monitoring your peak flow and preventing asthma attacks.
                 
Breathe Easy boasts several key features that empower you in managing your asthma effectively. It provides real-time peak flow predictions powered by a machine learning regression model. The app leverages heart rate data from your Apple Watch and takes into account factors such as air quality and temperature to offer personalized insights.
                 
Breathe Easy is designed to deliver timely alerts and notifications, all seamlessly integrated with AWS for machine learning predictions.

To get started with Breathe Easy, simply sign in using your existing account credentials. If you're a new user, you can effortlessly create an account to access all the app's features.

Once you're inside the app, you'll be greeted by a user-friendly home screen displaying your current peak flow prediction and other essential information. You can review your past predictions and health insights in the trends tab. Breathe Easy continuously monitors your heart rate through watchOS data, and additionally measures other relevant factors with Apple’s WeatherKit to provide real-time peak flow predictions. It offers immediate feedback and compares your current peak flow to your maximum predicted value. It will alert you if your peak flow drops significantly, potentially indicating an asthma attack.

You can easily customize your alert thresholds and notification preferences to suit your needs. The app will send timely alerts to your iOS device and Apple Watch, ensuring you're well-informed and can take necessary actions in the event your peak flow is at risk.

Breathe Easy is here to provide you with the tools you need to manage your asthma with confidence and peace of mind. Thank you for choosing Breathe Easy.
""")
                    .foregroundStyle(Color(UIColor.white)).padding()
                    .multilineTextAlignment(.center)
                }
                .frame(width: .infinity, height: 660)
                .zIndex(1)
            }
            .zIndex(2)
        }
    }

struct ProfileView: View{
    @AppStorage("page") var page = 1
    @AppStorage("uid") var uid = ""
    @AppStorage("log_Status") var log_Status = false
    @AppStorage("log_Status2") var log_Status2 = false
    @AppStorage("name") var name = ""
    @State private var showAlertDel = false
    @State private var showAlertLogOut = false
    @State private var showEditAccount = false
    var body: some View{
        NavigationView {
            ZStack{
                Color(UIColor.darkGray).ignoresSafeArea()
                VStack {
                    
                    VStack{
                        HStack{
                            Text(name)
                                .font(.largeTitle).foregroundStyle(Color(UIColor.systemGray5)).fontWeight(.bold)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 21, bottom: 10, trailing: 21))
                    }
                    // edit profile button
                    Button{
                        showEditAccount = true
                    } label: {
                        VStack{
                            Divider().background(Color(UIColor.systemGray5))
                            HStack{
                                Text("Edit Profile")
                                    .font(.body).foregroundStyle(Color(UIColor.systemGray5))
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 10, leading: 21, bottom: 10, trailing: 21))
                        }
                    }
                    .alert(isPresented: $showEditAccount) {
                                    Alert(
                                        title: Text("Edit Profile"),
                                        message: Text("Would you like to edit your account info?"),
                                        primaryButton: .default(Text("Yes")) {
                                        page = 2
                                        },
                                        secondaryButton: .cancel(Text("No")) {}
                                    )
                                }
                    
                    // log out button
                    Button{
                        showAlertLogOut = true
                    } label: {
                        VStack{
                            Divider().background(Color(UIColor.systemGray5))
                            HStack{
                                Text("Log Out")
                                    .font(.body).foregroundStyle(Color(UIColor.systemGray5))
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 10, leading: 21, bottom: 10, trailing: 21))
                            Divider().background(Color(UIColor.systemGray5))
                        }
                    }
                    .alert("Are you sure?", isPresented: $showAlertLogOut, actions: {
                        Button("Log Out", role: .destructive) {
                            if log_Status{
                                GIDSignIn.sharedInstance.signOut()
                                try? Auth.auth().signOut()
                                withAnimation{
                                    log_Status = false
                                    page = 1
                                }
                            }
                            else if log_Status2{
                                DispatchQueue.global(qos: .background).async {
                                    
                                    try? Auth.auth().signOut()
                                }
                                
                                withAnimation{
                                    log_Status2 = false
                                    page = 1
                                }
                            }
                        }
                    })
                    
                    // delete account button
                    Button{
                        showAlertDel = true
                    } label: {
                        VStack{
                            HStack{
                                Text("Delete Account")
                                    .font(.body).foregroundStyle(Color.red)
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 10, leading: 21, bottom: 10, trailing: 21))
                            Divider().background(Color(UIColor.systemGray5))
                        }
                    }
                    .alert("Are you sure?", isPresented: $showAlertDel, actions: {
                        Button("Delete", role: .destructive) {
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
                            
                            withAnimation{
                                log_Status = false
                                log_Status2 = false
                                
                                page = 1
                                
                                let db = Firestore.firestore()
                                let documentRef = db.collection("users").document("\(uid)")
                                
                                documentRef.delete() { err in
                                    if let err = err {
                                        print("Error removing document: \(err)")
                                    } else {
                                        print("Document successfully removed!")
                                    }
                                }
                            }

                        }
                    }, message: {
                        Text("Deleting this account will delete all stored data")
                    })
                    Spacer()
                }
//                .navigationBarTitle(Text(name))
            }
        }
    }
}

struct MainView: View{
    var body: some View{
        TabView{
            // HOME VIEW
            Home()
                .tabItem(){
                    Image(systemName: "lungs.fill")
                    Text("Home")
                }.toolbarBackground(Color.white, for: .tabBar)
            
            // ABOUT VIEW
            ViewAbout()
                .tabItem(){
                    Image(systemName: "info.circle")
                    Text("About")
                }.toolbarBackground(Color.white, for: .tabBar)
            
            // PROFILE VIEW
           ProfileView()
                .tabItem(){
                Image(systemName: "person.fill")
                Text("Profile")
            }.toolbarBackground(Color.white, for: .tabBar)
        }
    }
}

struct TestView: View{
    @AppStorage("uid") var uid = ""
    @Binding var sliderValue: Int
    @Binding var sex: String
    @Binding var work: String
    @Binding var activity: String
    var body: some View{
        Text("\(uid)")
        Text("\(sliderValue)")
        Text("\(sex)")
        Text("\(work)")
        Text("\(activity)")
    }
}

struct ContentView: View {
    @AppStorage("page") var page = 1
    @AppStorage("log_Status") var log_Status = false
    @AppStorage("log_Status2") var log_Status2 = false
    @AppStorage("tracked") var tracked = false
    @AppStorage("uid") var uid = ""
    @State private var sliderValue: Int = 50
    @State private var sex: String = ""
    @State private var work: String = ""
    @State private var activity: String = ""
    
    var body: some View{
        if (page == 3){
            MainView()
        }else if(page == 2){
            StartTracking(sliderValue: $sliderValue, sex: $sex, work: $work, activity: $activity)
        }else{
            LoginPage(sliderValue: $sliderValue, sex: $sex, work: $work, activity: $activity)
//           StartTracking()
//           ProfileView()
        }
        
    }
}

#Preview {
    ContentView()
}
