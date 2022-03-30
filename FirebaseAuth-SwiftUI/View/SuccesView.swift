//
//  SuccesView.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuccesView: View {
    
    @ObservedObject private var ViewModel = SuccesViewModel()
    var body: some View {
        NavigationView {
            VStack {
                
            }.fullScreenCover(isPresented: $ViewModel.goBack) {
                ContentView()
            }
            .navigationTitle("Succes Screen")
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(.stack)
            .navigationBarItems(leading:
                                    WebImage(url: URL(string: ViewModel.UserPp)).resizable().frame(width: 50, height: 50)
                .clipShape(Circle())
            )
            .navigationBarItems(trailing:
            Button(action: {
                ViewModel.Logout()
            }, label: {
                Text(ViewModel.Name)})
            )
        }
    }
}

struct SuccesView_Previews: PreviewProvider {
    static var previews: some View {
        SuccesView()
    }
}
