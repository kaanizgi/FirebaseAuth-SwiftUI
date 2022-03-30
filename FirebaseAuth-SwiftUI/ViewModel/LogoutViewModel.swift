//
//  LogoutViewModel.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import Foundation
import Firebase

class LogoutViewModel:ObservableObject {
    
    @Published var goBack = false
    
    func Logout() {
        do {
            try Auth.auth().signOut()
            self.goBack = true
        }
          catch { print("already logged out") }
    }
}


