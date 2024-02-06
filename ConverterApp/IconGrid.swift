//
//  IconGrid.swift
//  ConverterApp
//
//  Created by Pelin Aybar on 5.02.2024.
//

import SwiftUI

struct IconGrid: View {
    
    @Binding var currency : Currency
    
    var body: some View {
        LazyVGrid(columns:[GridItem(),GridItem(),GridItem()]){
//alt çizgi 0 ı kabul eder başlar saklar. Aslında onu kullnam demek alt çizgi
            //eğer kullnamak istersek isim vermeliyiz mesela "loop in"
            //ve loop=0 saklıyor
            ForEach(Currency.allCases){ currency in
                if self.currency == currency {
                    CurrencyIcon(imageIcon: currency.image, textIcon: currency.name)
                        .shadow(color:.yellow, radius: 10)
                        .overlay{ //yer paylaşımı para üstüne koymak gibi düşün
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(lineWidth: 10)
                                .foregroundColor(.brown)
                                .opacity(0.4)
                        }
                }else{
                    CurrencyIcon(imageIcon: currency.image, textIcon: currency.name)
                        .onTapGesture { //seçildiğinde
                            self.currency = currency
                        }
                }
            }
        }
        .padding(.bottom)    }
}

#Preview {
    IconGrid(currency: .constant(.silverPenny))
}
