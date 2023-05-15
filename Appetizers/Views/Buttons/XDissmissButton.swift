//
//  XDissmissButton.swift
//  Appetizers
//
//  Created by Aasem Hany on 11/05/2023.
//

import SwiftUI

struct XDissmissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 40,height: 40)
                .foregroundColor(.white)
                .shadow(radius: 40)
            
            Image(systemName: "xmark")
                .foregroundColor(.black)
                .imageScale(.small)
        }
    }
}

struct XDissmissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDissmissButton()
    }
}
