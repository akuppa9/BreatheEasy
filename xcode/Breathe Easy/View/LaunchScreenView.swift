//
//  LaunchScreenView.swift
//  Breathe Easy
//
//  Created by Nikhil Kumar on 3/14/24.
//

import SwiftUI

struct LaunchScreenView: View {
  var body: some View {
    VStack(spacing: 0) {
      Rectangle()
        .foregroundColor(.clear)
        .frame(width: 100, height: 100)
        .background(
            Image("LungIcon").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
        )
    }
    .padding(EdgeInsets(top: 181, leading: 0, bottom: 181, trailing: 0))
    .frame(width: 1000, height: 1500)
    .background(Color(red: 0.70, green: 0.95, blue: 0));
  }
}

#Preview {
    LaunchScreenView()
}
