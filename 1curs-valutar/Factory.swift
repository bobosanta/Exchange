//
//  Factory.swift
//  1curs-valutar
//
//  Created by Dan Pop on 01/05/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import Foundation

class Factory {
    class func currenciesFromJson(json: [String: AnyObject]) -> [Currency] {
        var currencies = [Currency]()

        let bankJson = json["bnr"] as? [String: AnyObject]
        let currenciesJsonArray = bankJson?["results"] as? [[String: AnyObject]]
        for currencyJson in currenciesJsonArray ?? [[String: AnyObject]]() {
            let currency = currencyJson["currency"] as? String
            let sellValueString = currencyJson["sell_value"] as? String ?? "0.0"
            let sellValue = Double(sellValueString as! String)
            currencies.append(Currency(currency: currency ?? "", sellValue: sellValue ?? 0.0))
        }
        
        return currencies
    }
    
    class func currencyFromJson(json: [String: AnyObject]) -> Currency? {
        var currencies = [Currency]()
        
        let bankJson = json["bnr"] as? [String: AnyObject]
        let currenciesJsonArray = bankJson?["results"] as? [[String: AnyObject]]
        if let currencyJson = currenciesJsonArray?.first as? [String: AnyObject] {
        let currency = currencyJson["currency"] as? String
            let sellValueString = currencyJson["sell_value"] as? String ?? "0.0"
            let sellValue = Double(sellValueString as! String)
            return Currency(currency: currency ?? "", sellValue: sellValue ?? 0.0)
        }
        return nil
    }
}
