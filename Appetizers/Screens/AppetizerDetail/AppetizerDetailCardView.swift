//
//  AppetizerDetailCardView.swift
//  Appetizers
//
//  Created by Aasem Hany on 08/05/2023.
//

import SwiftUI

struct AppetizerDetailCardView: View {
    let appetizer:Appetizer
    @Binding var isShowingDetailView:Bool
    var body: some View {
        VStack{
            AppetizerRemoteimage(imageUrl: appetizer.imageURL)
                .frame(width:300,height: 225)
                .aspectRatio(contentMode: .fit)
            
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal,20)

            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.6)
                .padding()
            
            NutritionFacts(appetizer: appetizer)
            
            Spacer()
            
            APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add To Cart"){
                
            }
        }
            .frame(width: 300,height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(alignment: .topTrailing){
                Button{
                    isShowingDetailView = false
                }label:{ XDissmissButton() }
                .padding()
            }
    }
}

struct AppetizerDetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailCardView(appetizer: AppetizersMockData.sampleAppetizer,isShowingDetailView: .constant(true))
    }
}

struct SingleNutritionFact: View {
    let label:String
    let value:String
    var body: some View {
        VStack(spacing: 5){
            Text(label)
                .font(.caption)
                .bold()
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct NutritionFacts: View {
    let appetizer:Appetizer
    var body: some View {
        HStack(spacing: 40){
            SingleNutritionFact(label: "Calories", value: "\(appetizer.calories)")
            SingleNutritionFact(label: "Protein", value: "\(appetizer.protein)")
            SingleNutritionFact(label: "Carbs", value: "\(appetizer.carbs)")
        }
    }
}
