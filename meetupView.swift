//
//  meetupView.swift
//  CampusUniteNew
//
//  Created by Anshul Ruhil on 2023-01-23.
//

import SwiftUI

struct meetupView: View {
    var body: some View {
        Text("Organize meetups")
            .font(.system(size: 40, weight: .bold, design: .rounded))
            .foregroundColor(.black)
            .background(.white)
            .padding()
    }
}

struct meetupView_Previews: PreviewProvider {
    static var previews: some View {
        meetupView()
    }
}
