//
//  ViewController.swift
//  1curs-valutar
//
//  Created by Dan Pop on 01/05/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currencies: [Currency]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = getTodayString()
        APIClient.getCurrency(date: Date(), bank: "bnr") { (response) in
            self.currencies = response
            let dayBeforeDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
            for currency in self.currencies ?? [Currency]() {
                APIClient.getCurrencyForCoin(date: dayBeforeDate, bank: "bnr", coin: currency.currency) { newCurrency in
                    self.tableView.reloadData()
                    
                }
            }

            print(response)
            let today = Calendar.current.dateComponents([.weekday], from: Date()).weekday
            print(today!)
        }
       
}

    func getTodayString() -> String{
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        let today_string = "Last update " + String(day!) + "-" + String(month!) + "-" + String(year!) + " at " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        
        dateLabel.text = today_string
        return today_string
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCellId") as? CurrencyTableViewCell
        cell?.coin.text = currencies?[indexPath.row].currency
        cell?.sellValue.text = "\(currencies?[indexPath.row].sellValue ?? 0.0) RON"
        
        return cell ?? UITableViewCell()
    }
    
    
}
