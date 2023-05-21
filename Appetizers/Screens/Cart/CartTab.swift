//
//  OrdersOverviewTab.swift
//  Appetizers
//
//  Created by Aasem Hany on 03/05/2023.
//

import SwiftUI

struct CartTab: View {
    @EnvironmentObject var userCart: Cart
    var body: some View {
        NavigationStack {
            
            VStack {
                if userCart.cartItems.isEmpty {
                    DefaultEmptyStateView(systemNameImage: "cart.badge.plus", msg: "Your cart is empty🥲.\nStart filling it now🤤.")
                }else{
                    List{
                        ForEach(userCart.cartItems){
                            appetizer in
                            AppetizersListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItem )
                    }
                    
                    APButton(title: "$\(userCart.totalPrice, specifier:"%0.2f") - Place Order "){}
                }
            }
            .navigationTitle("🛒Cart")
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        userCart.delete(at: offsets)
    }
}

struct OrdersOverviewTab_Previews: PreviewProvider {
    static var previews: some View {
        CartTab()
    }
}
