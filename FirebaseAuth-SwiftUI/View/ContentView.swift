//
//  ContentView.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @ObservedObject private var ViewModel = LoginViewModel()
    @State var mail = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Text("Sign In")
                .font(.title)
                .bold()
            Image("login")
                .resizable()
                .frame(height:225)
                .frame(maxWidth:.infinity)
                .padding(.vertical)
            TextFields(binding: $mail, placeholder: "Mail Input", image: "mail")
            SecureTextFields(password: $password, image: "pencil", placeholder: "Password Input")
            
            Button {
                ViewModel.Login(email: mail.lowercased(), password: password)
            } label: {
                Text("Sign In")
            }.buttonStyle(MainButtonStyle())
                .fullScreenCover(isPresented: $ViewModel.isTrue) {
                    SuccesView()
                }
                .alert(ViewModel.Error, isPresented: $ViewModel.ShowAlert) {
                    Button("OK", role: .cancel) { }
                }
            Spacer()
            
            Button {
                ViewModel.goRegister = true
            } label: {
                Text("Register Screen")
                    .font(.title3)
            }.sheet(isPresented: $ViewModel.goRegister) {
                RegisterView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

