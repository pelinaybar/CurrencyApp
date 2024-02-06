//
//  CurrencyTip.swift
//  ConverterApp
//
//  Created by Pelin Aybar on 6.02.2024.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    // ? -- isteğe bağlı bir metin türü yapmak için
    // nil -- hiçbir değer olmadığı anlamına gelir
    var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency Screen")
}
