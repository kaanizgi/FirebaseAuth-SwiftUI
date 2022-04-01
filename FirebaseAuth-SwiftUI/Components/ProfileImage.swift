//
//  ProfileImage.swift
//  FirebaseAuth-SwiftUI
//
//  Created by Kaan İzgi on 1.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileImage: View {
    var imageUrl:String
    var body: some View {
        WebImage(url: URL(string: imageUrl))
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(imageUrl: "")
    }
}
