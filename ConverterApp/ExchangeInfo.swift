//
//  ExchangeInfo.swift
//  ConverterApp
//
//  Created by Pelin Aybar on 3.02.2024.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss //bu çıkarmak istediğimiz özelliği çevreden alma.
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                //title text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3) //harf aralığı
                    .foregroundStyle(.black)
                //description text
                Text("Generating random paragraphs can be an excellent way for writers to get their creative flow going at the beginning of the day. The writer has no idea what topic the random paragraph will be about when it appears. This forces the writer to use creativity to complete one of three common writing challenges. The writer can use the paragraph as the first one of a short story and build upon it.")
                    .font(.title2)
                    .padding()
                //exchange rates
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny) //tekrarlamayı azaltıcaz ve kodumuzu daha düzenli hale getirmek için başka bir görünüm üzerinden yapıyoruz.
                ExchangeRate(leftImage: .goldpenny, text: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)
                ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpenny, text: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
                //done button
                Button("Done"){
                    dismiss()
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black) //dark mode da kullanmak için ön plan stilini değiştirdik.
        }
    }
}

#Preview {
    ExchangeInfo()
}


