//
//  AppetizersViewModel.swift
//  Appetizers
//
//  Created by Aasem Hany on 06/05/2023.
//

import Foundation


@MainActor final class AppetizersViewModel: ObservableObject{
    @Published private var appetizers = [Appetizer]()
    @Published var alertItem:AlertItem?
    @Published var isLoading = false
    @Published var hasNoData = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer:Appetizer?
    
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
                    if(self.appetizers.isEmpty) {hasNoData = true}
                case .failure(let failure):
                    hasNoData = true
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
    
    func getAppetizers2() {
        isLoading = true
        Task{
            do{
                appetizers = try await NetworkManager.shared.getAppetizers2()
                hasNoData = false
            }
            catch{
                hasNoData = true
                guard let error = error as? customError else {
                    alertItem = AlertContext.invalidResponse
                    return
                }
                switch error {
                
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                case .unableToComplete:
                    alertItem = AlertContext.unableToComplete
                default:
                    alertItem = AlertContext.invalidResponse
                }

            }
            isLoading = false

        }
        NetworkManager.shared.getAppetizers{ (result) in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    if(self.appetizers.isEmpty) {hasNoData = true}
                case .failure(let failure):
                    hasNoData = true
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
