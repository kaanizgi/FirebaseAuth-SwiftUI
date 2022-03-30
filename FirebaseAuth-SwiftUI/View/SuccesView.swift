//
//  SuccesView.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import SwiftUI

struct SuccesView: View {
    
    @ObservedObject private var ViewModel = LogoutViewModel()
    var body: some View {
        NavigationView {
            VStack {
                
            }.fullScreenCover(isPresented: $ViewModel.goBack) {
                ContentView()
            }
            .navigationTitle("Succes Screen")
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(.stack)
            .navigationBarItems(trailing:
            Button(action: {
                ViewModel.Logout()
            }, label: {
                Text("Log Out")})
            )
        }
    }
}

struct SuccesView_Previews: PreviewProvider {
    static var previews: some View {
        SuccesView()
    }
}
