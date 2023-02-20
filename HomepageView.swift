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
    @State private var showMenu = false
    @State private var searchQuery = ""
    var body: some View {
        NavigationView{
            VStack{
                
                Spacer()
                
                VStack{
                    Text("Connecting students,")
                        .italic()
                    
                    Text("building connections")
                        .italic()
                }
                
                Spacer()
                
                Rectangle() // the line that divides the list of universities
                    .frame(height: 2)
                    .foregroundColor(.gray)
                    .padding(.vertical)
                
                HStack {
                    TextField("Search for university", text: $searchQuery)
                        .padding()
                        .frame(height: 2)
                    Button(action: {
                        self.searchQuery = ""
                    }, label: {
                        Image(systemName: "magnifyingglass")
                    })
                }.padding()

                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        let university:[University] = Bundle.main.decode("universityInfo.json") // decode and collect information from the json file
                        let filteredUniversity = university.filter {$0.name.contains(searchQuery.lowercased().trimmingCharacters(in: .whitespaces)) || $0.abbreviation.contains(searchQuery.lowercased())}
                        // this will give a scrollable Hstack of universities with their logos
                        ForEach(filteredUniversity) { u in
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
                                            .shadow(radius: 10)
                                            .padding()
                                        
                                        
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
            }//main Vstack
            .navigationBarItems(trailing:
                                    HStack {
                NavigationLink {
                    profileView()
                }label: {
                    Image("profile-pic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                        .padding()
                }
                
                
                Menu {
                    Button("About") {
                        self.showMenu = true
                    }
                    Button(action: {
                        do {
                            try Auth.auth().signOut()
                            self.isUserLoggedIn = false
                        } catch let signOutError as NSError {
                            print ("Error signing out: %@", signOutError)
                        }
                    }, label: {
                        Text("Sign out")
                            .foregroundColor(.red)
                    })
                } label: {
                    Image(systemName: "line.horizontal.3")
                }
                .background(
                    NavigationLink(destination: AboutView(), isActive: $showMenu) {
                    })
            }
            )
        } // navigationview
    }// body
}// struct
