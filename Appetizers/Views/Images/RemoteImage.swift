//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Aasem Hany on 08/05/2023.
//

import SwiftUI


final class ImageLoader: ObservableObject {
    @Published var image: Image?

    func load(fromURLString url: String) {
        NetworkManager.shared.downloadImage(fromUrlString: url){uiImage in
            guard let uiImage else{return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage:View {
    var image: Image?
    var body: some View{
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

