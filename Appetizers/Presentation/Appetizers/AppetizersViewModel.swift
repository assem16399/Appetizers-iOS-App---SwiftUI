//
//  AppetizersViewModel.swift
//  Appetizers
//
//  Created by Aasem Hany on 06/05/2023.
//

import Foundation


final class AppetizersViewModel: ObservableObject{
    @Published private var appetizers = [Appetizer]()
    @Published var alertItem:AlertItem?
    @Published var isLoading = false
    @Published var hasNotData = false
    
    func getAppetizers() -> [Appetizer] {
        appetizers
    }
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers{ (result) in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    if(self.appetizers.isEmpty) {hasNotData = true}
                case .failure(let failure):
                    hasNotData = true
                    switch failure {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }

}
