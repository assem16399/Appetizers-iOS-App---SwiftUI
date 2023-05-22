//
//  ContentView.swift
//  Appetizers
//
//  Created by Aasem Hany on 03/05/2023.
//

import SwiftUI

struct AppetizersTabView: View {
    @EnvironmentObject var userCart: Cart
    var body: some View {
        TabView {
            AppetizersOverviewTab()
                .tabItem{ Label("Appetizers", systemImage: "house") }
            CartTab()
                .tabItem{ Label("Cart", systemImage: "cart") }
                .badge(userCart.cartItems.count)
            AccountTab()
                .tabItem{ Label("Account", systemImage: "person") }
        }
        .tint(.brandPrimary)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
    }
}
