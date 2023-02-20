//
//  resetPasswordView.swift
//  CampusUniteNew
//
//  Created by Anshul Ruhil on 2023-02-02.
//

import SwiftUI

struct resetPasswordView: View {
    @State var email = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack(spacing: 16){
                
                TextField("Email", text: $email)
                    .foregroundColor (.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray)
                
                
                Button{
                    //do something
                } label: {
                    Text("Send reset link")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Reset Password")
            
        }
    }
}

struct resetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        resetPasswordView()
    }
}
