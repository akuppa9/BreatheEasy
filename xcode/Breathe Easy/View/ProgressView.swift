//
//  ProgressView.swift
//  Breathe Easy
//
//  Created by Nikhil Kumar on 3/12/24.
//

import SwiftUI

struct ProgressView: View{
    @AppStorage("progressPage") var progressPage = 0
    var body: some View{
        if (progressPage == 0){
            QuestionnaireWelcome()
        } else if (progressPage == 1){
            AgeView()
        } else if (progressPage == 2){
            GenderSelected()
        } else if (progressPage == 3){
            WorkOutdoorsView()
        } else {
            OutdoorActivitesView()
        }
    }
}

#Preview {
    ProgressView()
}
