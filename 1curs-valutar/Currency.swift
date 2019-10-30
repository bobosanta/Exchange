//
//  Currency.swift
//  1curs-valutar
//
//  Created by Dan Pop on 01/05/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import Foundation

class Currency: NSObject {
    var currency: String
    var sellValue: Double
    
    init(currency: String, sellValue: Double) {
        self.currency = currency
        self.sellValue = sellValue
    }
    
}
