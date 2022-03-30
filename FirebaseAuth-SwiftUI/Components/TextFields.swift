//
//  TextFields.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import SwiftUI

struct TextFields: View {
    @State var id:String
    @State var placeholder:String
    @State var image:String
    var body: some View {
        HStack {
            Image(systemName: "\(image)")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding()
            TextField("\(placeholder)", text: $id)
                .foregroundColor(.white)
            
        }.background(.gray)
            .cornerRadius(8)
            
    
    }
}

struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        TextFields(id: "mail", placeholder: "Mail Adresi", image: "mail")
    }
}
