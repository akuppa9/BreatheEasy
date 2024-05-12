//
//  HomeView.swift
//  BreatheEasyFigma
//
//  Created by Nikhil Kumar on 3/11/24.
//

import SwiftUI
import Foundation
import Charts
import Firebase
import GoogleSignIn
import Combine
import UserNotifications
import CoreLocation

enum NavigationDirection {
    case forward, backward
}

struct HomeView2: View {
    @AppStorage("mainViewNum") var mainViewNum = 0
    var body: some View {
        ZStack() {
            Group {
                ZStack() {
                    Text("Insights")
                        .font(Font.custom("Lufga", size: 30))
                        .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                        .offset(x: -108, y: 0.50)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 42, height: 42)
                        .background(
                            AsyncImage(url: URL(string: "https://via.placeholder.com/42x42"))
                        )
                        .offset(x: 141.50, y: 0)
                }
                .offset(x: 0, y: -338)
                ZStack() { }
                    .frame(width: 0, height: 0)
                    .offset(x: -187.50, y: -406)
                Text("ACT Score")
                    .font(Font.custom("Lufga", size: 30))
                    .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                    .offset(x: -87.50, y: 19.50)
                Text("Predicted Asthma Control Test")
                    .font(Font.custom("Aeonik TRIAL", size: 14))
                    .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                    .offset(x: -67, y: 56)
            };Group {
                Text("FAQ")
                    .font(Font.custom("Lufga", size: 30))
                    .foregroundColor(.clear)
                    .offset(x: -133, y: 208.50)
                Rectangle()
                    .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
                    .frame(width: 375, height: 60)
                    .background(Color(red: 1, green: 1, blue: 1).opacity(0.75))
                    .offset(x: 0, y: 376)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 42, height: 42)
                        .background(
                            Image("HomeHome").resizable()
                                .aspectRatio(contentMode: .fit)
                        )
                        .offset(x: -100, y: 0)
                    
                    Button(action: goToSettings){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 42, height: 42)
                            .background(
                                Image("HomeSettings").resizable()
                                    .aspectRatio(contentMode: .fit)
                            )
                    }
                    .offset(x: 0, y: 0)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 42, height: 42)
                        .background(
                            Image("HomeHelp").resizable()
                                .aspectRatio(contentMode: .fit)
                        )
                        .offset(x: 100, y: 0)
                }
                .frame(height: 42)
                .offset(x: 0.50, y: 376)
                ZStack() {
                    ZStack() {
                        ZStack() {
                            ZStack() { }
                                .frame(width: 287, height: 191)
                                .offset(x: 8, y: 39.59)
                        }
                        .frame(width: 215, height: 199.82)
                        .offset(x: 0, y: 0)
                    }
                    .frame(width: 215, height: 199.82)
                    .offset(x: 0, y: 0)
                    Image("HomeLung").resizable()
                    Text("25")
                        .font(Font.custom("Lufga", size: 30))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: 0.50, y: 120.59)
                }
                .frame(width: 215, height: 199.82)
                .offset(x: 0, y: -153.09)
            }
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func goToSettings(){
        withAnimation{
            mainViewNum = 1
        }
    }
}

struct HomeView: View {
    @AppStorage("mainViewNum") var mainViewNum = 0
    var body: some View {
        ZStack() {
            Group {
                ZStack() {
                    Text("Insights")
                        .font(Font.custom("Lufga", size: 30))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: -108, y: 0.50)
                    Button(action: goToSettings){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 42, height: 42)
                            .background(
                                Image("HomeSettings").resizable()
                                    .aspectRatio(contentMode: .fit)
                            )
                    }
                    .offset(x: 141.50, y: 0)
                }
                .offset(x: 0, y: -338)
                ZStack() { }
                    .frame(width: 0, height: 0)
                    .offset(x: -187.50, y: -406)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 325, height: 111)
                        .background(Color(red: 0, green: 0.32, blue: 0.27))
                        .cornerRadius(15)
                        .offset(x: 0, y: 0)
                    ZStack() {
                        Text("25")
                            .font(Font.custom("Lufga", size: 30))
                            .foregroundColor(Color(red: 0.70, green: 0.95, blue: 0))
                            .offset(x: -100.50, y: -8.50)
                        Text("Predicted Asthma Control Test Score")
                            .font(Font.custom("Aeonik TRIAL", size: 14))
                            .foregroundColor(Color(red: 0.54, green: 0.73, blue: 0))
                            .offset(x: 0, y: 20)
                    }
                    .frame(width: 235, height: 56)
                    .offset(x: -18, y: -2.50)
                }
                .frame(width: 325, height: 111)
                .offset(x: 0, y: 107.50)
                ZStack() {
                    Text("ACT Score")
                        .font(Font.custom("Lufga", size: 30))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: 0, y: 0)
                }
                .offset(x: -87.50, y: 12.50)
            };Group {
                ZStack() {
                    ZStack() {
                        ZStack() {
                            ZStack() { }
                                .frame(width: 287, height: 191)
                                .offset(x: 8, y: 39.59)
                        }
                        .frame(width: 215, height: 199.82)
                        .offset(x: 0, y: 0)
                    }
                    .frame(width: 215, height: 199.82)
                    .offset(x: 0, y: 0)
                    Text("25")
                        .font(Font.custom("Lufga", size: 30))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: 0.50, y: 6.59)
                }
                .frame(width: 215, height: 199.82)
                .offset(x: 0, y: -153.09)
            }
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func goToSettings(){
        withAnimation{
            mainViewNum = 1
        }
    }
    
}

struct MainViewNew: View{
//    @AppStorage("mainViewNum") var mainViewNum = 0
    @State var ACTScore = 0.0
    @State var mainViewNum = 0
    @AppStorage("fromAbout") var fromAbout = 0
    
    @State var navigationDirection: NavigationDirection = .forward
    
    var body: some View{
        ZStack{
            if (mainViewNum == 0){
                HomeView3(mainViewNum: $mainViewNum, ACTScore: $ACTScore, navigationDirection: $navigationDirection).transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }else if (mainViewNum == 1){
                Settings(ACTScore: $ACTScore, mainViewNum: $mainViewNum)//navigationDirection: $navigationDirection).transition(navigationDirection == .forward ? .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)) : .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }else if (mainViewNum == 2){
                AboutUsView(ACTScore: $ACTScore, mainViewNum: $mainViewNum)/*.transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))*/
            } else if (mainViewNum == 3){
                Profile(ACTScore: $ACTScore,mainViewNum: $mainViewNum)
            } else if (mainViewNum == 4){
                DeleteAccountPage(mainViewNum: $mainViewNum, ACTScore: $ACTScore)
            }
        }
        .animation(.default, value: mainViewNum)
    }
}

//class Debouncer {
//    private var lastCallTime: DispatchTime?
//    private let delay: TimeInterval
//    private var workItem: DispatchWorkItem?
//
//    init(delay: TimeInterval) {
//        self.delay = delay
//    }
//
//    func call(_ block: @escaping () -> Void) {
//        workItem?.cancel()
//        workItem = DispatchWorkItem { [weak self] in
//            self?.lastCallTime = .now()
//            block()
//        }
//        if let workItem = workItem {
//            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: workItem)
//        }
//    }
//}

class Throttler {
    private var lastFireTime: DispatchTime = .now()
    private var delay: TimeInterval
    private var workItem: DispatchWorkItem?

    init(delay: TimeInterval) {
        self.delay = delay
    }

    func throttle(block: @escaping () -> Void) {
        workItem?.cancel()
        
        let dispatchDelay = DispatchTime.now() + delay
        if dispatchDelay > lastFireTime {
            lastFireTime = dispatchDelay
        }
        
        workItem = DispatchWorkItem {
            block()
        }
        
        DispatchQueue.main.asyncAfter(deadline: lastFireTime, execute: workItem!)
    }
}

struct HomeView3: View {
    @Binding var mainViewNum: Int
    @Binding var ACTScore: Double
    @State private var lastFetchedCoordinates: (latitude: Double, longitude: Double)?
    var fetchThreshold: Double = 500 // meters
    
    @State private var throttler = Throttler(delay: 5)  // Delay of 5 seconds
    
    @StateObject var deviceLocationService = DeviceLocationService.shared
    
    @State var tokens: Set<AnyCancellable> = []
    @State var coordinates: (lat: Double, lon: Double) = (0, 0)
    
    @Environment(\.scenePhase) var scenePhase
    
    @AppStorage("apikey") var apiKey = "9cf777457a44dc1e9c46bc7c2b38a904"
    
    // Weather variables
    @State var humidity = 1
    @State var pressure = 1
    @State var temperature = 1.0
    @State var uvi = 1.0
    @State var windSpeed = 1.0
    
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
    
    @Binding var navigationDirection: NavigationDirection
    
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
        ZStack() {
            Group {
                ZStack() {
                    Text("Home")
                        .font(Font.custom("Lufga", size: 24))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: -120.50, y: 0)
                    Button(action: goToSettings){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 42, height: 42)
                            .background(
                                Image("HomeSettings").resizable()
                                    .aspectRatio(contentMode: .fit)
                            )
                    }
                    .offset(x: 141.50, y: 0)
                }
                .offset(x: -3, y: -341)
                if (ACTScore > 19 && ACTScore <= 25){
                    Image("GreenLung").resizable()
                        .aspectRatio(contentMode: .fit).offset(x:0,y:-150).frame(width:250)
                } else if(ACTScore > 14 && ACTScore <= 19){
                    Image("YellowLung").resizable()
                        .aspectRatio(contentMode: .fit).offset(x:0,y:-150).frame(width:250)
                }else if(ACTScore > 1 && ACTScore <= 14){
                    Image("OrangeLung").resizable()
                        .aspectRatio(contentMode: .fit).offset(x:0,y:-150).frame(width:250)
                }else{
                    Image("HomeLungLighter").resizable()
                        .aspectRatio(contentMode: .fit).offset(x:0,y:-150).frame(width:250)
                }
                ZStack() { }
                    .frame(width: 0, height: 0)
                    .offset(x: -187.50, y: -406)
                ZStack() {
                    ZStack(alignment: .leading) {
                        if (ACTScore > 19 && ACTScore <= 25){
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 325, height: 111)
                                .background(Color(red: 0.698, green: 0.945, blue: 0))
                                .cornerRadius(15)
                                .offset(x: 10, y: 0)
                            
                            HStack(spacing: 2){
                                Text(String(format: "%.0f",ACTScore))
                                    .font(Font.custom("Lufga", size: 30))
                                    .foregroundColor(Color(red: 0.2, green: 0.4588235294117647, blue: 0))
                                    .offset(y: -8.50)
                                    .opacity(0.80)
                                Text("/25")
                                    .font(Font.custom("Lufga", size: 15))
                                    .foregroundColor(Color(red: 0.2, green: 0.4588235294117647, blue: 0))
                                    .offset(y: -5.50)
                                    .opacity(0.80)
                            }.offset(x:30)
                            
                            Text("Predicted Asthma Control Test Score")
                                .font(Font.custom("Aeonik TRIAL", size: 14))
                                .foregroundColor(Color(red: 0.2, green: 0.4588235294117647, blue: 0))
                                .offset(x: 30, y: 20)
                        } else if(ACTScore > 14 && ACTScore <= 19){
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 325, height: 111)
                                .background(Color(red: 1, green: 0.92, blue: 0.2))
                                .cornerRadius(15)
                                .offset(x: 10, y: 0)
                            
                            HStack(spacing: 2){
                                Text(String(format: "%.0f",ACTScore))
                                    .font(Font.custom("Lufga", size: 30))
                                    .foregroundColor(Color(red: 0.4666666666666667, green: 0.36470588235294116, blue: 0))
                                    .offset(y: -8.50)
                                    .opacity(0.80)
                                Text("/25")
                                    .font(Font.custom("Lufga", size: 15))
                                    .foregroundColor(Color(red: 0.4666666666666667, green: 0.36470588235294116, blue: 0))
                                    .offset(y: -5.50)
                                    .opacity(0.80)
                            }
                            .offset(x:30)
                            
                            Text("Predicted Asthma Control Test Score")
                                .font(Font.custom("Aeonik TRIAL", size: 14))
                                .foregroundColor(Color(red: 0.4666666666666667, green: 0.36470588235294116, blue: 0))
                                .offset(x: 30, y: 20)
                        }else if(ACTScore > 1 && ACTScore <= 14){
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 325, height: 111)
                                .background(Color(red: 0.98, green: 0.57, blue: 0.20))
                                .cornerRadius(15)
                                .offset(x: 10, y: 0)
                            
                            HStack(spacing:2){
                                Text(String(format: "%.0f",ACTScore))
                                    .font(Font.custom("Lufga", size: 30))
                                    .foregroundColor(Color(red: 0.5647058823529412, green: 0.27058823529411763, blue: 0))
                                    .offset(y: -8.50)
                                    .opacity(0.80)
                                Text("/25")
                                    .font(Font.custom("Lufga", size: 15))
                                    .foregroundColor(Color(red: 0.5647058823529412, green: 0.27058823529411763, blue: 0))
                                    .offset(y: -5.50)
                                    .opacity(0.80)
                            }
                            .offset(x:30)
                            
                            Text("Predicted Asthma Control Test Score")
                                .font(Font.custom("Aeonik TRIAL", size: 14))
                                .foregroundColor(Color(red: 0.5647058823529412, green: 0.27058823529411763, blue: 0))
                                .offset(x: 30, y: 20)
                        } else{
                            ProgressView().offset(x:18)
                        }
                    }
                    .frame(width: 235, height: 56)
                    .offset(x: -18, y: -2.50)
                }
                .frame(width: 325, height: 111)
                .offset(x: 0, y: 88.50)
                
                Button(action: {
                    mainViewNum = 2
                }){
                    ZStack(alignment: .leading){
                        Text("Learn more about what your score means")
                            .font(Font.custom("Lufga", size: 12))
                            .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                            .underline()
                        Image(systemName: "arrow.right.circle").resizable().foregroundStyle(Color(red: 0.48, green: 0.51, blue: 0.51)).frame(width: 10, height: 10).offset(x:248)
                    }
                }
                .offset(x: -35, y: 160)
                
                ZStack() {
                    Text("ACT Score")
                        .font(Font.custom("Lufga", size: 24))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: 20, y: 0)
                }
                .offset(x: -119, y: 5.50)
                ZStack() {
                    Text("Insights")
                        .font(Font.custom("Lufga", size: 24))
                        .foregroundColor(Color(red: 0, green: 0.32, blue: 0.27))
                        .offset(x: 20, y: 0)
                    Text("Coming soon").font(Font.custom("Lufga", size: 12))
                        .foregroundColor(Color(red: 0.48, green: 0.51, blue: 0.51))
                        .offset(x: 16, y: 30)
                }
                .offset(x: -133, y: 210)
                
            };Group {
                ZStack() {
                    ZStack() {
                        ZStack() { }
                            .frame(width: 255, height: 70)
                            .offset(x: -8, y: 100.09)
                    }
                    .frame(width: 215, height: 199.82)
                    .offset(x: 0, y: 0)
                }
                .frame(width: 215, height: 199.82)
                .offset(x: 0, y: -154.09)
            }
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
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
    
    func goToSettings(){
        withAnimation{
            //            navigationDirection = .forward
            mainViewNum = 1
        }
    }
    
    func observeCoordinateUpdates() {
        
        deviceLocationService.coordinatesPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { coordinates in
                self.coordinates = (coordinates.latitude, coordinates.longitude)
                Task{
                    await fetchCurrentWeather(latitude: coordinates.latitude, longitude: coordinates.longitude)
                    await fetchUVIndex(latitude: coordinates.latitude, longitude: coordinates.longitude)
                    await parseACTScore()
                }
//                Task {
//                    await self.parseACTScore()
//                }
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
    func fetchCurrentWeather(latitude: Double, longitude: Double) async{
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
    func fetchUVIndex(latitude: Double, longitude: Double) async{
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
    
    func parseACTScore() async {
        
        setModelValues()
        
        let ACTURLString = "https://nkumar04.pythonanywhere.com/predict?param1=2&param2=\(sliderValueModified)&param3=\(sexNum)&param4=\(workNum)&param5=\(activityNum)&param6=\(humidity)&param7=\(pressure)&param8=\(temperature)&param9=\(uviModified)&param10=\(windSpeed)"
        
        fetchACTScore(from: ACTURLString) { jsonResult in
            DispatchQueue.main.async {
                if let ACTData = jsonResult as? [String: Any] {
                    let pred = ACTData["prediction"] as? Double ?? 0.0
                    self.ACTScore = pred > 25.0 && pred < 100 ? 25 : pred.rounded()
                    //                    self.ACTScore = ACTData["prediction"] as? Double ?? 0.0
                }
            }
        }
        
        DispatchQueue.main.async {
            // Check if the ACT score is within the desired range
            if 0.1...25 ~= self.ACTScore {
                deviceLocationService.setDistanceFilter(100)  // Set distance filter based on ACT score
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
    
}

#Preview {
    MainViewNew()
    //    HomeView3()
}
