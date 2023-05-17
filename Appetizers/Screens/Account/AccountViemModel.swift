//
//  AccountViemModel.swift
//  Appetizers
//
//  Created by Aasem Hany on 16/05/2023.
//

import Foundation

final class AccountViewModel: ObservableObject {
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    
    var isValidForm: Bool {
        guard user.isNotEmpty else {
            alertItem = AlertContext.missingInput
            return false
        }
        guard user.userEmail.isValidEmail else {
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
