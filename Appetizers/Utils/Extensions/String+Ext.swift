//
//  String+Ext.swift
//  Appetizers
//
//  Created by Aasem Hany on 16/05/2023.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", options: .caseInsensitive)
            let range = NSRange(location: 0, length: self.utf16.count)
            let matches = emailRegex.matches(in: self, options: [], range: range)
            return !matches.isEmpty
    }
}
