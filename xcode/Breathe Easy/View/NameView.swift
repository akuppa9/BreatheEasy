//
//  NameView.swift
//  Breathe Easy
//
//  Created by Nikhil Kumar on 1/3/24.
//

import SwiftUI

struct NameView: View {
    @State private var fullname: String = ""
    var placeholder: String = "e.g. John Doe"

    var body: some View {
        ZStack{
            Color(.darkGray)
                .ignoresSafeArea()
            VStack{
                Text("Please enter your full name")
                    .foregroundStyle(Color(UIColor.systemGray5))
                    .font(.system(size: UIScreen.main.bounds.height / 25, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding()
                TextField(placeholder, text: $fullname)
                    .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                    .font(.system(size: UIScreen.main.bounds.height / 38, design: .rounded))
                    .fontWeight(.bold)
                    .textFieldStyle(OvalTextFieldStyle())
            }
        }
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [(Color((UIColor.gray)))]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}


/* Section {
 Text("You typed: (name)")
 }*/
