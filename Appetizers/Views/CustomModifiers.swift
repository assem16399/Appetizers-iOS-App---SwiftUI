//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Aasem Hany on 22/05/2023.
//

import Foundation
import SwiftUI

struct DefaultButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.brandPrimary)
    }
}
