//
//  ContentView.swift
//  Appetizers
//
//  Created by Aasem Hany on 03/05/2023.
//

import SwiftUI

struct AppetizersTabView: View {
    var body: some View {
        TabView {
            AppetizersOverviewTab()
                .tabItem{
                    Image(systemName: "house")
                    Text("Appetizers")
                }
            CartTab()
                .tabItem{
                    Image(systemName: "cart")
                    Text("Cart")
                }
            AccountTab()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
        }
        .tint(.brandPrimary)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
    }
}
