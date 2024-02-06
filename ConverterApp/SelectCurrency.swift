//
//  SelectCurrency.swift
//  ConverterApp
//
//  Created by Pelin Aybar on 3.02.2024.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss //bu çıkarmak istediğimiz özelliği çevreden alma.
    @Binding var topCurrency : Currency //binding konuşma sağlıyor özelliği taşıyor
    @Binding var bottomCurrency : Currency
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                //icons
                IconGrid(currency: $topCurrency) //dolar işareti konuşturur
                    .padding(.bottom)
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                //icons
                IconGrid(currency: $bottomCurrency)
                
                //done
                Button("Done"){
                    dismiss()
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}


#Preview {
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPenny))
    //binding constant ifadeyle kullanılmalı
}
