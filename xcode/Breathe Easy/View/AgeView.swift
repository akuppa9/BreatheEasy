//
//  AgeView.swift
//  BreatheEasyFigma
//
//  Created by Nikhil Kumar on 3/11/24.
//

import SwiftUI

struct ProgressTabView: View{
    @AppStorage("progressPage") var progressPage = 1
    var body: some View{
        
        if (progressPage == 1){
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(519)
                    .offset(x: -130, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(508)
                    .offset(x: -43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(493)
                    .offset(x: 43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(484)
                    .offset(x: 130, y: 0)
            }
            .frame(width: 342, height: 6)
            .offset(x: 0.50, y: -363)
            
        } else if (progressPage == 2){
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(519)
                    .offset(x: -130, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(508)
                    .offset(x: -43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(493)
                    .offset(x: 43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(484)
                    .offset(x: 130, y: 0)
            }
            .frame(width: 342, height: 6)
            .offset(x: 0.50, y: -363)
            
        } else if (progressPage == 3){
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(519)
                    .offset(x: -130, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(508)
                    .offset(x: -43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(493)
                    .offset(x: 43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(484)
                    .offset(x: 130, y: 0)
            }
            .frame(width: 342, height: 6)
            .offset(x: 0.50, y: -363)
            
        } else{
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(519)
                    .offset(x: -130, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(508)
                    .offset(x: -43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(493)
                    .offset(x: 43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(484)
                    .offset(x: 130, y: 0)
            }
            .frame(width: 342, height: 6)
            .offset(x: 0.50, y: -363)
        }
    }
}

struct AgeView: View {
    @AppStorage("page") var page = 1
    @AppStorage("age") var sliderValue: Int = 50
    @AppStorage("progressPage") var progressPage = 1
    
    @State private var numberInput: String = ""
    var body: some View {
        ZStack() {
            
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.70, green: 0.95, blue: 0))
                    .cornerRadius(519)
                    .offset(x: -130, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(508)
                    .offset(x: -43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(493)
                    .offset(x: 43, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82, height: 6)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(484)
                    .offset(x: 130, y: 0)
            }
            .frame(width: 342, height: 6)
            .offset(x: 0.50, y: -363)
            
            // Prompt text
            Text("For accurate results,\nwhat’s your age?")
                .font(Font.custom("Lufga", size: 24))
                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23))
                .offset(x: 0, y: -232)
                .multilineTextAlignment(.center)
            
            // Continue Button
            Button (action: cont){
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 320, height: 50)
                        .background(Color(red: 0, green: 0.32, blue: 0.27))
                        .cornerRadius(34)
                        .offset(x: 0, y: 0)
                    Text("Continue")
                        .font(Font.custom("Lufga", size: 18))
                        .foregroundColor(Color(red: 0.70, green: 0.95, blue: 0))
                        .offset(x: 0, y: 0.50)
                }
            }
            .frame(width: 320, height: 50)
            .offset(x: 0.50, y: 327)
            
            // Type age here
            CustomTextField(placeholder: "Type here", text: $numberInput, fontSize: 30)
                .font(Font.custom("Lufga", size: 30))
                .frame(width: 0, height: 50)
                .foregroundColor(Color(red: 0, green: 0.27, blue: 0.23).opacity(0.25))
                .offset(x: -1, y: -96.50)
                .keyboardType(.numberPad)
                .padding()
                .multilineTextAlignment(.center)
            
        }
        .frame(width: 1000, height: 1500)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97));
    }
    
    func cont(){
        sliderValue = Int(numberInput) ?? 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            progressPage = 2
        }
    }
}

// Custom text field for typing age with a done button above the numpad
struct CustomTextField: UIViewRepresentable {
    var placeholder: String
    @Binding var text: String
    var fontSize: CGFloat // Add fontSize parameter

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.keyboardType = .numberPad
        textField.font = UIFont.systemFont(ofSize: fontSize) // Set the font size here
        textField.textAlignment = .center
        
        // Set the font using UIFont
        textField.font = UIFont(name: "Lufga", size: 30)
        
        // Set the text color
        textField.textColor = UIColor(Color(red: 0, green: 0.27, blue: 0.23).opacity(0.25))
        
        // Add a "Done" button to the keyboard
        let toolbar = UIToolbar()
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: context.coordinator, action: #selector(context.coordinator.doneButtonTapped))
        ]
        toolbar.sizeToFit()
        textField.inputAccessoryView = toolbar
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField
        
        init(_ parent: CustomTextField) {
            self.parent = parent
        }
        
        @objc func doneButtonTapped() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            // Update the SwiftUI state with the text field's current text
            DispatchQueue.main.async {
                self.parent.text = textField.text ?? ""
            }
        }
    }
}

#Preview {
//    ProgressTabView()
    AgeView()
}
