//
//  Item.swift
//  ConverterApp
//
//  Created by Pelin Aybar on 2.02.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
