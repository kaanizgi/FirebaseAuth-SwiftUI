//
//  FirebaseAuth_SwiftUIApp.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import SwiftUI
import Firebase

@main
struct FirebaseAuth_SwiftUIApp: App {
    init() {
           FirebaseApp.configure()
       }
    var body: some Scene {
        WindowGroup {
            RegisterView()
        }
    }
}
