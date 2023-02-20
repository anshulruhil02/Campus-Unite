//
//  giveawayView.swift
//  CampusUniteNew
//
//  Created by Anshul Ruhil on 2023-01-22.
//

import SwiftUI

struct giveawayView: View {
    var body: some View {
        VStack{
            Text("Find students selling second hand items!")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(.black)
                .background(.white)
                .padding()
        }.padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        
        Spacer()    }
}

struct giveawayView_Previews: PreviewProvider {
    static var previews: some View {
        giveawayView()
    }
}
