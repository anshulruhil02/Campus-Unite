//
//  AboutView.swift
//  CampusUniteNew
//
//  Created by Anshul Ruhil on 2023-01-23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack{
            Text("How to use the app?")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(.black)
                .background(.white)
                .padding()
        }.padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        
        Spacer()
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
