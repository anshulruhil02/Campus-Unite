//
//  ClubView.swift
//  CampusUniteNew
//
//  Created by Anshul Ruhil on 2023-01-18.
//

import SwiftUI

struct ClubView: View {
    var body: some View {
        VStack{
            Text("Find the best clubs!")
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

struct ClubView_Previews: PreviewProvider {
    static var previews: some View {
        ClubView()
    }
}
