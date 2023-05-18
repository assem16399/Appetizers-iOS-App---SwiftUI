//
//  APButton.swift
//  Appetizers
//
//  Created by Aasem Hany on 11/05/2023.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    let action: () -> Void

    var body: some View {
        
        Button(action:action,label: {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
        })
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(.red)
        .padding(15)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "$\(String(format: "%.2f", 20.0)) - Add To Order") {}
    }
}
