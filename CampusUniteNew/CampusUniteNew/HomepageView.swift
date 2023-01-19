//
//  HomepageView.swift
//  CampusUnite
//
//  Created by Anshul Ruhil on 2023-01-17.
//

import SwiftUI
import FirebaseAuth

struct HomepageView: View {
    @Binding var isUserLoggedIn: Bool
    var body: some View {
        NavigationView{
            VStack{
                
                Spacer()
                Text("Connecting students,")
                    .italic()
                
                Text("building connections")
                    .italic()
                
                Spacer()
                
                Rectangle() // the line that divides the list of universities
                    .frame(height: 2)
                    .foregroundColor(.gray)
                    .padding(.vertical)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        let university:[University] = Bundle.main.decode("universityInfo.json") // decode and collect information from the json file
                        
                        // this will give a scrollable Hstack of universities with their logos
                        ForEach(university) { u in
                            NavigationLink {
                                UniversityView(university: u)
                            }label: {
                                HStack{
                                    VStack {
                                    Image(u.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 100))


                                    
                                        Text(u.abbreviation)
                                            .foregroundColor(.primary)
                                            .font(.headline)
                                    }
                                    
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }.navigationTitle("Campus Unite")
                Button(action: {
                    do {
                        try Auth.auth().signOut()
                        self.isUserLoggedIn = false
                    } catch let signOutError as NSError {
                        print ("Error signing out: %@", signOutError)
                    }
                }, label: {
                    Text("Sign out")
                })


            }
//            Spacer()
//            Button(action: {
//                do {
//                    try Auth.auth().signOut()
//                    self.isUserLoggedIn = false
//                } catch let signOutError as NSError {
//                    print ("Error signing out: %@", signOutError)
//                }
//            }, label: {
//                Text("Sign out")
//            })
        }
    }
}

//struct HomepageView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomepageView()
//    }
//}
