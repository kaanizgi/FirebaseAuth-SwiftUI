//
//  LogoutViewModel.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import Foundation
import Firebase

class SuccesViewModel:ObservableObject {
    
    @Published var goBack = false
    @Published var Name = ""
    @Published var UserPp = ""
        
    
    init() {
        getUser()
    }
    
    
    func Logout() {
        do {
            try Auth.auth().signOut()
            self.goBack = true
        }
          catch { print("already logged out") }
    }
    
    func getUser () {
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        db.collection("users").whereField("useruid", isEqualTo: uid!).addSnapshotListener { snspsot, error in
            if error == nil {
                DispatchQueue.main.async {
                    for i in snspsot!.documents {
                        self.UserPp = i["profilUrl"] as! String
                        self.Name = i["name"] as! String
                    }
                }
            }else {
                print(error?.localizedDescription)
            }
        }
    }
}


