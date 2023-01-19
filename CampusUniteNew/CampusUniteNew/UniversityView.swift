//
//  UniversityView.swift
//  CampusUnite
//
//  Created by Anshul Ruhil on 2023-01-17.
//

import SwiftUI

struct UniversityView: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let university: University
    var body: some View {
        NavigationView{
            //            VStack(alignment: .leading){
            //                Text(university.location)
            //                    .italic()
            //                // Text(university.description)
            //            }.offset(x:-120, y: -350)
            
            ScrollView{
                LazyVGrid(columns : columns ){
                    VStack{
                        NavigationLink {
                            GreekLifeView()
                        } label: {
                            Image("greekLife")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                        Text("Greek Life")
                    }
                    
                    VStack{
                        NavigationLink {
                            ClubView()
                        } label: {
                            Image("nightclub")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                        Text("Nightclubs")
                    }
                    
                    VStack{
                        NavigationLink {
                            EatsView()
                        } label: {
                            Image("eat")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                        Text("Places to eat")
                    }
                    
                    VStack{
                        NavigationLink {
                            BarsView()
                        } label: {
                            Image("bars")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                        Text("Bars")
                    }
                    
                }
                .padding([.horizontal, .bottom])
            }
            
        }.navigationTitle(university.name)
    }
}

struct UniversityView_Previews: PreviewProvider {
    static let  university:[University] = Bundle.main.decode("universityInfo.json")
    static var previews: some View {
        UniversityView(university: university[0])
    }
}
