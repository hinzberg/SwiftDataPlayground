//
//  Item.swift
//  SwiftDataDemoApplication
//
//  Created by Holger Hinzberg on 14.10.23.
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
