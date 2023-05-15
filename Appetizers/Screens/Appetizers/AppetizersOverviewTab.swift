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
        ZStack{
            NavigationStack {
                ZStack{
                    if(!viewModel.hasNotData)
                    {
                        AppetizersListView(
                            appetizers: viewModel.getAppetizers(),
                            isShowingDetail: $viewModel.isShowingDetail,
                            selectedAppetizer: $viewModel.selectedAppetizer
                        )
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
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            .disabled(viewModel.isShowingDetail)
            .alert(item: $viewModel.alertItem){
                alertItem in
                Alert(title: alertItem.title,message: alertItem.message,dismissButton: alertItem.dismissButton )
            }
            
            if viewModel.isShowingDetail {
                AppetizerDetailCardView(
                    appetizer: viewModel.selectedAppetizer!,
                    isShowingDetailView: $viewModel.isShowingDetail)
            }
            
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
    @Binding var isShowingDetail:Bool
    @Binding var selectedAppetizer:Appetizer?
    
    var body: some View{
        
        List(appetizers, id: \.id){
            appetizer in
            AppetizersListCell(appetizer: appetizer)
                .onTapGesture {
                    isShowingDetail = true
                    selectedAppetizer = appetizer
                }
        }
        
        
        
    }
}
