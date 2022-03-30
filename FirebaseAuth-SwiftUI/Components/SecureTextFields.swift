//
//  SecureTextFields.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import SwiftUI

struct SecureTextFields: View {
    @Binding var password:String
    var image:String
    var placeholder:String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                SecureField("Password", text: $password)
                    .frame(height:50)
                    .cornerRadius(16)
            }
            Divider()
        }
    }
}

