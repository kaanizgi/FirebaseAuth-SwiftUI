//
//  LoginViewModel.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import Foundation
import Firebase

class LoginViewModel:ObservableObject {
    
    
    @Published var isTrue = false
    @Published var goBack = false
    
    func Login(email:String,password:String) {
        Auth.auth().signIn(withEmail: email, password: password) { data, error in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                self.isTrue = true
            }
        }
    }
    
    func Logout() {
        do {
            try Auth.auth().signOut()
            self.goBack = true
        }
          catch { print("already logged out") }
    }
}
