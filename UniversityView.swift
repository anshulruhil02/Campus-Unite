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
            VStack{
                VStack{
                    Text(university.name)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .padding()
                        .foregroundColor(.black)
                    
                    Text("-" + university.location)
                        .italic()
                        .padding()
                        .foregroundColor(.black)
                }.padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
                Spacer()
                ScrollView{
                    LazyVGrid(columns : columns , spacing: 100){
                        VStack{
                            NavigationLink {
                                rommateView()
                            } label: {
                                Image("rommate")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .shadow(radius: 10)
                                    .clipShape(Circle())
                            }
                            Text("Rommate finder")
                        }
                        
                        VStack{
                            NavigationLink{
                                PartyView()
                            } label: {
                                Image("party")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)

                            }
                            Text("Party finder")
                        }
                        
                        VStack{
                            NavigationLink {
                                GreekLifeView()
                            } label: {
                                Image("greekLife")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)

                            }
                            Text("Greek Life")
                        }
                        
                        VStack{
                            NavigationLink {
                                groceryView()
                            } label: {
                                Image("grocery")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)

                            }
                            Text("Grocery Store")
                        }
                        
                        VStack{
                            NavigationLink {
                                giveawayView()
                            } label: {
                                Image("giveaway")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)

                            }
                            Text("Giveaways")
                        }
                        
                        VStack{
                            NavigationLink {
                                ClubView()
                            } label: {
                                Image("nightclub")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)

                            }
                            Text("Nightclubs")
                        }
                        
                        VStack{
                            NavigationLink {
                                EatsView()
                            } label: {
                                Image("eat")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                            }
                            Text("Places to eat")
                        }.shadow(radius: 10)
                        
                        VStack{
                            NavigationLink {
                                BarsView()
                            } label: {
                                Image("bars")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)

                            }
                            .clipShape(Circle())
                            Text("Bars")
                        }
                        
                        VStack{
                            NavigationLink {
                                meetupView()
                            } label: {
                                Image("meetup")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)

                            }
                            .clipShape(Circle())
                            Text("Meetups")
                        }
                    }.padding()
                }.padding()
            }
    }
}


struct UniversityView_Previews: PreviewProvider {
    static let  university:[University] = Bundle.main.decode("universityInfo.json")
    static var previews: some View {
        UniversityView(university: university[0])
    }
}
