//
//  APIClient+Currencies.swift
//  1curs-valutar
//
//  Created by Dan Pop on 01/05/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import Foundation

extension APIClient {
    class func getCurrency(date: Date? = Date(), bank: String, completion: @escaping (_ currency: [Currency]?) -> Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date!)
        let path = "currency/key=f26b1d31a9b6e5d127c559d2b63c80b2/data=\(dateString)/banca=\(bank)"
        get(path: path) { json in
            if let data = (json as? String)?.data(using: .utf8) {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let json = jsonData {
                        let currencies = Factory.currenciesFromJson(json: json as [String : AnyObject])
                        print(json)
                        completion(currencies)
                    } else {
                        completion(nil)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    class func getCurrencyForCoin(date: Date? = Date(), bank: String, coin: String, completion: @escaping (_ currency: Currency?) -> Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date!)
        let path = "currency/key=f26b1d31a9b6e5d127c559d2b63c80b2/data=\(dateString)/moneda=\(coin)/banca=\(bank)"
        get(path: path) { json in
            if let data = (json as? String)?.data(using: .utf8) {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let json = jsonData {
                        let currency = Factory.currencyFromJson(json: json as [String : AnyObject])
                        print(json)
                        completion(currency)
                    } else {
                        completion(nil)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
