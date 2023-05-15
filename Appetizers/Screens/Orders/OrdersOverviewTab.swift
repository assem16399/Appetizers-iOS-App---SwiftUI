//
//  OrdersOverviewTab.swift
//  Appetizers
//
//  Created by Aasem Hany on 03/05/2023.
//

import SwiftUI

struct OrdersOverviewTab: View {
    var body: some View {
        NavigationStack {
            Text("Orders Overview")
                .navigationTitle("🛍️Orders")
        }
    }
}

struct OrdersOverviewTab_Previews: PreviewProvider {
    static var previews: some View {
        OrdersOverviewTab()
    }
}
