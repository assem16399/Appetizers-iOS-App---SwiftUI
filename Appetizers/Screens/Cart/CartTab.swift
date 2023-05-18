//
//  OrdersOverviewTab.swift
//  Appetizers
//
//  Created by Aasem Hany on 03/05/2023.
//

import SwiftUI

struct CartTab: View {
    @State private var cartItems = AppetizersMockData.ordersMock
    var body: some View {
        NavigationStack {
            VStack {
                
                List{
                    ForEach(AppetizersMockData.ordersMock){
                        appetizer in
                        AppetizersListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                
                APButton(title: "$\(34.3100000000,specifier:"%0.2f") - Place Order "){}
            }
            .navigationTitle("🛒Cart")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        cartItems.remove(atOffsets: offsets)
    }
}

struct OrdersOverviewTab_Previews: PreviewProvider {
    static var previews: some View {
        CartTab()
    }
}
