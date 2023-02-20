//
//  BarsView.swift
//  CampusUniteNew
//
//  Created by Anshul Ruhil on 2023-01-18.
//

import SwiftUI

struct BarsView: View {
    var body: some View {
        VStack{
            Text("Students' favourite bar")
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

struct BarsView_Previews: PreviewProvider {
    static var previews: some View {
        BarsView()
    }
}
