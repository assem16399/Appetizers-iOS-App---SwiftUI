//
//  AppetizersListItemView.swift
//  Appetizers
//
//  Created by Aasem Hany on 04/05/2023.
//

import SwiftUI

struct AppetizersListCell: View {
    let appetizer: Appetizer
    var body: some View {
        HStack(spacing:15){
            AppetizerRemoteimage(imageUrl: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120,height: 90)
                .cornerRadius(12)
            
            VStack(alignment:.leading, spacing: 5.0){
                Text(appetizer.name)
                    .font(.title2)
                    .lineLimit(2)
                    .minimumScaleFactor(0.6)
                    .fontWeight(.medium)
                
                Text("$\(String(format: "%.2f", appetizer.price))")
                    .font(.title3)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
            }
            Spacer()
        }
    }
}

struct AppetizersListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListCell(appetizer: AppetizersMockData.sampleAppetizer)
    }
}
