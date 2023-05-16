//
//  Alert.swift
//  Appetizers
//
//  Created by Aasem Hany on 07/05/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {
    
    //MARK: - Netwrok Alerts
    
    static let invalidData =
    AlertItem(title: Text("Server Error"),
              message: Text("The data recieved from the server is invalid. Please contact support."),
              dismissButton: .default(Text("OK")))
    
    static let invalidResponse =
    AlertItem(title: Text("Server Error"),
              message: Text("Invalid response from the server. Please try again latter or contact support."),
              dismissButton: .default(Text("OK")))
    
    static let invalidURL =
    AlertItem(title: Text("Server Error"),
              message: Text("There was an issue connecting to the server. If this presists, please contact support."),
              dismissButton: .default(Text("OK")))
    
    static let unableToComplete =
    AlertItem(title:Text("Server Error"),
              message: Text("Unable to complete your request at this time. Please check your internet connection."),
              dismissButton: .default(Text("OK")))
    
    //MARK: - Account Alerts

    static let invalidEmail =
    AlertItem(title:Text("Invalid Email"),
              message: Text("Please enter a valid email address"),
              dismissButton: .default(Text("OK")))
    
    
    static let missingInput =
    AlertItem(title:Text("Missing Input"),
              message: Text("Please enter all required fields"),
              dismissButton: .default(Text("OK")))
}
