//
//  RegisterView.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject private var ViewModel = RegisterViewModel()
    
    @State private var image = UIImage()
    @State private var showSheet = false
    
    @State private var name = ""
    @State private var mail = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Register")
                .font(.title).bold()
            ZStack {
                Image(uiImage: self.image)
                    .resizable()
                    .cornerRadius(50)
                    .frame(width: 125, height: 125)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .onTapGesture {
                        showSheet = true
                    }
                Image(systemName: "plus")
                    .foregroundColor(.yellow)
                    .frame(width: 20, height: 20)
            }
            .padding(.horizontal, 20)
            .sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }
            TextFields(binding: $name, placeholder: "Name Input", image: "person")
            TextFields(binding: $mail, placeholder: "Mail Input", image: "mail")
            SecureTextFields(password: $password, image: "eye.slash", placeholder: "Password Input")
            Button {
                ViewModel.Register(mail: mail, password: password, name: name, image: image)
            } label: {
                Text("Register")
                    .font(.title3).bold()
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth:.infinity)
            }
            .background(.blue)
            .cornerRadius(16)
            Spacer()
        }
        .padding()
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
