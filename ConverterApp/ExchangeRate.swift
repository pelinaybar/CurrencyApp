//
//  ExchangeRate.swift
//  ConverterApp
//
//  Created by Pelin Aybar on 3.02.2024.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage : ImageResource
    let text : String
    let rightImage : ImageResource
    
    var body: some View {
        HStack{
            //left image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
            //text paragragh
            Text(text)
            //right image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
        }
    }
}

#Preview{
    //önce yukarda tanımladık sonra kaynak gösterip yaptık.
    ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
}
