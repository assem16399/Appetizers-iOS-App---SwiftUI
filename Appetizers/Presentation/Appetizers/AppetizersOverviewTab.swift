//
//  AppetizersOverviewTab.swift
//  Appetizers
//
//  Created by Aasem Hany on 03/05/2023.
//

import SwiftUI

struct AppetizersOverviewTab: View {
    @StateObject private var viewModel = AppetizersViewModel()
    var body: some View {
        NavigationStack {
            ZStack{
                if(!viewModel.hasNotData)
                {
                    AppetizersListView(appetizers: viewModel.getAppetizers())
                }else{
                    Text("You Have No Data")
                        .font(.title)
                }

                if (viewModel.isLoading){ LoadingView() }
            }
            .navigationTitle("🍟Appetizers")
        }
        .onAppear{
            viewModel.getAppetizers()
        }
        .alert(item: $viewModel.alertItem){
            alertItem in
            Alert(title: alertItem.title,message: alertItem.message,dismissButton: alertItem.dismissButton )
        }
    }
    
}

struct AppetizersOverviewTab_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersOverviewTab()
    }
}


struct AppetizersListView:View {
    let appetizers:[Appetizer]
    var body: some View{
        List(appetizers, id: \.id){
            appetizer in
            AppetizersListCell(appetizer: appetizer)
        }
    }
}
