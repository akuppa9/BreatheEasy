import Foundation
import SwiftUI
import Charts
import Firebase
import GoogleSignIn
import Combine
import UserNotifications

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

func checkForPermission() {
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.getNotificationSettings { settings in
        switch settings.authorizationStatus {
        case .authorized:
            dispatchNotification()
        case .denied:
            return
        case .notDetermined:
            notificationCenter.requestAuthorization(options: [.alert, .sound]) {
                didAllow, error in
                if didAllow {
                    dispatchNotification()
                }
            }
        default:
            return
            
        }
    }
}

func dispatchNotification() {
    let identifier = "morning"
    let title = "Hello Breathe Easy"
    let body = "test"
    let hour = 19
    let minute = 0
    let isDaily = true
    
    let notificationCenter = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    
    let calendar = Calendar.current
    var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
    dateComponents.hour = hour
    dateComponents.minute = minute
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
    notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
    notificationCenter.add(request)
    
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
                    .foregroundStyle(Color(UIColor.systemGray5))
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
    @State private var sliderWidth: CGFloat = 300.0
    @State private var showAlert = false
    @AppStorage("fullname") var fullname = ""
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
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
                            .foregroundStyle(Color(UIColor.systemGray5))
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                        
                        SliderComponent(sliderValue: $sliderValue,
                                        sliderWidth: sliderWidth)
                        .padding()
                        .padding()
                        .padding()
                        Text("What is your biological sex?")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color(UIColor.systemGray5))
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                        
                        DropdownMenuComponentGender(name: $sex)
                            .padding()
                            .padding()
                            .padding()
                        Text("How often do you work outdoors?")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color(UIColor.systemGray5))
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                        DropdownMenuComponentJob(name: $work)
                            .padding()
                            .padding()
                            .padding()
                        
                        Text("How often do you participate in outdoor activity?")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color(UIColor.systemGray5))
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
                                    "name": fullname,
                                    "age": sliderValue,
                                    "sex": sex,
                                    "work": work,
                                    "activity": activity
                                ]
                                
                                docRef.setData(docData)
                                fullname = "";
                                sex = "";
                                work = "";
                                activity = "";
                                sliderValue = 50;
                                
                                tracked = true
                                
                                page = 3
                            }
                            checkForPermission()
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
    @AppStorage("fullname") var fullname = ""
    @State private var showAlertDel = false
    @State private var showAlertLogOut = false
    @State private var showEditAccount = false
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
    
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
    
    
    var body: some View{
        NavigationView {
            ZStack{
                Color(UIColor.darkGray).ignoresSafeArea()
                VStack {
                    VStack{
                        HStack{
                            TextField("",text: $fullname, onCommit: {
                                let db = Firestore.firestore()
                                
                                // Specify the document path (e.g., "collectionName/documentID")
                                let docRef = db.collection("users").document("\(uid)")
                                
                                // Data to update
                                let updateData = [
                                    "name": fullname
                                ]
                                
                                // Perform the update
                                docRef.updateData(updateData) { error in
                                    if let error = error {
                                        // Handle any errors
                                        print("Error updating document: \(error)")
                                    } else {
                                        // Update was successful
                                        print("Document successfully updated")
                                    }
                                }
                            })
                            .font(.largeTitle).foregroundStyle(Color(UIColor.systemGray5)).fontWeight(.bold)
                            Spacer()
                            Image(systemName: "pencil")
                                .font(.system(size: 0.08 * UIScreen.main.bounds.size.width)) // Adjust the multiplier as needed
                                .foregroundColor(.gray)
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
                                page = 2;
                                sliderValue = fetchAge();
                                sex = fetchSex();
                                work = fetchWork();
                                activity = fetchActivity();
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
                                log_Status = false
                                page = 1
                                fullname = ""
                            }
                            else if log_Status2{
                                DispatchQueue.global(qos: .background).async {
                                    
                                    try? Auth.auth().signOut()
                                }
                                
                                log_Status2 = false
                                page = 1
                                fullname = ""
                            }
                        }
                    })
                    
                    // delete account button
                    Button{
                        page = 4
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
                    Spacer()
                    Image("BreatheEasy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .cornerRadius(14)
                    Spacer()
                    Spacer()
                }
                //                .navigationBarTitle(Text(name))
            }
        }
    }
}

struct MainView: View{
    @AppStorage("fullname") var fullname = ""
    @AppStorage("uid") var uid = ""
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
    
    func fetchName(){
        let db = Firestore.firestore()
        let docRef = db.collection("users").document("\(uid)")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                if let name = data?["name"] as? String {
                    fullname = name
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    
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
        .onAppear(){
            fetchName()
        }
    }
}

struct TestView: View{
    
    @StateObject var deviceLocationService = DeviceLocationService.shared
    
    @State var tokens: Set<AnyCancellable> = []
    @State var coordinates: (lat: Double, lon: Double) = (0, 0)
    
    @Environment(\.scenePhase) var scenePhase
    
    // Replace with your OpenWeatherMap API Key
    @AppStorage("apikey") var apiKey = "0f9111decfea0ac7cd6457aebee611bb"
    
    // Weather variables
    @State var humidity = 1
    @State var pressure = 1
    @State var temperature = 1.0
    @State var uvi = 1.0
    @State var windSpeed = 1.0
    @State var ACTScore = 1.0
    
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
    
    // numerical versions of sex, work, activity
    @AppStorage("sexNum") var sexNum: Int = 1
    @AppStorage("workNum") var workNum: Int = 1
    @AppStorage("activityNum") var activityNum: Int = 1
    
    // will be used to store the modified values for the model
    @AppStorage("sliderValueModified") var sliderValueModified: Int = 1
    @AppStorage("uviModified") var uviModified: Int = 1
    
    var body: some View {
        VStack {
            Text("Latitude: \(coordinates.lat)")
                .font(.largeTitle)
            Text("Longitude: \(coordinates.lon)")
                .font(.largeTitle)
            
            // Display weather data
            Text("Humidity: \(humidity)%")
            Text("Pressure: \(pressure) hPa")
            Text("Temperature: \(temperature)°C")
            Text("UV Index: \(uvi)")
            Text("Wind Speed: \(windSpeed) m/s")
            Text("ACT Score: \(ACTScore)")
        }
        .onAppear {
            observeCoordinateUpdates()
            observeDeniedLocationAccess()
            deviceLocationService.requestLocationUpdates()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
            deviceLocationService.startMonitoringSignificantLocationChanges()
        }
        .onChange(of: scenePhase) { newScenePhase, _ in
            switch newScenePhase {
            case .active:
                deviceLocationService.requestLocationUpdates()
            case .background:
                deviceLocationService.startMonitoringSignificantLocationChanges()
            default:
                break
            }
        }
        
    }
    
    func observeCoordinateUpdates() {
        deviceLocationService.coordinatesPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { coordinates in
                self.coordinates = (coordinates.latitude, coordinates.longitude)
                fetchCurrentWeather(latitude: coordinates.latitude, longitude: coordinates.longitude)
                fetchUVIndex(latitude: coordinates.latitude, longitude: coordinates.longitude)
                parseACTScore()
            }
            .store(in: &tokens)
    }
    
    func observeDeniedLocationAccess() {
        deviceLocationService.deniedLocationAccessPublisher
            .receive(on: DispatchQueue.main)
            .sink {
                print("Handle access denied event, possibly with an alert.")
            }
            .store(in: &tokens)
    }
    
    // Function to fetch current weather data
    func fetchCurrentWeather(latitude: Double, longitude: Double) {
        let weatherURLString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        
        fetchWeatherData(from: weatherURLString) { jsonResult in
            DispatchQueue.main.async {
                if let currentWeather = jsonResult as? [String: Any],
                   let main = currentWeather["main"] as? [String: Any],
                   let wind = currentWeather["wind"] as? [String: Any] {
                    
                    self.humidity = main["humidity"] as? Int ?? 0
                    self.pressure = main["pressure"] as? Int ?? 0
                    self.temperature = main["temp"] as? Double ?? 0.0
                    self.windSpeed = wind["speed"] as? Double ?? 0.0
                }
            }
        }
    }
    
    // Function to fetch UV index
    func fetchUVIndex(latitude: Double, longitude: Double) {
        let uvURLString = "https://api.openweathermap.org/data/2.5/uvi?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
        
        fetchWeatherData(from: uvURLString) { jsonResult in
            DispatchQueue.main.async {
                if let uvData = jsonResult as? [String: Any] {
                    self.uvi = uvData["value"] as? Double ?? 0.0
                }
            }
        }
    }
    
    // set model parameters that need to be modified
    func setModelValues(){
        
        // set age (4 possible values)
        if(sliderValue > 50){
            sliderValueModified = 3
        } else if (sliderValue <= 50 && sliderValue >= 41){
            sliderValueModified = 2
        } else if (sliderValue <= 40 && sliderValue >= 31){
            sliderValueModified = 1
        } else if (sliderValue <= 30){
            sliderValueModified = 0
        }
        
        // set gender (male=1, female=0)
        if(sex == "Male"){
            sexNum = 1
        } else{
            sexNum = 0
        }
        
        // set work (3 possible values)
        if (work == "Occasionally"){
            workNum = 1
        } else if (work == "Frequently"){
            workNum = 0
        } else{
            workNum = 2
        }
        
        // set activity (3 possible values)
        if (activity == "Occasionally"){
            activityNum = 1
        } else if (activity == "Frequently"){
            activityNum = 0
        } else{
            activityNum = 2
        }
        
        // set uvi
        if (uvi <= 5){
            uviModified = 1
        } else{
            uviModified = 0
        }
    }
    
    func parseACTScore(){
        
        setModelValues()
        
        let ACTURLString = "https://nkumar04.pythonanywhere.com/predict?param1=3&param2=\(sliderValueModified)&param3=\(sexNum)&param4=\(workNum)&param5=\(activityNum)&param6=\(humidity)&param7=\(pressure)&param8=\(temperature)&param9=\(uviModified)&param10=\(windSpeed)"
        fetchACTScore(from: ACTURLString) { jsonResult in
            DispatchQueue.main.async {
                if let ACTData = jsonResult as? [String: Any] {
                    let pred = ACTData["prediction"] as? Double ?? 0.0
                    self.ACTScore = pred > 25.0 ? 25 : pred.rounded()
//                    self.ACTScore = ACTData["prediction"] as? Double ?? 0.0
                }
            }
        }
    }
    
    // Generic function to fetch weather data
    func fetchWeatherData(from urlString: String, completion: @escaping (Any?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data returned")
                completion(nil)
                return
            }
            
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: data)
                completion(jsonResult)
            } catch {
                print("Error parsing JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    // fetch model value
    func fetchACTScore(from urlString: String, completion: @escaping (Any?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data returned")
                completion(nil)
                return
            }
            
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: data)
                completion(jsonResult)
            } catch {
                print("Error parsing JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    // Call these functions when coordinates update
    //    fetchCurrentWeather(latitude: coordinates.lat, longitude: coordinates.lon)
    //    fetchUVIndex(latitude: coordinates.lat, longitude: coordinates.lon)
    
}

struct ContentView: View {
    @AppStorage("page") var page = 1
    @AppStorage("log_Status") var log_Status = false
    @AppStorage("log_Status2") var log_Status2 = false
    @AppStorage("tracked") var tracked = false
    @AppStorage("uid") var uid = ""
    @AppStorage("fullname") var fullname = ""
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("sex") var sex: String = ""
    @AppStorage("work") var work: String = ""
    @AppStorage("activity") var activity: String = ""
    
    var body: some View{
        ZStack{
            if (page == 1){
                LoginPage().transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
            if(page == 2){
                StartTracking().transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                
            }
            if(page == 3){
                //  ProfileView(sliderValue: $sliderValue, sex: $sex, work: $work, activity: $activity)
                //   .tabItem(){
                //        Image(systemName: "person.fill")
                //        Text("Profile")
                //     }.toolbarBackground(Color.white, for: .tabBar)
//                MainView().transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                TestView().transition(.asymmetric(insertion: .slide, removal: .slide))
            }
            if(page == 4){
                DeleteAccountView().transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
            if(page == 5){
                NameView().transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
        }
        .animation(.default, value: page)
    }
}

#Preview {
    ContentView()
}
