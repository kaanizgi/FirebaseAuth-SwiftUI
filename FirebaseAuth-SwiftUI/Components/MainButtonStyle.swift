//
//  MainButtonStyle.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 1.04.2022.
//

import Foundation
import SwiftUI

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.title3.bold())
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(maxWidth:.infinity)
            .background(.blue)
            .cornerRadius(16)
    }
}
