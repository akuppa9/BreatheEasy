import SwiftUI

struct NameView: View {
    @State private var name: String = ""
    var placeholder: String = "e.g. John Doe"
    
    var body: some View {
        VStack{
            Color(.darkGray)
                .ignoresSafeArea()
            TextField(placeholder, text: $name)
                .foregroundStyle(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                .font(.system(size: UIScreen.main.bounds.height / 38, design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .textFieldStyle(OvalTextFieldStyle())
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
 Text("You typed: \(name)")
 }*/
