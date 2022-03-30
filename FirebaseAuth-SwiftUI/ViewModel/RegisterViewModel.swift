//
//  RegisterViewModel.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import Foundation
import Firebase
import UIKit

class RegisterViewModel:ObservableObject {
    
    func Register(mail:String,password:String,name:String,image:UIImage) {
        
        //input check
        if mail != "" && name != "" && password != "" {
            let storage = Storage.storage()
            let storageReferance = storage.reference()
            let uuid = UUID().uuidString
            let mediaFolder = storageReferance.child("media")
            if let data = image.jpegData(compressionQuality: 1) {
                let imagereferenca = mediaFolder.child("\(uuid).jpg")
                imagereferenca.putData(data, metadata: nil) { metadata, error in
                    if error != nil {
                        
                    }else {
                        imagereferenca.downloadURL { url, error in
                            if error == nil {
                                let imageUrl = url?.absoluteString
                                Auth.auth().createUser(withEmail: mail, password: password) { data, error in
                                    if error == nil {
                                        let db = Firestore.firestore()
                                        var ref:DocumentReference
                                        var currentUser = Auth.auth().currentUser?.uid
                                        ref = db.collection("users").addDocument(data: [
                                            "useruid":currentUser ?? "",
                                            "name":name,
                                            "email":mail,
                                            "profilUrl":imageUrl ?? "",
                                            "time":FieldValue.serverTimestamp()
                                        ]
                                            , completion: { error in
                                            if error == nil {
                                                print("succes")
                                            }else {
                                                print(error?.localizedDescription)
                                            }
                                        })
                                    }else {
                                        print(error?.localizedDescription)
                                    }
                                }
                            }else {
                                print("empty input")
                            }
                        }
                    }
                    
                }
            }
        }
    }
}
