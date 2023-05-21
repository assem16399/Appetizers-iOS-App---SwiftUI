//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Aasem Hany on 03/05/2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var userCart = Cart()
    var body: some Scene {
        WindowGroup {
            AppetizersTabView()
                .environmentObject(userCart)
        
        }
    }
}
