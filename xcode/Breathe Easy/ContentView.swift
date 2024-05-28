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
                LoginView().transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
            if(page == 2){
                ProgressView2().transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
            if(page == 3){
                MainViewNew().transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
        }
        .animation(.default, value: page)
//        .scaled()
        .scaleEffect(scaleFactorForCurrentDevice())
    }
    
    func scaleFactorForCurrentDevice() -> CGFloat {
        let screenSize = UIScreen.main.bounds.size
        let referenceSize = CGSize(width: 375, height: 667) // iPhone SE (3rd gen) size as a reference
        if screenSize == referenceSize {
            return 0.8 // Adjust this scale factor as needed
        } else {
            return 1.0 // Default scale factor for other devices
        }
    }
}

#Preview {
    ContentView()
}
