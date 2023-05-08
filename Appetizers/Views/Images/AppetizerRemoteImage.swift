//
//  AppetizersRemoteImage.swift
//  Appetizers
//
//  Created by Aasem Hany on 08/05/2023.
//

import SwiftUI

struct AppetizerRemoteimage:View {
    @StateObject var imageLoader = ImageLoader()
    let imageUrl:String
    
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear{ imageLoader.load(fromURLString: imageUrl) }
    }
}

struct AppetizerRemoteimage_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerRemoteimage(imageUrl: "")
    }
}
