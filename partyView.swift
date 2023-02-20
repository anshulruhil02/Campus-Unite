//
//  partyView.swift
//  CampusUniteNew
//
//  Created by Anshul Ruhil on 2023-01-22.
//

import SwiftUI

struct PartyView: View {
    var body: some View {
        VStack{
            Text("Find a party in your area!")
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

struct partyView_Previews: PreviewProvider {
    static var previews: some View {
        PartyView()
    }
}
