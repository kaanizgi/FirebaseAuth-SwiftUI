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
    @Published var goRegister = false
    @Published var Error = ""
    @Published var ShowAlert = false
    
    
    func Login(email:String,password:String) {
        Auth.auth().signIn(withEmail: email, password: password) { data, error in
            if error != nil {
                self.Error = error?.localizedDescription ?? "error"
                self.ShowAlert = true
            }else {
                self.isTrue = true
            }
        }
    }
}
