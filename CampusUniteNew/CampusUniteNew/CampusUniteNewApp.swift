//
//  CampusUniteNewApp.swift
//  CampusUniteNew
//
//  Created by Anshul Ruhil on 2023-01-18.
//


import SwiftUI
import Firebase

@main
struct CampusUniteNewApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

 
