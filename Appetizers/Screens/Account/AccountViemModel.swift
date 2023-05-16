//
//  AccountViemModel.swift
//  Appetizers
//
//  Created by Aasem Hany on 16/05/2023.
//

import Foundation

final class AccountViewModel: ObservableObject {
    @Published  var userFirstName = ""
    @Published  var userLastName = ""
    @Published  var userEmail = ""
    @Published  var birthdate = Date()
    @Published  var hasExtraNapkins = false
    @Published  var hasFrequentRefills = false
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !userFirstName.isEmpty && !userLastName.isEmpty && !userEmail.isEmpty else {
            alertItem = AlertContext.missingInput
            return false
        }
        guard userEmail.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
  
    func saveChanges() {
        guard isValidForm else { return }
        print("Changes Saved Successfully")
    }
    
    
}
