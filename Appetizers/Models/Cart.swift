//
//  Cart.swift
//  Appetizers
//
//  Created by Aasem Hany on 21/05/2023.
//

import SwiftUI

final class Cart: ObservableObject{
    @Published var cartItems = [Appetizer]()
    
    var totalPrice: Double{
        var sum = 0.0
        cartItems.forEach{cartItem in
            sum += cartItem.price
        }
        return sum
    }
    
    func add(_ appetizer:Appetizer) {
        cartItems.append(appetizer)
    }
    
    func delete(at offsetss: IndexSet){
        cartItems.remove(atOffsets: offsetss)
    }
}
