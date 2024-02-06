//
//  CurrencyIcon.swift
//  ConverterApp
//
//  Created by Pelin Aybar on 5.02.2024.
//

import SwiftUI

struct CurrencyIcon: View {
    let imageIcon : ImageResource
    let textIcon: String
    var body: some View {
        ZStack(alignment: .bottom ){ //vstack alta oluşturmak yerine parantez içinden yaptık.
            Image(imageIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                Text(textIcon)
                    .padding(3)
                    .font(.caption)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .background(.brown .opacity(0.75))
        }
        .padding(3)
        .frame(width: 100,height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
        
    }
}

#Preview {
    CurrencyIcon(imageIcon: .goldpiece, textIcon: "Gold Piece")
}
