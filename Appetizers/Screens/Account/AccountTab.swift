//
//  AccountTab.swift
//  Appetizers
//
//  Created by Aasem Hany on 03/05/2023.
//

import SwiftUI

struct AccountTab: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header: Text("PERSONAL INFO")){
                    TextField("First Name", text: $viewModel.userFirstName)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)
                    
                    TextField("Last Name", text: $viewModel.userLastName)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)
                    
                    TextField("Email", text: $viewModel.userEmail)
                        .autocorrectionDisabled(true)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    
                    DatePicker("Birthday", selection: $viewModel.birthdate, displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
            
                Section{
                    Toggle("Extra Napkins", isOn: $viewModel.hasExtraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.hasFrequentRefills)
                }header: {
                    Text("Requests")
                }
                .tint(.brandPrimary)
            }
                .navigationTitle("🥹Account")
                .alert(item: $viewModel.alertItem){alert in
                    Alert(title: alert.title,message: alert.message,dismissButton: alert.dismissButton)
                }
        }
    
    }
}

struct AccountTab_Previews: PreviewProvider {
    static var previews: some View {
        AccountTab()
    }
}
