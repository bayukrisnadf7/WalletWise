//
//  Item.swift
//  WalletWise
//
//  Created by Bayu Krisna Dwihadi Fahrizal on 09/06/26.
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
