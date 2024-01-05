//
//  NameView.swift
//  Breathe Easy
//
//  Created by Nikhil Kumar on 1/3/24.
//

import SwiftUI

struct NameView: View {
    @AppStorage("page") var page = 1
    @AppStorage("fullname") var fullname = ""
    @State private var alert2 = false
    var placeholder: String = "e.g. John Doe"
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color(.darkGray)
                    .ignoresSafeArea()
                VStack(spacing: 1){
                    Text("Please enter your full name")
                        .foregroundStyle(Color(UIColor.systemGray5))
                        .font(.system(size: UIScreen.main.bounds.height / 25, design: .rounded))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding()
                    TextField(placeholder, text: $fullname)
                        .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                        .font(.system(size: UIScreen.main.bounds.height / 38, design: .rounded))
                        .fontWeight(.bold)
                        .textFieldStyle(OvalTextFieldStyle())
                        .padding()
                    Button{
                        withAnimation{
                            page = 2
                        }
                    }
                label: {
                    HStack{
                        Text("Next")
                            .padding()
                            .frame(width: geometry.size.width * 0.6)
                            .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                    }
                }
                .alert(isPresented: $alert2) {
                    Alert(
                        title: Text("Incomplete Information"),
                        message: Text("Please enter your full name"),
                        dismissButton: .default(Text("OK")) {
                            alert2 = false
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

struct OvalTextFieldStyle: TextFieldStyle {
   func _body(configuration: TextField<Self._Label>) -> some View {
       VStack {
           GeometryReader { geometry in
               configuration
                  .padding(10)
                  .background(Color.gray)
                  .cornerRadius(10)
                  .frame(width: geometry.size.width * 0.8)
                  .offset(x: geometry.size.width / 2 - geometry.size.width * 0.8 / 2)
           }
       }
   }
}

struct NameViewRender: View {
    @State private var fullname: String = ""
    var body: some View {
        NameView()
    }
}

#Preview {
    NameViewRender()
}


