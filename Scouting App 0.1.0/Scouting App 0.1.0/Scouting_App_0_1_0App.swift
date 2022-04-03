//
//  Scouting_App_0_1_0App.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/6/22.
//

import SwiftUI
import Firebase

@main
struct Scouting_App_0_1_0App: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            Home()
        }
    }
}
