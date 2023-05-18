//
//  AccountViemModel.swift
//  Appetizers
//
//  Created by Aasem Hany on 16/05/2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @AppStorage("user") private var userData: Data?
    
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
    
  
    func saveUserChanges() {
        guard isValidForm else { return }
        do{
            userData = try JSONEncoder().encode(user)
            alertItem = AlertContext.dataSavedInCacheSuccessfully
        }
        catch{
            alertItem = AlertContext.unableToSaveInCache
        }
    }
    
    func retrieveUser() {
        guard let userData else { return }
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        }
        catch{
            alertItem = AlertContext.unableToRetrieveFromCache
        }
    }
    
    
}
