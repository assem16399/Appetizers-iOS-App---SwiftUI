//
//  AccountTab.swift
//  Appetizers
//
//  Created by Aasem Hany on 03/05/2023.
//

import SwiftUI

struct AccountTab: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var date = Date()
    @State private var extraNapkins = false
    @State private var frequentRefills = false
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    TextField("First Name", text: $firstName)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)
                    
                    TextField("Last Name", text: $lastName)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)
                    
                    TextField("Email", text: $lastName)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    
                    DatePicker("Birthday", selection: $date, displayedComponents: .date)
                    
                    Button{}label: {
                        Text("Save Changes")
                    }
                }header: {
                    Text("PERSONAL INFO")
                }
            
                Section{
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    Toggle("Frequent Refills", isOn: $frequentRefills)
                }header: {
                    Text("Requests")
                }
                .tint(.brandPrimary)
            }
                .navigationTitle("🥹Account")
        }
    
    }
}

struct AccountTab_Previews: PreviewProvider {
    static var previews: some View {
        AccountTab()
    }
}
