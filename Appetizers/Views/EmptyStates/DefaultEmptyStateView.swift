//
//  CartEmptyStateView.swift
//  Appetizers
//
//  Created by Aasem Hany on 21/05/2023.
//

import SwiftUI

struct DefaultEmptyStateView: View {
    let systemNameImage: String
    let msg: String
    var body: some View {
        ZStack{
            Color(.white)
                .ignoresSafeArea(.all)
            VStack{
               
                Image(systemName: systemNameImage)
                    .resizable()
                    .symbolRenderingMode(.palette)
                    .foregroundColor( .brandPrimary)
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text(msg)
                .font(.title3)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                
            }
        }
        .padding()
    }
}

struct CartEmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultEmptyStateView(systemNameImage: "cart.badge.plus", msg: """
Your cart is empty.
Start filling your cart now.
""")
    }
}
