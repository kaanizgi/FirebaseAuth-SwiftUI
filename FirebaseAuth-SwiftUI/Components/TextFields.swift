//
//  TextFields.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import SwiftUI

struct TextFields: View {
    @Binding var binding:String
    var placeholder:String
    var image:String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "\(image)")
                TextField(placeholder, text: $binding)
                    .frame(height:50)
                    .cornerRadius(16)
            }
            Divider()
        }
    }
}

