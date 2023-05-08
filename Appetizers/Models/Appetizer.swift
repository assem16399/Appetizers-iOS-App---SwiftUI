//
//  Appetizer.swift
//  Appetizers
//
//  Created by Aasem Hany on 03/05/2023.
//

import Foundation


struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String
    let description: String
    let price: Double
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizersResponse: Decodable {
    let request: [Appetizer]
}

struct AppetizersMockData{
    static let sampleAppetizer = Appetizer(id: 1, name: "Appetizer Name", imageURL: "", description: "This is the description of the appetizer", price: 9.99, calories: 345, protein: 87, carbs: 40)
    
    static let appetizersMock = Array(repeating: AppetizersMockData.sampleAppetizer, count: 20)
}

