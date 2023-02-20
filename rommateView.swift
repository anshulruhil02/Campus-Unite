//
//  rommateView.swift
//  CampusUniteNew
//
//  Created by Anshul Ruhil on 2023-01-22.
//

import SwiftUI

struct rommateView: View {
    var body: some View {
        VStack{
            Text("Find your roommate!")
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

struct rommateView_Previews: PreviewProvider {
    static var previews: some View {
        rommateView()
    }
}
