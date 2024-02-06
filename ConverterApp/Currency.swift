//
//  Currency.swift
//  ConverterApp
//
//  Created by Pelin Aybar on 5.02.2024.
//
import SwiftUI
//caseitareble tüm değerlerin bir koleksiyonunu sağlayan bir tür.
enum Currency: Double, CaseIterable, Identifiable {
    
    case copperPenny = 6400
    case goldPenny = 4
    case silverPenny = 64
    case goldPiece = 1
    case silverPiece = 16
    
    var id: Currency { self }

    
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .goldPenny:
                .goldpenny
        case .silverPiece:
                .silverpiece
        case .goldPiece:
                .goldpiece
        }
    }
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .goldPenny:
            "Gold Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPiece:
            "Gold Piece"
        }
    }
        //parametre gerekli bilgiler demektir.
        // -> dönüştür demek
        //parametreleri dönüşütürüp string olarak dize  de veriyor.
    func convert(_ amountString: String, to currency: Currency) -> String{
        guard let doubleAmount = Double(amountString)else{
            return ""
        }
        let convertedAmount = (doubleAmount / self.rawValue) * (currency.rawValue)
        
        return String(format: "%.1f",(convertedAmount))
    }
}
