//
//  EatsView.swift
//  CampusUniteNew
//
//  Created by Anshul Ruhil on 2023-01-18.
//

import SwiftUI

struct EatsView: View {
    var body: some View {
        VStack{
            Text("Best Resteraunts")
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

struct EatsView_Previews: PreviewProvider {
    static var previews: some View {
        EatsView()
    }
}
