//
//  groceryView.swift
//  CampusUniteNew
//
//  Created by Anshul Ruhil on 2023-01-22.
//

import SwiftUI

struct groceryView: View {
    var body: some View {
        VStack{
            Text("Grocery Stores!")
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

struct groceryView_Previews: PreviewProvider {
    static var previews: some View {
        groceryView()
    }
}
