//
//  User.swift
//  Appetizers
//
//  Created by Aasem Hany on 17/05/2023.
//

import Foundation

struct User: Codable {
    var userFirstName = ""
    var userLastName = ""
    var userEmail = ""
    var birthdate = Date()
    var hasExtraNapkins = false
    var hasFrequentRefills = false
    
    
    var isNotEmpty:Bool{
        guard !userFirstName.isEmpty && !userLastName.isEmpty && !userEmail.isEmpty else {
            return false
        }
        return true
    }
}
